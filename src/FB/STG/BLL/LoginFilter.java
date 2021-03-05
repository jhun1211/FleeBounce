package FB.STG.BLL;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = "/admin/*", filterName = "AdminFilter", description = "Filter all admin URLs")
public class LoginFilter implements Filter {
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws ServletException, IOException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession(false);
		String loginURI = request.getContextPath() + "/views/sigin.jsp";

		boolean loggedIn = session != null && session.getAttribute("username") != null;
		boolean loginRequest = request.getRequestURI().equals(loginURI);
		if (loggedIn || loginRequest) {
			chain.doFilter(request, response);
		} else {
			response.sendRedirect(loginURI);
		}
	}

}