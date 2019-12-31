package team.afeng.jxgl.service;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Author: Afeng
 * Date: 2019/12/31
 * Time: 13:11
 * Description:
 */
@Component
public class MyAuthenticationHandler implements AuthenticationSuccessHandler {
    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        String username = request.getParameter("username");
        String url = "/%s/";
        if (username.contains("t"))
            url = String.format(url, "tch");
        else
            url = String.format(url, "stu");
        redirectStrategy.sendRedirect(request, response, url);
    }
}
