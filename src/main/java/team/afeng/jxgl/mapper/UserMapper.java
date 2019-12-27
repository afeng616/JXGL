package team.afeng.jxgl.mapper;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import team.afeng.jxgl.entity.User;

import java.util.List;

/**
 * Author: Afeng
 * Date: 2019/12/22
 * Time: 9:59
 * Description:
 */

public interface UserMapper {
    @Select("select * from db_test.tb_user")
    List<User> queryUserList();

    // 查看个人信息
    @Select("select * from db_jxgl.tb_stuinfo where number = #{id}")
    User queryUserInfo(String id);
}
