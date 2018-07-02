package com.jxdedu.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jxdedu.biz.RoleBiz;
import com.jxdedu.biz.UserBiz;
import com.jxdedu.entity.Roletable;

@Controller
@SessionAttributes({"username","role"}) 

public class UserController {
    
    Logger logger = Logger.getLogger(UserController.class.getName()); 
    
    @Resource(name="userBiz")
    private UserBiz biz;
    @Resource(name="role")
    private RoleBiz roles;
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public String login(String loginName, String loginPassword, Model model){
        logger.debug("用户登录:" + loginName + ":" + loginPassword + ":");       
        if (biz.isValid(loginName, loginPassword)){ // 登录成功
        	int userid = biz.getUserByName(loginName);
            model.addAttribute("username", loginName);
            model.addAttribute("userid", userid);
            return "redirect:change.do";
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
    @RequestMapping("/change")
    public String dologin(int userid ,Model model){
    	int currentpage = 1;
    	Roletable role = roles.getRoleByuserId(userid);
    	model.addAttribute("role", role);
    	model.addAttribute("currentpage", currentpage);
    	return "redirect:StudentManage.do";
    }
   
}
