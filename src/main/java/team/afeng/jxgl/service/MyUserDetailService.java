package team.afeng.jxgl.service;

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

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        logger.info("用户名：{}", s);
        // 根据用户名，查找对应的密码与权限
        // 封装用户信息，并返回，参数为：用户名、密码、权限

        return new User(s, passwordEncoder.encode("111"), AuthorityUtils.commaSeparatedStringToAuthorityList("admin"));
    }
}
