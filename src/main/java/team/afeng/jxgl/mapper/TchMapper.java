package team.afeng.jxgl.mapper;

import org.apache.ibatis.annotations.Select;
import team.afeng.jxgl.entity.TchInfo;
import team.afeng.jxgl.entity.User;

/**
 * Author: Afeng
 * Date: 2019/12/31
 * Time: 16:17
 * Description:
 */
public interface TchMapper {
    // 用户查找
    @Select("select * from tb_tchuser where id=#{id}")
    User queryUser(String id);

    // 个人信息
    @Select("select * from tb_teacher where id=#{id}")
    TchInfo queryInfo(String id);

    // 上课任务













}
