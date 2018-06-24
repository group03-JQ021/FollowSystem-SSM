package com.jxdedu.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jxdedu.biz.UserBiz;

@Controller
@SessionAttributes({"username","msg"}) 
public class UserController {
    
    Logger logger = Logger.getLogger(UserController.class.getName()); 
    
    @Resource(name="userBiz")
    private UserBiz biz;
    
    @RequestMapping("/login")
    public String login(String loginName, String loginPassword, Model model){
        logger.debug("用户登录:" + loginName + ":" + loginPassword);
        if (loginName != null && loginPassword != null 
                &&biz.isValid(loginName, loginPassword)){ // 登录成功
            model.addAttribute("username", loginName == null? "null":loginName);
            return "redirect:index.jsp";
        }else { // 登录失败
            
            return "login.jsp";
        }
    }
    
    @RequestMapping("/list-user")
    public String doListUser(Model model){
        
        
        return "WEB-INF/jsp/list-user.jsp";
    }
}
