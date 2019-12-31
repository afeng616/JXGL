package team.afeng.jxgl.service.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import team.afeng.jxgl.service.MyAuthenticationHandler;

/**
 * Author: Afeng
 * Date: 2019/12/27
 * Time: 11:31
 * Description:
 */
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Autowired
    private MyAuthenticationHandler authenticationHandler;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin()  // 表单登录
                .loginPage("/login.html")
                .loginProcessingUrl("/login")
                .successHandler(authenticationHandler)
                .and()
                .authorizeRequests()  // 授权配置
                .antMatchers("/detail**", "/login**",
                        "/", "/index**", "/user**").permitAll()
//                .anyRequest()
//                .authenticated()
                .and()
                .logout().logoutUrl("/logout").deleteCookies("JSESSIONID").permitAll()
                .and().csrf().disable();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        // 解决静态资源被拦截
        web.ignoring().antMatchers("/**/*.js", "/**/*.css");
    }
}
