package TOL.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Satan on 2016/2/16.
 */
@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        if (session.getAttribute("User") == null) {
            request.getRequestDispatcher("login.jsp").forward(req, resp);
        }
        else{
            chain.doFilter(req, resp);
        }
    }
    public void init(FilterConfig config) throws ServletException {
    }

}
