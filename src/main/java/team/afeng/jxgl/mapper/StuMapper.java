package team.afeng.jxgl.mapper;

import org.apache.ibatis.annotations.Select;
import team.afeng.jxgl.entity.*;

import java.util.List;

/**
 * Author: Afeng
 * Date: 2019/12/22
 * Time: 9:59
 * Description:
 */

public interface StuMapper {
    @Select("select * from tb_user")
    List<User> queryUserList();

    // 登录检索
    @Select("select count(*) from tb_user where id=#{id} and password=#{password}")
    boolean login(String id, String password);

    // 查看个人信息
    @Select("select * from tb_stuinfo where number = #{id}")
    StuInfo queryUserInfo(String id);

    // 查看本周课程
    @Select("select cname, tname, csite, content, ctime from tb_course " +
            "inner join tb_teach on tb_teach.cid=tb_course.cid " +
            "inner join tb_teacher on tb_teacher.tid=tb_teach.tid " +
            "where cw=#{week}")
    List<Course> queryCourseInWeek(int week);

    // 查看考试安排
    @Select("select tname, cname, esite, ebtime, eetime, etype from tb_exam " +
            "inner join tb_course on tb_course.cid=tb_exam.cid " +
            "inner join tb_teacher on tb_teacher.tid=tb_exam.tid " +
            "where id=#{id} order by `ebtime` asc")
    List<Exam> queryExam(String id);

    // 查看成绩
    @Select("select tname, cname, chours, ccredit, cscore from tb_score " +
            "inner join tb_course on tb_course.cid=tb_score.cid " +
            "inner join tb_teacher on tb_teacher.tid=tb_score.tid " +
            "where id=#{id}")
    List<Score> queryScore(String id);

    // 查看预警
    @Select("select number, name, semester, tb_warn.classnum, type from tb_warn " +
            "inner join tb_stuinfo on tb_stuinfo.number=tb_warn.id " +
            "where id=#{id}")
    List<Warn> queryWarn(String id);

    // 查看考勤
    @Select("select number, name, date, cname, type from tb_attendance " +
            "inner join tb_stuinfo on tb_stuinfo.number=tb_attendance.id " +
            "inner join tb_course on tb_course.cid=tb_attendance.cid " +
            "where id=#{id}")
    List<Attendance> queryAttendance(String id);
}
