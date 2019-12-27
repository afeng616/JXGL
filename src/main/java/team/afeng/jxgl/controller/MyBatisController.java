package team.afeng.jxgl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.afeng.jxgl.entity.User;
import team.afeng.jxgl.mapper.UserMapper;

import java.util.List;

/**
 * Author: Afeng
 * Date: 2019/12/22
 * Time: 10:08
 * Description: 参考 https://www.cnblogs.com/ityouknow/p/6037431.html
 */
@Controller
public class MyBatisController {
    @Autowired
    private UserMapper userMapper;

    @RequestMapping("query")
    @ResponseBody
    public List<User> queryUserList() {
        return userMapper.queryUserList();
    }

    // 登录
    @RequestMapping("login")
    @ResponseBody
    public boolean login() {


        return false;
    }


    // 查看个人信息
    @RequestMapping("info")
    @ResponseBody
    public String queryUserInfo() {
        // TODO: 获取用户学号信息
//        return userMapper.queryUserInfo(id);
        return "暂无";
    }





}
