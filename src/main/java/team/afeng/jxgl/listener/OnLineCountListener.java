package team.afeng.jxgl.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Author: Afeng
 * Date: 2020/1/2
 * Time: 18:53
 * Description:
 */
@WebListener
public class OnLineCountListener implements HttpSessionListener{
    private int count = 0;
    public static AtomicInteger userCount = new AtomicInteger(0);

    @Override
    public void sessionCreated(HttpSessionEvent se) {
//        count++;
//        se.getSession().getServletContext().setAttribute("count", count);
        userCount.getAndIncrement();
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
//        count--;
//        se.getSession().getServletContext().setAttribute("count", count);
        userCount.getAndDecrement();

    }
}
