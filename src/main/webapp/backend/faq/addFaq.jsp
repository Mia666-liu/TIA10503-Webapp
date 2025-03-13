<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.faq.model.*" %>
<%@ page import="java.util.*"%>

<%
FaqVO faqVO = (FaqVO) request.getAttribute("faqVO");
if (faqVO == null) {
    faqVO = new FaqVO();
}

String currentAdminId = "A001";
%>


<!DOCTYPE html>
<html lang="zh-TW">
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增常見問題</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #70b6c1;
            --hover-color: #5a9da7;
        }
        
        body {
            font-family: 'Noto Sans TC', sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }
        
        .add-form {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 0 auto;
        }
        
        .form-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e9ecef;
        }
        
        .form-title {
            font-size: 24px;
            margin: 0;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
        }
        
        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(112, 182, 193, 0.25);
        }
        
        textarea.form-control {
            height: 150px;
            overflow-y: auto;
        }
        
        .answer-textarea {
            height: 250px;
        }
        
        .btn-container {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            border: none;
        }
        
        .btn-cancel {
            background-color: #dc3545;
            color: white;
        }
        
        .btn-cancel:hover {
            background-color: #c82333;
        }
        
        .btn-submit {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-submit:hover {
            background-color: var(--hover-color);
        }
        
        /* 錯誤訊息樣式 */
        .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
   <div class="edit-form">
        <h2 class="mb-4">新增常見問題</h2>
        
        <c:if test="${not empty errorMsgs}">
            <div class="alert alert-danger">
                <ul class="mb-0">
                    <c:forEach var="message" items="${errorMsgs}">
                        <li>${message}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        
       <form method="post" action="${pageContext.request.contextPath}/backend/faq/faq.do">
            <div class="form-group">
                <label class="form-label">管理者編號:</label>
                <input type="text" class="form-control read-only-field" value="<%= currentAdminId %>" readonly>
            </div>
            
            <div class="form-group">
                <label class="form-label required">常見問題:</label>
                <textarea name="faqAsk" class="form-control"><%= faqVO.getFaqAsk() != null ? faqVO.getFaqAsk() : "" %></textarea>
            </div>
            
            <div class="form-group">
                <label class="form-label required">回答內容:</label>
                <textarea name="faqAnswer" class="form-control answer-textarea"><%= faqVO.getFaqAnswer() != null ? faqVO.getFaqAnswer() : "" %></textarea>
            </div>
            
            <div class="btn-row">
                <input type="hidden" name="adminId" value="<%= currentAdminId %>">
                <input type="hidden" name="action" value="insert">
                <button type="submit" class="btn-submit">確定新增</button>
                <a href="${pageContext.request.contextPath}/backend/faq/listAllFaq.jsp" class="btn-cancel">取消</a>
            </div>
        </form>
    </div>
<br>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>