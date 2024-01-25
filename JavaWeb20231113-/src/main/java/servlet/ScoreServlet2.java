@WebServlet(value = "/servlet/score")
public class ScoreServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 編碼
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

        // 接收客戶端來的請求參數
        String[] scores = req.getParameterValues("score");
        
        // 印出所有分數
        PrintWriter out = resp.getWriter();
        out.print("所有成績:" + Arrays.toString(scores) + "<p>");

        // 使用 Java 8 stream 印出每個分數
        Arrays.stream(scores).forEach(score -> out.print(score + "<br>"));

        // 計算成績筆數、平均、總分、最高分和最低分
        if (scores != null && scores.length > 0) {
            int[] scoresInt = new int[scores.length];
            int sum = 0;
            int max = Integer.MIN_VALUE;
            int min = Integer.MAX_VALUE;

            for (int i = 0; i < scores.length; i++) {
                scoresInt[i] = Integer.parseInt(scores[i]);
                sum += scoresInt[i];
                if (scoresInt[i] > max) {
                    max = scoresInt[i];
                }
                if (scoresInt[i] < min) {
                    min = scoresInt[i];
                }
            }

            double average = (double) sum / scores.length;

            out.println("<p>成績筆數: " + scores.length + "</p>");
            out.println("<p>平均: " + average + "</p>");
            out.println("<p>總分: " + sum + "</p>");
            out.println("<p>最高分: " + max + "</p>");
            out.println("<p>最低分: " + min + "</p>");
        } else {
            out.println("<p>沒有提供成績。</p>");
        }
    }
}
