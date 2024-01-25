package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 用來處理成績的網路服務
// .../servlet/score?score=100&score=45&score=80 同名 陣列?
@WebServlet(value = "/servlet/score")
public class ScoreServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 編碼
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charaset=utf-8");
		
		//接收客戶端來的請求參數
		String[] scores = req.getParameterValues("score");
//		PrintWriter out = resp.getWriter();
//		// 請印出所有分數 BY 老師1  ?  4:10
//		resp.getWriter().print("所有成績:"+Arrays.toString(score)+"<p>")
		
//		// 請印出所有分數 BY 老師2 11/13 4:11
		PrintWriter out = resp.getWriter();
		out.print("所有成績:" + Arrays.toString(scores) +"<p>");
		// Java 8 stream
		Arrays.stream(scores).forEach(score -> out.print(score + "<br>"));
//		Arrays.stream(scores).forEach(out::print); 顯示較不好看 黏在一起
		
		// 請印出所有分數 BY GPT 有誤 多筆?
		if (scores == null) {
		    	out.println("No scores provided.");
		}else {out.println("分數:"+ scores);
		}
		out.println("分數:"+scores);
	}

	// 成績筆數= ?  平均=? 總分=? 最高分=? 最低分=?
	// 將 String[] scores 轉進到int[]  轉型?
	int[] scoresInt = new int[scores.length];
	for(int i=0;i<scores.length;i++) {
		scoresInt[i] = Integer.parseInt(scores[i]);
	}
	Arrays.stream(scoresInt).forEach(score -> out.print(score + "<br>"));
	//利用 scoresInt 計算出成績筆數=?
}
