package team.afeng.jxgl.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import team.afeng.jxgl.mapper.StuMapper;
import team.afeng.jxgl.mapper.TchMapper;
// FIXME: 任意端登录后，若未注销仍可访问其它端
/**
 * Author: Afeng
 * Date: 2019/12/27
 * Time: 12:15
 * Description: 参考 https://github.com/wuyouzhuguli/SpringAll
 */
@Component
public class MyUserDetailService implements UserDetailsService {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private StuMapper stuMapper;
    @Autowired
    private TchMapper tchMapper;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        logger.info("用户名：{}", id);
        // 根据用户名，查找对应的密码与权限
        // 封装用户信息，并返回，参数为：用户名、密码、权限
        team.afeng.jxgl.entity.User user;
        String authority;
        if (id.contains("t")) {
            user = tchMapper.queryUser(id);
            authority = "tch";
        } else {
            user = stuMapper.queryUser(id);
            authority = "stu";
        }

        return new User(user.getId(), passwordEncoder.encode(user.getPassword()), AuthorityUtils.commaSeparatedStringToAuthorityList(authority));
    }
}
