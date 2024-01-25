# Enhancement of GroupBuy

1. (改)團購首頁：商品清單(商品圖片、超連結)

2. (新)商品詳細資訊

3. (新)銷售排行

4. (新)商品搜尋

5. (暫定)評分與評論


#### 參考資料: <https://github.com/vincenttuan/JavaWeb20231113.git>


# 說明

1. URL -> Controller -> JSP

   瀏覽器：http://localhost:8080/GroupBuy/mvc/group_buy/frontend/main
   
   http: HTTP 協定
   localhost: 本機
   8080: PORT
   /GroupBuy: 專案名稱
   /mvc: 進入Spring的世界
   /group_buy/frontend/main: 尋找對應的 Controller

2. Model: spring + ui (spring 底下，管理屬性資料的物件，這些物件將來要傳給JSP)

   Model addAttribute("name","aweit");
   
3. 回傳字串：Spring 的解析器，會去尋找對應的頁面。

   return "group_buy/frontend/main";
   
4. 取得 Model屬性裡的資料？ ${ name } -> aweit
   
   
   