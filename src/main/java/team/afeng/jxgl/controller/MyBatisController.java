package team.afeng.jxgl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.afeng.jxgl.entity.*;
import team.afeng.jxgl.mapper.StuMapper;

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
    private StuMapper stuMapper;

    @RequestMapping("query")
    @ResponseBody
    public List<User> queryUserList() {
        return stuMapper.queryUserList();
    }

    // 查看个人信息
    @RequestMapping("/stu/info")
    @ResponseBody
    public StuInfo queryUserInfo(HttpServletRequest request) {
        String id = request.getUserPrincipal().getName();
        return stuMapper.queryUserInfo(id);
    }

    // 登录
    @RequestMapping(value = "/user/login", method = RequestMethod.POST)
    @ResponseBody
    public boolean login(@RequestParam("id") String id, @RequestParam("password") String password) {
        return stuMapper.login(id, password);
    }

    // 上课任务
    @RequestMapping("/stu/course")
    @ResponseBody
    public List<Course> queryCourse(@RequestParam("week") int week) {
        // "courses": [{"cname": "Web技术开发", "teacher": "曹彩凤", "site": "北主楼101", "content": "如何学好Web开发", "time": "0102"}]
        return stuMapper.queryCourseInWeek(week);
    }

    // 考试安排
    @RequestMapping("/stu/exam")
    @ResponseBody
    public List<Exam> queryExam(HttpServletRequest request) {
        String id = request.getUserPrincipal().getName();
        return stuMapper.queryExam(id);
    }

    // 考试成绩
    @RequestMapping("/stu/score")
    @ResponseBody
    List<Score> queryScore(HttpServletRequest request) {
        String id = request.getUserPrincipal().getName();
        return stuMapper.queryScore(id);
    }

    // 学业预警
    @RequestMapping("/stu/warn")
    @ResponseBody
    List<Warn> queryWarn(HttpServletRequest request) {
        String id = request.getUserPrincipal().getName();
        return stuMapper.queryWarn(id);
    }

    // 考勤情况
    @RequestMapping("/stu/attendance")
    @ResponseBody
    List<Attendance> queryAttendance(HttpServletRequest request) {
        String id = request.getUserPrincipal().getName();
        return stuMapper.queryAttendance(id);
    }



}
