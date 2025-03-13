<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.faq.model.*" %>
<%@ page import="java.util.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
FaqVO faqVo =(FaqVO) request.getAttribute("faqVO");//取得Servlet存放在request地物件

%>


<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>編輯常見問題</title>
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
        
        .edit-form {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 0 auto;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
        }
        
        .required::after {
            content: "*";
            color: red;
            margin-left: 4px;
        }
        
        .form-control {
            border: 1px solid #ced4da;
            border-radius: 4px;
            padding: 12px;
            width: 100%;
        }
        
        textarea.form-control {
            height: 150px;
            resize: none;
            overflow-y: auto;
        }
        
        textarea.answer-textarea {
            height: 250px; /* 回答文字框設置更大高度 */
        }
        
        .read-only-field {
            background-color: #f8f9fa;
            color: #6c757d;
        }
        
        .btn-row {
            display: flex;
            justify-content: flex-start;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn-submit {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn-submit:hover {
            background-color: var(--hover-color);
        }
        
        .btn-cancel {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
        }
        
        .btn-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
 
   
 <div class="edit-form">
        <h2 class="mb-4">編輯常見問題</h2>
        
       <form method="post" action="${pageContext.request.contextPath}/backend/faq/faq.do">
            <div class="form-group">
                <label class="form-label">常見問題編號:</label>
                <input type="text" class="form-control read-only-field" value="${faqVO.faqId}" readonly>
            </div>
            
            <div class="form-group">
                <label class="form-label">管理者編號:</label>
                <input type="text" class="form-control read-only-field" value="${faqVO.adminId}" readonly>
            </div>
            
            <div class="form-group">
                <label class="form-label required">常見問題:</label>
                <textarea name="faqAsk" class="form-control">${faqVO.faqAsk}</textarea>
            </div>
            
            <div class="form-group">
                <label class="form-label required">回答內容:</label>
                <textarea name="faqAnswer" class="form-control answer-textarea">${faqVO.faqAnswer}</textarea>
            </div>
            
            <div class="form-group">
                <label class="form-label">建檔時間:</label>
                 <input type="text" class="form-control read-only-field" value="<fmt:formatDate value="${faqVO.createTime}" pattern="yyyy-MM-dd HH:mm" />" readonly>
            </div>
            
            <div class="btn-row">
                <input type="hidden" name="faqId" value="${faqVO.faqId}">
                <input type="hidden" name="action" value="updateOk">
                <button type="submit" class="btn-submit">確定修改</button>
                <a href="${pageContext.request.contextPath}/backend/faq/listAllFaq.jsp" class="btn-cancel">取消</a>
            </div>
        </form>
    </div>
<br>
   
<!-- </FORM> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <!-- <script src="faq_back.js"></script> -->

</body>
</html>