package com.neo.byez.controller.item;


import com.neo.byez.domain.item.BasketItemDto;
import com.neo.byez.domain.item.Category;
import com.neo.byez.domain.item.ItemDetailPageDto;
import com.neo.byez.domain.item.ItemDto;
import com.neo.byez.service.item.BasketItemServiceImpl;
import com.neo.byez.service.item.ItemServiceImpl;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ItemController {

    private ItemServiceImpl itemService;

    private BasketItemServiceImpl basketItemService;


    @Autowired
    public ItemController(ItemServiceImpl itemService, BasketItemServiceImpl basketItemService) {
        this.itemService = itemService;
        this.basketItemService = basketItemService;
    }


    @GetMapping("/item/categories/{code}")
    public String list(@PathVariable String code, Model model, HttpSession session) {
        // 추가적으로 페이징 핸들러 처리
        Category category = new Category(code);
        int cnt = 0;
        try {
            // 세션에서 아이디 조회
            String id = (String) session.getAttribute("id");
            if (id != null) {
                BasketItemDto dto = new BasketItemDto();
                dto.setId(id);
                // 장바구니 상품 수량 조회
                cnt = basketItemService.getCount(dto);
            }

            // 카테고리 상품 조회
            List<ItemDto> list = itemService.readByCategory(category);

            model.addAttribute("cnt", cnt);
            model.addAttribute("list", list);
        } catch (Exception e) {
            model.addAttribute("errorMsg", e.getMessage());
            return "errorPage";
        }

        return "category";
    }

    @GetMapping("/item/categories/best")
    public String bestList() {
        // 베스트 상품들 조회
        // 페이지에 뿌리기
        System.out.println("best!");
        return "index";
    }

    @GetMapping("/item/categories/discount")
    public String discList() {
        // 할인 상품들 조회
        // 페이지에 뿌리기
        System.out.println("discount");
        return "index";
    }

    @GetMapping("/goods/{num}")
    public String detail(@PathVariable String num, Model model, HttpSession session) {
        int cnt = 0;
        try {
            // 세션에서 아이디 조회
            String id = (String) session.getAttribute("id");
            if (id != null) {
                BasketItemDto dto = new BasketItemDto();
                dto.setId(id);
                // 장바구니 상품 수량 조회
                cnt = basketItemService.getCount(dto);
            }

            ItemDetailPageDto itemDetail = itemService.readDetailItem(num);
            if (itemDetail == null) {
                throw new Exception("상세 상품 정보를 정상적으로 조회하지 못했습니다. 존재하지 않는 상품일 확률이 높습니다.");
            }

            model.addAttribute("cnt", cnt);
            model.addAttribute("itemDetail", itemDetail);
            System.out.println(itemDetail);

        } catch (Exception e) {
            model.addAttribute("errorMsg", e.getMessage());
            return "errorPage";
        }
        return "detail";
    }

    @PostMapping("/goods/{itemNum}")
    public String order(@PathVariable String itemNum, @RequestBody BasketItemDto dto) {
        // 해당 상품 조회
        // 해당 주문 내역 주문 페이지로 이동
        System.out.println("go to order!!");
        return "index";
    }


}
