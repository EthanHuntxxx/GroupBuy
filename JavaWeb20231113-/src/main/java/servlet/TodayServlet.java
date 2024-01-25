package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

//import javax.servlet.GenericServlet;

// 可以用來顯示今天日期與天氣
// 設計網址:http://localhost/JavaWeb20231113   "/servlet/TodayServlet"
@WebServlet(value = "/servlet/TodayServlet")
public class TodayServlet extends GenericServlet {

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
//		設定支援多國語系 utf-8 編碼 
		res.setCharacterEncoding("utf-8");	//給JAVA
		res.setContentType("text/html;charset=utf-8"); //給瀏覽器看是..  HTML格式 /plain 純文字格式 application/ms-... pdf 可以下載XX格式
		Date today = new Date();
//		格式化
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd a hh:mm:ss E");
		String todayString = sdf.format(today); // 2023-11-13 下午 12:10:50 星期一
//		天氣
		int temp = new Random().nextInt(10)+10;
		
//		將結果回應給前端		
		res.getWriter().print("<H1>");
		res.getWriter().print("今天:"+ todayString);
		res.getWriter().print("氣溫:"+ temp);
		res.getWriter().print("</H1>");
		
		
	}
	
}
