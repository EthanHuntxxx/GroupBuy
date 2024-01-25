package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/servlet/hello")
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//編碼
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
//		String name = "Kevin";
		String name = req.getParameter("name"); //取得網址列上的 name 請求參數 
//		範例:http://localhost:8080/JavaWeb20231113/servlet/hello?name=XXX
		
		String age = req.getParameter("age"); //取得網址列上的 age 請求參數 加&
//		範例:http://localhost:8080/JavaWeb20231113/servlet/hello?name=ZZZ&age=18
		
		
		
		
		
		//回應
		PrintWriter out = resp.getWriter();
		out.println("哈囉!"+ name+ "<p>");  // +換行
		out.println("年齡:"+ age);
	}

	
	
}
