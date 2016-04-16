package TOL.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by Satan on 2016/2/16.
 */
@WebFilter(filterName = "EncodingFilter")
public class EncodingFilter implements Filter {
    private String charSet;

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        req.setCharacterEncoding(this.charSet);
        resp.setCharacterEncoding(this.charSet);
        chain.doFilter(req,resp);
    }

    public void init(FilterConfig config) throws ServletException {
        this.charSet = config.getInitParameter("charset");
    }

}
