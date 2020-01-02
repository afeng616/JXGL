package team.afeng.jxgl.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.afeng.jxgl.listener.OnLineCountListener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.atomic.AtomicInteger;

@Controller
public class QuickStartController {

    @RequestMapping("start")
    @ResponseBody
    public String start() {
        return "hello SpringBoot";
    }

    @RequestMapping("/stu")
    public String stu() {
        return "/stu/index.html";
    }

    @RequestMapping("/tch")
    public String tch() {
        return "/tch/index.html";
    }

    @RequestMapping("/who")
    @ResponseBody
    public Object whoIm() {
        return SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

    @RequestMapping("/count")
    @ResponseBody
    public AtomicInteger count(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            Cookie cookie = new Cookie("JSESSIONID", URLEncoder.encode(request.getSession().getId(), "utf-8"));
//            cookie.setPath("/");
//            response.addCookie(cookie);
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
//        HttpSession session = request.getSession(true);
//        return (int) session.getServletContext().getAttribute("count");
        return OnLineCountListener.userCount;
    }


}
