package team.afeng.jxgl.security.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import team.afeng.jxgl.security.MyAuthenticationHandler;

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
                .failureHandler(authenticationHandler)
                .and()
                .authorizeRequests()  // 授权配置
                .antMatchers("/stu/**").hasAuthority("stu")
                .antMatchers("/tch/**").hasAuthority("tch")
                .antMatchers("/login**", "/who", "/count").permitAll()
                .anyRequest()
                .authenticated()
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
