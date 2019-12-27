package team.afeng.jxgl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import team.afeng.jxgl.mapper.UserMapper;

/**
 * Author: Afeng
 * Date: 2019/12/22
 * Time: 14:27
 * Description:
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = JxglApplication.class)
public class MyBatisTest {
    @Autowired
    private UserMapper userMapper;

    @Test
    public void test() {
        System.out.println(userMapper.queryUserList());
    }
}
