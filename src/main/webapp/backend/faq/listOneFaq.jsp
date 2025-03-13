<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>FAQ查詢結果</title>
<style>
  body {
        font-family: 'Noto Sans TC', sans-serif;
        background-color: 'white';
        padding: 20px;
    }

    h3 {
        margin-bottom: 20px;
    }

    /* 表格容器添加水平滾動功能 */
    .table-container {
        width: 100%;
        overflow-x: auto;
        margin-bottom: 20px;
    }
    
    /* 確保表格有足夠的最小寬度，避免內容被擠壓 */
    table {
        min-width: 1200px;
        width: 100%;
        border-collapse: collapse;
    }
    
    th, td {
        border: 1px solid #000;
        padding: 10px;
        text-align: center;
        white-space: nowrap; /* 防止標題和內容換行 */
    }
    
    th {
        background-color: #e6f7f8;
    }
    
    /* 對於問題欄位，保持文本居中 */
    td.long-text {
        max-width: 300px;
        white-space: normal; /* 允許長文本換行 */
        word-break: break-word; /* 在單詞中間斷行 */
        height: 100px; /* 增加高度 */
        vertical-align: middle; /* 文本垂直居中 */
        padding: 15px; /* 增加內邊距 */
        text-align: center; /* 文本水平居中 */
    }
    
    /* 特別為回答欄位設置更大的高度，左對齊 */
    td.answer-text {
        max-width: 400px;
        white-space: normal;
        word-break: break-word;
        height: 150px; /* 更大的高度 */
        vertical-align: top;
        padding: 15px;
        text-align: left; /* 文本左對齊 */
    }
    
    .back-btn {
        margin-top: 20px;
        padding: 8px 15px;
        background-color: #70b6c1;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
    }
    
    .back-btn:hover {
        background-color: #5a9da7;
    }
</style>
</head>
<body bgcolor='white'>

<h3>常見問題查詢結果</h3>

<table>
    <tr>
        <th>常見問題編號</th>
        <th>管理者編號</th>
        <th>常見問題</th>
        <th>回答</th>
        <th>建檔時間</th>
        <th>問題狀態</th>
    </tr>
    <tr>
        <td>${faqVO.faqId}</td>
        <td>${faqVO.adminId}</td>
      	<td class="long-text">${faqVO.faqAsk}</td>
        <td class="answer-text">${faqVO.faqAnswer}</td>
        <td><fmt:formatDate value="${faqVO.createTime}" pattern="yyyy-MM-dd HH:mm" /></td>
        <td>
            <c:if test="${faqVO.faqStatus == 0}">已刪除</c:if>
            <c:if test="${faqVO.faqStatus == 1}">已上線</c:if>
        </td>
    </tr>
</table>

<a href="${pageContext.request.contextPath}/backend/faq/faq_select_page.jsp" class="back-btn">返回查詢頁面</a>

</body>
</html>