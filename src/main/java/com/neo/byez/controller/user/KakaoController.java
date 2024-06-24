package com.neo.byez.controller.user;

import com.neo.byez.domain.user.UserDto;
import com.neo.byez.service.user.KakaoService;
import com.neo.byez.service.user.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;

import static com.neo.byez.common.message.ValidatorMessage.DUPLICATED_ID;

@Controller
public class KakaoController {

    private KakaoService kakaoService;
    private UserServiceImpl userService;

    @Autowired
    public KakaoController(KakaoService kakaoService, UserServiceImpl userService) {
        this.kakaoService = kakaoService;
        this.userService = userService;
    }

    private String getUserNickname(String code) throws Exception {
        // 인가코드 받기 (GET)
        // 카카오톡 서버 측에서 인가코드 넘겨줌. (-> String code)
        // code: h-Rsy9FNCPNEP9jhUsDgkRVTZwaAOe5Hzcctp6_gPGIYFxFecsY4yYn3NQYKPXUZAAABjxmtomH7Ewsnpgvovw
        String accessToken = kakaoService.getAccessTokenFromKakao("873c82dfa901cd280c11ee222e944826", code);
        HashMap<String, Object> userInfo = kakaoService.getUserInfo(accessToken);
        return (String) userInfo.get("nickname");
    }

    // 카카오 간편 로그인
    @RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model, HttpServletRequest request) throws Throwable {
        // 카카오 서버 측으로부터 전달 받은 닉네임 저장
        String nickname = getUserNickname(code);

        // 1. cust 테이블의 nickname 컬럼 조회
        // 1.1. 해당 유저의 닉네임 존재여부 확인
        // 1.1.1. 존재하는 경우
        // 1.1.1.1. model 객체에 해당 닉네임을 가진 유저의 id 저장하여 전송
        // 1.1.1.2. 메인화면으로 이동
        // 1.1.2. 존재하지 않는 경우
        // 1.1.2.1. 회원가입 페이지로 이동
        String userId = userService.getCustIdBySnsNickname(nickname);

        if (!userId.isEmpty()) {
            HttpSession session = request.getSession();
            session.setAttribute("loginState", "Y");
            session.setAttribute("userId", userId);
            return "index2";
        } else {
            model.addAttribute("showAlert", true);
            return "/user/requestEmailForm";
        }
    }

    // 카카오 계정 연동
    @RequestMapping(value = "/kakaoConnection", method = RequestMethod.GET)
    public String kakaoConnection(@RequestParam(value = "code", required = false) String code, Model model, HttpServletRequest request) throws Exception {
        // 카카오 서버 측으로부터 전달 받은 닉네임 저장
        String nickname = getUserNickname(code);

        // 2. 세션에 저장된 아이디 확인
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("userId");
        UserDto userDto = userService.getCustLoginInfo(id);

        // 2.1. 특정 조건 해당여부 확인
        try {
            // 2.1.1. 조건에 부합하는 경우
            // 2.1.1.1. 카카오 서버로부터 전달 받은 닉네임이 존재하는 경우
            // 2.1.1.2. 고객 테이블의 카카오 계정 연동여부 'N'인 경우
            // 2.1.1.3. 고객 테이블의 닉네임 컬럼에 저장된 값 없는 경우
            // 2.1.1.4. 전체 고객 닉네임 조회 결과 동일한 닉네임 없는 경우
            // 2.1.2. 아이디와 닉네임을 고객 테이블의 각 컬럼에 저장
            // 2.1.3. 다시 회원정보 변경 페이지로 이동
            if (nickname != null && userDto.getKakao_conn().equals("N") && userDto.getNickname() == null && userService.getCustIdBySnsNickname(nickname).isEmpty()) {
                session.setAttribute("nickname", nickname);
                userService.saveKakaoNickname(id, nickname);
                return "redirect:/mypage/modifyPage";
            }
            // 2.2 조건에 부합하지 않는 경우
            // 2.2.1. 다른 유저가 연동해둔 계정인 경우
            // 2.2.2. 이미 계정 연동 완료된 상태인 경우
            // 2.2.3. 계정이 존재하지 않는 경우
            else if ((userDto.getKakao_conn().equals("Y") || userDto.getNaver_conn().equals("Y")) && userDto.getNickname() != null){
                String encodedMessage = URLEncoder.encode("카카오 또는 네이버 계정이 이미 연동되어 있습니다.", StandardCharsets.UTF_8.toString());
                return "redirect:/mypage/modifyPage?msg=" + encodedMessage;
            } else if (userService.getCustIdBySnsNickname(nickname) != null && id != userService.getCustIdBySnsNickname(nickname)) {
                String encodedMessage = URLEncoder.encode("이미 사용 중인 계정입니다.", StandardCharsets.UTF_8.toString());
                return "redirect:/mypage/modifyPage?msg=" + encodedMessage;
            } else {
                String encodedMessage = URLEncoder.encode("카카오 계정이 존재하지 않습니다.", StandardCharsets.UTF_8.toString());
                return "redirect:/mypage/modifyPage?msg=" + encodedMessage;
            }
        } catch (Exception e) {
            return "errorPage";
        }
    }
}