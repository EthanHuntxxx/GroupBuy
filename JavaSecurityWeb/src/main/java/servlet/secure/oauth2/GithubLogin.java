package servlet.secure.oauth2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.util.OAuth2Util;

@WebServlet(value = "/secure/oauth2/github_login")
public class GithubLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 向Github 驗證授權
		String auth = OAuth2Util.AUTH_URL;
		resp.sendRedirect(auth);
		
	}
	
}