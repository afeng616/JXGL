package team.afeng.jxgl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.afeng.jxgl.entity.TchInfo;
import team.afeng.jxgl.mapper.TchMapper;

import javax.servlet.http.HttpServletRequest;

/**
 * Author: Afeng
 * Date: 2019/12/31
 * Time: 16:16
 * Description:
 */
@Controller
public class TchController {
    @Autowired
    private TchMapper tchMapper;

    // 查看个人信息
    @RequestMapping("/tch/info")
    @ResponseBody
    public TchInfo queryInfo(HttpServletRequest request) {
        String id = request.getUserPrincipal().getName();
        return tchMapper.queryInfo(id);
    }




















}
