package team.afeng.jxgl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
