
package com.jxdedu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.jxdedu.assit.PagingStatus;
import com.jxdedu.biz.UserBiz;
import com.jxdedu.entity.User;

@Controller
@SessionAttributes({"username"})
public class UserController {

    private Logger logger = Logger.getLogger(UserController.class.getName());

    @Resource(name="userBiz")
    private UserBiz biz;

    @RequestMapping(value="/login",method=RequestMethod.POST)
    public String login(String loginName, String loginPassword,HttpSession session, Model model){
        logger.debug("用户登录:" + loginName + ":" + loginPassword + ":");
        
        if (biz.isValid(loginName, loginPassword)){ // 登录成功
            logger.debug("登录成功:" + loginName);
            session.setAttribute("username", loginName);
            logger.debug("向会话"+ session.getId() + "添加属性:username=" +
                    session.getAttribute("username"));
            return "index";
        }else { // 登录失败
            model.addAttribute("loginMsg","登录失败");
            return "login";
        }
    }
    /* 因为把jsp都放在了 web-inf 下,所以用户登录实际上要用两次请求,怎么省去不必要的第一次? */
    @RequestMapping(value="/login",method=RequestMethod.GET)
    public String login(){
        logger.debug("用户请求登录页面");
        return "login";
    }
    
    /* 页面映射 */
    @RequestMapping("/toAddUser")
    public String toAddUser(){
        return "user/addUser";
    }
    /*---- 页面映射 */
    
    /**
     * 用户信息列表, 当前,用户还不能修改分页大小.
     * @param model
     * @return
     */             //pagingShowUser
    @RequestMapping("/pagingShowUser")
    public String pagingShow(Integer currentPage,HttpSession session, Model model){
        String psKey = "pagingStatus";
        PagingStatus ps = (PagingStatus)session.getAttribute(psKey);
        
        int totalCount = biz.getTotalCount();   // 数据库中当前记录总数
        

        /* 第一次进入分页界面, */
        if (ps == null){
            // 默认,当前页面 1, 分页大小 5,记录总数为现场查询的结果.
            ps = new PagingStatus(biz.getTotalCount());
            session.setAttribute(psKey, ps);
        }

        /* 当前页号 */
        //  应用存在逻辑错误,或用户使用非法URL访问.
        if (currentPage == null || currentPage < 1
                || currentPage > ps.getPageCount()){
            logger.warn("检测到非法分页页号:" + currentPage);
            // 纠正页号.
            currentPage = (currentPage == null ? 1 : (currentPage < 1 ? 1: ps.getPageCount()) );
            logger.warn("回归到页号:" + currentPage);
        }
        logger.info("分页查询, 页号:" + currentPage);
        ps.setCurrentPage(currentPage);

        /* 计算区间, 超尾区间 */
        int pageSize = ps.getPageSize();
        int lowerBound = pageSize * (currentPage - 1 ) + 1;
        int upperBound = lowerBound + pageSize;
        if (upperBound > totalCount+1){   // 为防止日后实现可能无法正确处理  upperBound 超出记录总数而导致异常
            upperBound = totalCount+1;    // 将过界的区间尾规范到正常范围
        }

        /* 获取当前分页的数据 */
        List<User> list = biz.getByRange(lowerBound, upperBound);

        if (list == null){
            logger.warn("分页查询结果为 null");
        }

        /* 向视图层传递数据 */
        model.addAttribute("list",list);
        return "user/paging-show-user";
    }

    /**
     * 查询指定用户是否存在;
     * @param userName
     * @return
     */
    @RequestMapping("/checkUserName")
    @ResponseBody
    public boolean doCheckUsername(String userName){
        logger.debug("验证用户名:"+userName);
        return biz.checkUserName(userName);
    }
    @RequestMapping("/checkLogin")
    @ResponseBody
    public boolean doCheckLogin(String userName,String password){
        logger.debug("验证登录凭证:"+userName +":"+password);
        return biz.isValid(userName, password);
    }
    
    @RequestMapping("/logout")
    public String doLogout(SessionStatus statues){
        //清除登录信息
        statues.setComplete();
        return "login";
    }
    
    //按姓名的模糊搜索
    @RequestMapping("/fuzzySearchByName")
    public String doFuzzySearchByName(String word,Integer currentPage,
            HttpSession session,Model model){
        String psKey = "pagingStatus";
        PagingStatus ps = (PagingStatus)session.getAttribute(psKey);
        
        int totalCount = biz.getFuzzyCountByName(word);   // 数据库中当前记录总数

        if (ps == null){
            // 默认,当前页面 1, 分页大小 5,记录总数为现场查询的结果.
            ps = new PagingStatus(totalCount);
            session.setAttribute(psKey, ps);
        }

        /* 当前页号 */
        //  应用存在逻辑错误,或用户使用非法URL访问.
        if (currentPage == null || currentPage < 1
                || currentPage > ps.getPageCount()){
            logger.warn("检测到非法分页页号:" + currentPage);
            // 纠正页号.
            currentPage = (currentPage == null ? 1 : (currentPage < 1 ? 1: ps.getPageCount()) );
            logger.warn("回归到页号:" + currentPage);
        }
        logger.info("分页查询, 页号:" + currentPage);
        ps.setCurrentPage(currentPage);

        /* 计算区间, 超尾区间 */
        int pageSize = ps.getPageSize();
        int lowerBound = pageSize * (currentPage - 1 ) + 1;
        int upperBound = lowerBound + pageSize;
        if (upperBound > totalCount+1){   // 为防止日后实现可能无法正确处理  upperBound 超出记录总数而导致异常
            upperBound = totalCount+1;    // 将过界的区间尾规范到正常范围
        }

        /* 获取当前分页的数据 */
        List<User> list = biz.fuzzySearchByNameWithRange(word,lowerBound, upperBound);

        if (list == null){
            logger.warn("分页查询结果为 null");
        }

        /* 向视图层传递数据 */
        model.addAttribute("list",list);
        model.addAttribute("url", "fuzzySearchByName.do");
        model.addAttribute("query", "&word="+word);
        return "user/paging-show-user";
        
    }
    
    
    @RequestMapping("/addUser")
    public String doAddUser(User user, Model model){
        boolean flag = false;
        if (user != null && biz.addUser(user)){
            flag = true;
        }
        model.addAttribute("flag",flag);
        model.addAttribute("user", biz.getUserByName(user));
        return "user/addUser";
    }
}

