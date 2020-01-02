package team.afeng.jxgl.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import team.afeng.jxgl.entity.*;

import java.util.List;

/**
 * Author: Afeng
 * Date: 2019/12/31
 * Time: 16:17
 * Description:
 */
public interface TchMapper {
    // 修改密码
    @Update("update tb_tchuser set password=#{pwd} where id=#{id}")
    boolean alterPwd(String id, String pwd);
    // FIXME: 允许重复录入
    // 录入成绩
    @Insert("insert into tb_score " +
            "value(#{id}, #{cid}, #{score}, #{tid})")
    boolean insertScore(String id, String cid, String tid, int score);

    // 获取姓名
    @Select("select tname from tb_teacher where tid=#{tid}")
    String queryUserName(String tid);

    // 用户查找
    @Select("select * from tb_tchuser where id=#{id}")
    User queryUser(String id);

    // 个人信息
    @Select("select * from tb_teacher where tid=#{tid}")
    TchInfo queryInfo(String tid);

    // 上课任务
    @Select("select cname, tname, csite, content, ctime from tb_course " +
            "inner join tb_teach on tb_teach.cid=tb_course.cid " +
            "inner join tb_teacher on tb_teacher.tid=tb_teach.tid " +
            "where cw=#{cw} and tb_teacher.tid=#{tid}")
    List<Course> queryCourseInWeek(String tid, int cw);

    // 查看考试安排
    @Select("select tname, cname, esite, ebtime, eetime, etype from tb_exam " +
            "inner join tb_course on tb_course.cid=tb_exam.cid " +
            "inner join tb_teacher on tb_teacher.tid=tb_exam.tid " +
            "where tb_teacher.tid=#{tid} order by `ebtime` asc")
    List<Exam> queryExam(String tid);

    // 查看课程成绩
    @Select("select tname, number, tb_course.cid, cname, name, chours, ccredit, cscore from tb_stuinfo " +
            "left outer join tb_score on tb_score.id=tb_stuinfo.number " +
            "inner join tb_teacher on tb_teacher.tid=#{tid} " +
            "inner join tb_course on tb_course.cid = any(select cid from tb_teach where tid='t001') " +
            "where tb_score.tid = #{tid} or tb_score.tid is null")
    List<Score> queryScore(String tid);

    // 成绩统计部分信息
    @Select("select cid, cname, tname from tb_teacher " +
            "inner join tb_course on tb_course.cid=any(select cid from tb_teach where tid=#{tid}) " +
            "where tid=#{tid}")
    List<Statistics> queryStatistics(String tid);

    // 不及格人数
    @Select("select count(number) from tb_stuinfo " +
            "left outer join tb_score on tb_score.id=tb_stuinfo.number " +
            "and (tb_score.cid=any(select cid from tb_teach where tid=#{tid}) or tb_score.cid is null) " +
            "where cscore<60 or cscore is null;")
    int[] queryFailed(String tid);

    // 考勤情况
    @Select("SELECT number, name, date, cname, type FROM `tb_attendance` " +
            "inner join tb_stuinfo on tb_stuinfo.number=tb_attendance.id " +
            "inner join tb_course on tb_course.cid=tb_attendance.cid " +
            "where tb_attendance.cid=any(select cid from tb_teach where tid=#{tid})")
    List<Attendance> queryAttendance(String tid);







}
