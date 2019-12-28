package team.afeng.jxgl.service.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Author: Afeng
 * Date: 2019/12/27
 * Time: 11:31
 * Description:
 */
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin()  // 表单登录
//                .loginPage("/login.html")
//                .loginProcessingUrl("/login")
                .and()
                .authorizeRequests()  // 授权配置
                .antMatchers("/webjars/**", "/css/**", "/", "/index**", "/user/**").permitAll()
                .anyRequest()
                .authenticated();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
