package com.neo.byez.dao.item;

import static org.junit.Assert.*;

import com.neo.byez.dao.user.UserDaoImpl;
import com.neo.byez.domain.item.BasketDto;
import com.neo.byez.domain.item.BasketItemDto;
import com.neo.byez.domain.item.ItemDto;
import com.neo.byez.domain.user.UserDto;
import java.util.List;

import com.neo.byez.domain.user.UserDto;
import org.junit.Before;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.junit.Assert.assertNotNull;


// 결과 : [✅]테스트 완료(24/24)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@ExtendWith(SpringExtension.class)
public class BasketItemDaoImplTest {

    @Autowired
    private BasketDaoImpl basketDao;

    @Autowired
    private BasketItemDaoImpl basketItemDao;

    @Autowired
    private UserDaoImpl userDao;

    @Autowired
    private ItemDaoImpl itemDao;


    // 0. [✅]초기 테스트
    @Before
    public void 주입_상태_확인() {
        assertNotNull(userDao);
        assertNotNull(itemDao);
        assertNotNull(basketItemDao);
        assertNotNull(basketDao);
    }

    @BeforeEach
    public void 초기화() throws Exception {
        // 테이블 비우기
        // 장바구니 사품 지우기
        List<UserDto> users = userDao.selectUserAll();
        for (UserDto user : users) {
            BasketItemDto dto = new BasketItemDto();
            dto.setId(user.getId());
            basketItemDao.deleteAll(dto);
        }

        // 장바구니 지우기
        basketDao.deleteAll();

        // 상품 지우기
        itemDao.deleteAll();

        // 유저 지우기
        userDao.deleteAllUser();

    }



//
//    // 1. 핵심 기능 테스트 2차 구현[✅] 📝 밑에 문서 추후에 수정하기
//    // 1-0. 카운트 : 유저 장바구니 상품 개수 카운트 -> 성공(양 많이), 실패(적용 로우수 0)
//        // 카운트_성공() => 특정 유저 아이디로 상품 여러개 담아서 카운트
//        // 카운트_실패() => 없는 유저 아이디로 카운트 했을 때, 적용 로우수 0
//
//    // 1-1. 리스트 조회 : 유저 장바구니 상품 목록 조회 -> 성공(양 많이), 실패(리스트 길이 0), 예외 발생
//        // 리스트_조회_성공() => 특정 유저 아이디로 상품 목록 조회, 길이 넣은 수 만큼
//        // 라스트_조회_실패() => 없는 유저 아이디로 리스트 조회, 길이 0
//
//    // 1-2. 등록 : 유저 장바구니 상품 등록 -> 성공(양 많이), 실패(적용 로우수 0), 예외 발생
//        // 등록_성공() => 특정 유저 아이디에 많은 양의 상품 등록
//        // 등록_실패_1() => 없는 유저 아이디로 상품 등록, 적용 로우수, 예외 발생
//        // 등록_실패_2() => 아이디가 null로 상품 등록, 적용 로우수, 예외 발생
//
//    // 1-3. 단건 삭제 : 유저 장바구니 상품 삭제1(시퀀스 & 아이디) -> 성공(양 많이), 실패(적용 로우수 0), 예외 발생
//        // 단건_삭제_성공_1() => 유저 아이디에 등록된 특정 상품 삭제
//        // 단건_삭제_실패_1_1() => 유저 아이디에 등록되지 않은 상품 삭제(시퀀스 x)
//        // 단건_삭제_실패_1_2() => 등록되지 않은 유저 아이디에 상품 삭제, 적용 로우수 0
//        // 단건_삭제_실패_1_3() => 유저 아이디에 삭제된 내용을 여러번 삭제, 첫번째에서는 적용 로우수 1, 그 이후에는 0
//
//        // 단건_삭제_성공_2() => 등록된 dto로 삭제하는 경우, 적용 로우수 1
//        // 단건_삭제_실패_2_1() => 등록되지 않는 dto로 삭제하는 경우, 적용 로우수 0
//        // 단건_삭제_실패_2_2() => 등록되지 않은 유저 아이디에 dto로 상품 삭제, 적용 로우수 0
//        // 단건_삭제_실패_2_3() => 유저 아이디에 삭제된 상품을 여러번 삭제, 첫번째에서는 적용 로우수 1, 그 이후에는 0
//
//    // 1-4. 모든 상품 삭제 : 유저 장바구니 상품 모두 삭제 -> 성공(양 많이), 실패(적용 로우수 0), 예외 발생
//        // 모든_상품_삭제_성공() => 유저 아이디에 등록된 상품 모두 삭제, 적용 로우수 n, 카운트 0
//        // 모든_상품_삭제_실패() => 유저 아이디에 등록되지 않은 상품 모두 삭제, 적용 로우수 0
//
//    // 1-5. 수정 : 유저 장바구구니 상품 업데이트 -> 성공(양 많이), 실패(적용 로우수 0), 예외 발생
//        // 수정_성공() => 유저 장바구니 특정 상품 업데이트
//        // 수정_실패_1() => 없는 유저 장바구니 상품 업데이트, 적용 로우수 0
//        // 수정_실패_2() => 유저 없는 장바구니 상품 업데이트, 적용 로우수 0
//
//    // 1. 핵심 기능 테스트 2차 구현[]
//        // 1-0. 카운트 : 유저 장바구니 상품 개수 카운트 -> 성공(양 많이), 실패(적용 로우수 0)
//            // 카운트_성공() => 특정 유저 아이디로 상품 여러개 담아서 카운트
//            // 카운트_실패() => 없는 유저 아이디로 카운트 했을 때, 적용 로우수 0
//
//        // 1-1. 리스트 조회 : 유저 장바구니 상품 목록 조회 -> 성공(양 많이), 실패(리스트 길이 0), 예외 발생
//            // 리스트_조회_성공() => 특정 유저 아이디로 상품 목록 조회, 길이 넣은 수 만큼
//            // 라스트_조회_실패() => 없는 유저 아이디로 리스트 조회, 길이 0
//
//        // 1-2. 등록 : 유저 장바구니 상품 등록 -> 성공(양 많이), 실패(적용 로우수 0), 예외 발생
//            // 등록_성공() => 특정 유저 아이디에 많은 양의 상품 등록
//            // 등록_실패_1() => 없는 유저 아이디로 상품 등록, 적용 로우수, 예외 발생
//            // 등록_실패_2() => 아이디가 null로 상품 등록, 적용 로우수, 예외 발생
//
//        // 1-3. 단건 삭제 : 유저 장바구니 상품 삭제1(시퀀스 & 아이디) -> 성공(양 많이), 실패(적용 로우수 0), 예외 발생
//            // 단건_삭제_성공_1() => 유저 아이디에 등록된 특정 상품 삭제
//            // 단건_삭제_실패_1_1() => 유저 아이디에 등록되지 않은 상품 삭제(시퀀스 x)
//            // 단건_삭제_실패_1_2() => 등록되지 않은 유저 아이디에 상품 삭제, 적용 로우수 0
//            // 단건_삭제_실패_1_3() => 유저 아이디에 삭제된 내용을 여러번 삭제, 첫번째에서는 적용 로우수 1, 그 이후에는 0
//
//            // 단건_삭제_성공_2() => 등록된 dto로 삭제하는 경우, 적용 로우수 1
//            // 단건_삭제_실패_2_1() => 등록되지 않는 dto로 삭제하는 경우, 적용 로우수 0
//            // 단건_삭제_실패_2_2() => 등록되지 않은 유저 아이디에 dto로 상품 삭제, 적용 로우수 0
//            // 단건_삭제_실패_2_3() => 유저 아이디에 삭제된 상품을 여러번 삭제, 첫번째에서는 적용 로우수 1, 그 이후에는 0
//
//        // 1-4. 모든 상품 삭제 : 유저 장바구니 상품 모두 삭제 -> 성공(양 많이), 실패(적용 로우수 0), 예외 발생
//            // 모든_상품_삭제_성공() => 유저 아이디에 등록된 상품 모두 삭제, 적용 로우수 n, 카운트 0
//            // 모든_상품_삭제_실패() => 유저 아이디에 등록되지 않은 상품 모두 삭제, 적용 로우수 0
//
//        // 1-5. 수정 : 유저 장바구구니 상품 업데이트 -> 성공(양 많이), 실패(적용 로우수 0), 예외 발생
//            // 수정_성공() => 유저 장바구니 특정 상품 업데이트
//            // 수정_실패_1() => 없는 유저 장바구니 상품 업데이트, 적용 로우수 0
//            // 수정_실패_2() => 유저 없는 장바구니 상품 업데이트, 적용 로우수 0

    @DisplayName(" 카운트 성공 - 사용자의 장바구니 상품 개수 카운트")
    @ParameterizedTest(name="[{index}]. 사용자가 등록한 상품 수량 -> {0}")
    @ValueSource(ints = {10})
    public void test1(int n) throws Exception {
        insertData(n);
    }

    private void insertData(int amount) throws Exception {
        for (int i=1; i<=10; i++) {
            // 유저
            UserDto user = new UserDto(""+ i, "password" + i, "name" + i, 999999, 1, "M", 12345678, 1012345678, "test"+i+"@example.com", "user" + i, "user" + i);
            userDao.insertUser(user);

            // 장바구니
            BasketDto basket = new BasketDto();
            basket.setId(user.getId());
            basketDao.insert(basket);
        }

        for (int i=1; i<=amount; i++) {
            // 상품
            String num = String.valueOf(i);
            String name = "item" + String.valueOf(i);
            String itemType = "item-type" + String.valueOf(i);
            String custType = "cust-type" + String.valueOf(i);
            int price = i * 10000;
            int discPrice = i * 7000;
            String mainImg = "...";
            int reviewCnt = i * 500;
            double reviewRate = 3.5;
            int likeCnt = i * 50;
            String col = "#1234";
            ItemDto itemDto = new ItemDto(num, name, itemType, custType, price,
                    discPrice, mainImg, reviewCnt, reviewRate, likeCnt, col,
                    null, "manager1", null, "manager1");
            itemDao.insert(itemDto);

            // 장바구니 상품
            BasketItemDto basketItemDto = new BasketItemDto(0, "1", itemDto.getNum(), itemDto.getName(),
                    5000000, 5, "XL", "COL1", "M", null, null, "Y", null, null, null, null);
            basketItemDao.insert(basketItemDto);

        }


    }


}