package team.afeng.jxgl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.afeng.jxgl.entity.*;
import team.afeng.jxgl.mapper.TchMapper;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    // 修改密码
    @RequestMapping("/tch/pwd")
    @ResponseBody
    public boolean alterPwd(HttpServletRequest request, @RequestParam("pwd") String pwd) {
        String tid = request.getUserPrincipal().getName();
        return tchMapper.alterPwd(tid, pwd);
    }

    // 查找姓名
    @RequestMapping("/tch/name")
    @ResponseBody
    public String queryUserName(HttpServletRequest request) {
        String tid = request.getUserPrincipal().getName();
        return tchMapper.queryUserName(tid);
    }

    // 查看个人信息
    @RequestMapping("/tch/info")
    @ResponseBody
    public TchInfo queryInfo(HttpServletRequest request) {
        String id = request.getUserPrincipal().getName();
        return tchMapper.queryInfo(id);
    }

    // 查看课表
    @RequestMapping("/tch/course")
    @ResponseBody
    public List<Course> queryCourseInWeek(HttpServletRequest request, @RequestParam("week") int week) {
        String tid = request.getUserPrincipal().getName();
        return tchMapper.queryCourseInWeek(tid, week);
    }

    // 查看考试安排
    @RequestMapping("/tch/exam")
    @ResponseBody
    public List<Exam> queryExam(HttpServletRequest request) {
        String tid = request.getUserPrincipal().getName();
        return tchMapper.queryExam(tid);
    }

    // 查看成绩
    @RequestMapping("/tch/score")
    @ResponseBody
    public List<Score> queryScore(HttpServletRequest request) {
        String tid = request.getUserPrincipal().getName();
        return tchMapper.queryScore(tid);
    }

    // 考勤情况
    @RequestMapping("/tch/attendance")
    @ResponseBody
    List<Attendance> queryAttendance(HttpServletRequest request) {
        String tid = request.getUserPrincipal().getName();
        return tchMapper.queryAttendance(tid);
    }


}
