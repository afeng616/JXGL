package team.afeng.jxgl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.afeng.jxgl.entity.StuInfo;
import team.afeng.jxgl.entity.User;
import team.afeng.jxgl.mapper.UserMapper;

import javax.servlet.http.HttpServletRequest;
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

    // 查看个人信息
    @RequestMapping("info")
    @ResponseBody
    public StuInfo queryUserInfo(HttpServletRequest request) {
        String user = request.getUserPrincipal().getName();
        return userMapper.queryUserInfo(user);
    }

    // 上课任务
    @RequestMapping("course")
    @ResponseBody
    public String queryCourse(@RequestParam("week") String week) {

        return "暂无第" + week + "周课表数据";
    }


    // 考试安排


    // 考试成绩


    // 学业预警


    // 考勤情况


}
