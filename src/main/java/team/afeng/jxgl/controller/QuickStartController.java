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
}
