package com.jxdedu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 系统管理员界面
 * @author 陈希展 
 * @date 2018年6月25日
 */
@Controller
@RequestMapping("/sysadm")    // 在 /sysadmin 路径下
public class AdminController {
    @RequestMapping("index")
    public String showIndex(){
        return "sysadm/index";
    }

}
