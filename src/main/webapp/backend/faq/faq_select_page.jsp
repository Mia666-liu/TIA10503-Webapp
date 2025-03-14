<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Faq:SingleQuery</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #e6f7f8;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
table#table-1 {
    color: red;
    margin-bottom: 1px;
    font-size: 20px; /* 調大文字 */
}

table#table-1 td {
    text-align: center; /* 讓 <td> 內的內容置中 */
}

h3 {
    display: inline-block; /* 讓 h3 變成 inline-block，使 text-align: center; 生效 */
    margin: 0; /* 移除預設外邊距，避免影響對齊 */
}
@keyframes marquee {
    0% { transform: translateX(100%); } /* 文字從畫面右側開始 */
    100% { transform: translateX(-100%); } /* 文字滾動到畫面左側 */
}

.marquee {
    display: inline-block;
    white-space: nowrap; /* 確保文字不會換行 */
    font-size: 20px;
    font-weight: bold;
    color: red;
    animation: marquee 5s linear infinite; /* 動畫 5 秒執行一次，線性移動，無限循環 */
}


</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr>
   <td><h3 class="marquee">有問題歡迎查詢!</h3></td>
   </tr>
</table>


<h3>資料查詢:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
    <font style="color:red">請修正以下錯誤:</font>
    <ul>
        <c:forEach var="message" items="${errorMsgs}">
            <li style="color:red">${message}</li>
        </c:forEach>
    </ul>
</c:if>

<ul>
    <li><a href='listAllFaq.jsp'>List all Faqs.</a><br><br></li>

    <li>
        <form method="post" action="faq.do">
            <label for="faqId"><b>輸入常見問題編號 (如FAQ01):</b></label>
            <input type="text" id="faqId" name="faqId"
                   value="${param.faqId}"
                   placeholder="請輸入FAQ編號">
            <input type="hidden" name="action" value="getOne_For_Display">
            <input type="submit" value="送出">
        </form>
    </li>
</ul>

  <jsp:useBean id="faqSvc" scope="page" class="com.faq.model.FaqService" />
   
  <li>
     <form method="post" action="faq.do" >
       <b>常見問題編號:</b>
       <select size="1" name="faqId">
         <c:forEach var="faqVO" items="${faqSvc.all}" > 
          <option value="${faqVO.faqId}">${faqVO.faqId}</option>
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </form>
  </li>
  
  <li>
     <form method="post" action="faq.do" >
       <b>選擇常見問題:</b>
       <select size="1" name="faqId">
         <c:forEach var="faqVO" items="${faqSvc.all}" > 
          <option value="${faqVO.faqId}">${faqVO.faqAsk}</option>
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </form>
  </li>
</ul>



</body>
</html>