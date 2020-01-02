package team.afeng.jxgl.listener.config;

import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import team.afeng.jxgl.listener.OnLineCountListener;

/**
 * Author: Afeng
 * Date: 2020/1/2
 * Time: 19:11
 * Description:
 */
@Configuration
public class ListenerConfig {
    @Bean
    public ServletListenerRegistrationBean<OnLineCountListener> init() {
        ServletListenerRegistrationBean<OnLineCountListener> servletListenerRegistrationBean = new ServletListenerRegistrationBean();
        servletListenerRegistrationBean.setListener(new OnLineCountListener());
        return servletListenerRegistrationBean;
    }
}
