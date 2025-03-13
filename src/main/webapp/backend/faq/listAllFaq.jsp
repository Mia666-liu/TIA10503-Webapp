<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.faq.model.*" %>
<%@ page import="java.util.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
FaqService faqSvc = new FaqService(); 
List<FaqVO> faqList = faqSvc.getAll(); //抓FAQ所有資料
pageContext.setAttribute("faqList", faqList);
%>


<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LifeSpace 後台管理系統-常見問題</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<style>
        :root {
            --sidebar-bg: #e6f7f8;
            --sidebar-color: #333;
            --primary-color: #70b6c1;
            --hover-color: #5a9da7;
            --light-gray: #f8f9fa;
        }

        body {
            font-family: 'Noto Sans TC', sans-serif;
            background-color: #f5f5f5;
        }
        

        /* Sidebar styles */
        .sidebar {
            background-color: var(--sidebar-bg);
            color: var(--sidebar-color);
            height: 100vh;
            position: fixed;
            padding: 20px 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }

        .sidebar-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .sidebar-logo {
            max-width: 140px;
            margin-bottom: 5px;
        }

        .sidebar-title {
            font-size: 18px;
            margin-bottom: 0;
            text-align: center;
        }

        .nav-item {
            position: relative;
        }

        .nav-link {
            color: var(--sidebar-color);
            padding: 12px 20px;
            display: flex;
            align-items: center;
            transition: all 0.3s;
        }

        .nav-link:hover, .nav-link.active {
            background-color: rgba(112, 182, 193, 0.2);
        }

        .nav-link i {
            width: 24px;
            margin-right: 10px;
            text-align: center;
        }

        .nav-link .arrow {
            margin-left: auto;
        }

        .submenu {
            padding-left: 34px;
            display: none;
        }

        .submenu.show {
            display: block;
        }

        .submenu-item {
            padding: 8px 15px;
            display: flex;
            align-items: center;
            color: var(--sidebar-color);
            text-decoration: none;
            transition: all 0.3s;
        }

        .submenu-item:hover, .submenu-item.active {
            background-color: rgba(112, 182, 193, 0.2);
        }

        .submenu-item i {
            margin-right: 10px;
            font-size: 6px;
            width: 8px;
        }

        /* Main content styles */
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .user-profile {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #333;
            overflow: hidden;
            cursor: pointer;
        }

        .search-container {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-input {
            flex-grow: 1;
            max-width: 400px;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: var(--hover-color);
            border-color: var(--hover-color);
        }

        /* Hashtag styles */
        .hashtag-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .hashtag-button {
            background-color: #e6f7f8;
            color: #333;
            border: 1px solid #b0d8dc;
            border-radius: 20px;
            padding: 6px 15px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .hashtag-button:hover {
            background-color: #d0edf0;
        }
        
        .hashtag-button.active {
            background-color: var(--primary-color);
            color: white;
            border-color: var(--hover-color);
        }
        table {
        width: 100%;
        border-collapse: collapse; 
    	}
    
   		 th, td {
        border: 1px solid #000; 
        padding: 10px; 
   		}
    
  		th {
        background-color: #e6f7f8;
        text-align: center; 
  		}

  		td {
        text-align: center;
   		}

    	tbody tr {
    	background-color: white;
    	}
        /* 修改容器樣式以支持水平滾動 */
		.container {
  		  width: 100%;
  		  overflow-x: auto;  /* 添加水平滾動 */
   		 margin-bottom: 20px;
		}

		/* 確保表格有一個合適的最小寬度，避免內容被擠壓 */
		#faqTable {
	    min-width: 1200px;  /* 可根據實際需要調整 */
	    width: 100%;
		}

		/* 優化表格單元格內容顯示 */
		#faqTable td.faq-text {
 	   max-width: 300px;   /* 設置最大寬度 */
  	  overflow: hidden;   /* 隱藏溢出部分 */
  	  text-overflow: ellipsis;  /* 使用省略號表示溢出 */
		}
     
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar col-lg-2 col-md-3">
        <div class="sidebar-header">
            <img src="./img/LifeSpace3.png" alt="LifeSpace Logo" class="sidebar-logo">
            <h2 class="sidebar-title">後台中心</h2>
        </div>

        <ul class="nav flex-column mt-3">
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-home"></i>
                    <span>消息管理</span>
                    <i class="fas fa-chevron-right arrow"></i>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-user"></i>
                    <span>帳號管理</span>
                    <i class="fas fa-chevron-right arrow"></i>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>空間訂單管理</span>
                    <i class="fas fa-chevron-right arrow"></i>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-box"></i>
                    <span>商品管理</span>
                    <i class="fas fa-chevron-right arrow"></i>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-star"></i>
                    <span>評論管理</span>
                    <i class="fas fa-chevron-right arrow"></i>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link active">
                    <i class="fas fa-headset"></i>
                    <span>客服管理</span>
                    <i class="fas fa-chevron-down arrow"></i>
                </a>
                <div class="submenu show">
                    <a href="#" class="submenu-item active">
                        <i class="fas fa-circle"></i>
                        <span>常見問題</span>
                    </a>
                    <a href="#" class="submenu-item">
                        <i class="fas fa-circle"></i>
                        <span>聊天室訊息管理</span>
                    </a>
                </div>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="fas fa-chart-bar"></i>
                    <span>儀錶板</span>
                    <i class="fas fa-chevron-right arrow"></i>
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1 class="page-title">常見問題</h1>
            <div class="user-profile">
                <img src="../picture/profile-user.png" alt="User Profile" width="40" height="40">
            </div>
        </div>

        <div class="search-container">
   	 <div class="input-group search-input">
        <input type="text" class="form-control" placeholder="搜尋問題...">
        <a href="${pageContext.request.contextPath}/backend/faq/faq_select_page.jsp" class="btn btn-primary">搜尋</a>
   			 </div>
  			<button class="btn btn-success" id="btnAddFaq" onclick="location.href='${pageContext.request.contextPath}/backend/faq/addFaq.jsp'">新增FAQ</button>
			</div>
        
        <!-- Hashtag 篩選按鈕 -->
        <div class="hashtag-container">
            <button class="hashtag-button active" data-filter="all">全部</button>
            <button class="hashtag-button" data-filter="使用規格">使用規格</button>
            <button class="hashtag-button" data-filter="租用計算">租用計算</button>
            <button class="hashtag-button" data-filter="修改訂單">修改訂單</button>
            <button class="hashtag-button" data-filter="付款方式">付款方式</button>
            <button class="hashtag-button" data-filter="其他">其他</button>
        </div>

<!-- <FORM METHOD="post" ACTION="faq.do" name="form1">        -->
<div class="container">
<table id="faqTable">
  <thead>
        <tr>
            <th>常見問題編號</th>
            <th>管理者編號</th>
            <th>常見問題</th>
            <th>回答</th>
            <th>建檔時間</th>
            <th>問題狀態</th>
            <th>修改</th>
			<th>刪除</th>
            
        </tr>
    </thead>
    <tbody id="faqBody">
    <c:forEach var="FaqVO" items="${faqList}">
    <tr>
        <td>${FaqVO.faqId}</td>
        <td>${FaqVO.adminId}</td>
        <td class="faq-text">${FaqVO.faqAsk}</td>
        <td class="faq-text">${FaqVO.faqAnswer}</td>
        <td><fmt:formatDate value="${FaqVO.createTime}" pattern="yyyy-MM-dd HH:mm" /></td>
        <td><c:if test="${FaqVO.faqStatus == 0 }">已刪除</c:if> 
        	<c:if test="${FaqVO.faqStatus == 1}">已上線</c:if>
        </td>    
        
        <td>
        <form method="post"
            action="${pageContext.request.contextPath}/backend/faq/faq.do" style="margin-bottom: 0px;">
            <input class="btn btn-edit" type="submit" value="修改"> 
            <input type="hidden" name="faqId" value="${FaqVO.faqId}"> 
            <input type="hidden" name="action" value="update">
        </FORM>
        </td>
        <td>
        <form method="post"
            action="${pageContext.request.contextPath}/backend/faq/faq.do" style="margin-bottom: 0px;">
            <input class="btn btn-delete" type="submit" value="刪除"> 
            <input type="hidden" name="faqId" value="${FaqVO.faqId}"> 
            <input type="hidden" name="action" value="delete">
        </form>
        </td>
    </tr>   
</c:forEach>
    </tbody>
    </table>
    </div>
<br>
   
<!-- </FORM> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <!-- <script src="faq_back.js"></script> -->

</body>
</html>