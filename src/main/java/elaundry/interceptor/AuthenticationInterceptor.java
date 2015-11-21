package elaundry.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import elaundry.domain.User;

@Component
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		/*String uri = request.getRequestURI();
		System.out.println(uri);
		if (!uri.endsWith("login") && !uri.endsWith("logout")) {
			User userData = (User) request.getSession().getAttribute("LOGGEDIN_USER");
			if (userData == null) {
				response.sendRedirect("/eLaundrySystem/login");
				return true;
			}
		}*/
		return true;
	}
}