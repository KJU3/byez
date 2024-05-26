package com.neo.byez.controller.item;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminItemController {


    @GetMapping("/admin/item")
    public String index() {
        return "adminItemList";
    }


    @GetMapping("/admin/itemRegisterForm")
    public String getRegisterForm() {
        return "adminItemRegister";
    }

    @GetMapping("/admin/itemForm")
    public String getModifyForm() {
        return "adminItemModify";
    }

    @GetMapping("/admin/itemStock")
    public String getStockForm() {
        return "adminItemStock";
    }

}
