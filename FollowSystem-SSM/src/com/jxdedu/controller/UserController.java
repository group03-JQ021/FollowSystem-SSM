package com.jxdedu.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jxdedu.biz.UserBiz;

@Controller
@SessionAttributes({"username"}) 
public class UserController {
    
    Logger logger = Logger.getLogger(UserController.class.getName()); 
    
    @Resource(name="userBiz")
    private UserBiz biz;
    
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public String login(String loginName, String loginPassword, Model model){
        logger.debug("用户登录:" + loginName + ":" + loginPassword + ":");
        
        if (biz.isValid(loginName, loginPassword)){ // 登录成功
            model.addAttribute("username", loginName);
            return "index";
        }else { // 登录失败
            model.addAttribute("loginMsg","登录失败");
            return "login";
        }
    }
    
    @RequestMapping(value="/login",method=RequestMethod.GET)
    public String login(){
        logger.debug("用户请求登录");
        return "login";
    }
   
}
