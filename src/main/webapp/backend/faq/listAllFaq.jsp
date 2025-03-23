<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.faq.model.*"%>
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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatable/datatable.css"
	rel="stylesheet">
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
	background-color: 'white';
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
	z-index: 9;
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
    padding: 30px 40px;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 40px;
}

.user-profile {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: #333;
    overflow: hidden;
    cursor: pointer;
    margin-right: 20px;
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

/* Hashtag 按鈕樣式 */
.hashtag-container {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
      margin-top: 10px; /*與分隔線的距離*/
      margin-bottom: 20px; /*與FAQ距離*/
}
.hashtag-button {
      background: #d1ecf1;
      border: none;
      border-radius: 20px;
      padding: 8px 15px;
      cursor: pointer;
      transition: background 0.3s ease;
}
.hashtag-button:hover {
      background: #abdde5;
}

.hashtag-button.active {
  background: #5aaeb5 !important; /* 當按鈕被點擊後，變為深色 */
  color: white; /* 文字變白，確保可讀性 */
}

/* table { */
/*     width: 100%; */
/*     border-collapse: collapse; */
    
/* } */

/* th, td { */
/*     border: 1px solid #ddd; */
/*     padding: 12px; */
    
/* } */

th {
    background-color: #e6f7f8;
    font-weight: bold;
    position: sticky;
    top: 0;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center !important;
    vertical-align: middle !important;
}

#faqTable  {
    width: 200% !important;
    border-collapse: collapse;

    
} 


#faqTable td {
	text-align: center;
    vertical-align: middle;
    border: 1px solid #ddd;
    padding: 12px;
}

#faqTable td.faq-text {
/*     text-align: left; */
    word-wrap: break-word;
    white-space: normal;
    max-height: 100px;
    overflow: auto;
}

/* 新增的按鈕樣式 */
.btn-edit {
    background-color: #70b6c1;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 5px 20px;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.2s;
}

.btn-edit:hover {
    background-color: #5a9da7;
}

.btn-delete {
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 5px 20px;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.2s;
}

.btn-delete:hover {
    background-color: #c82333;
}

/* 響應式調整 */
@media (max-width: 1400px !important) {
    .main-content {
        margin-left: 0;
    }
}
</style>
</head>
<body>
	<!-- Sidebar -->
	<div class="sidebar col-lg-2 col-md-3">
		<div class="sidebar-header">
			<img src="./img/LifeSpace3.png" alt="LifeSpace Logo"
				class="sidebar-logo">
			<h2 class="sidebar-title">後台中心</h2>
		</div>

		<ul class="nav flex-column mt-3">
			<li class="nav-item"><a href="#" class="nav-link"> <i
					class="fas fa-home"></i> <span>消息管理</span> <i
					class="fas fa-chevron-right arrow"></i>
			</a></li>
			<li class="nav-item"><a href="#" class="nav-link"> <i
					class="fas fa-user"></i> <span>帳號管理</span> <i
					class="fas fa-chevron-right arrow"></i>
			</a></li>
			<li class="nav-item"><a href="#" class="nav-link"> <i
					class="fas fa-map-marker-alt"></i> <span>空間訂單管理</span> <i
					class="fas fa-chevron-right arrow"></i>
			</a></li>
			<li class="nav-item"><a href="#" class="nav-link"> <i
					class="fas fa-box"></i> <span>商品管理</span> <i
					class="fas fa-chevron-right arrow"></i>
			</a></li>
			<li class="nav-item"><a href="#" class="nav-link"> <i
					class="fas fa-star"></i> <span>評論管理</span> <i
					class="fas fa-chevron-right arrow"></i>
			</a></li>
			<li class="nav-item"><a href="#" class="nav-link active"> <i
					class="fas fa-headset"></i> <span>客服管理</span> <i
					class="fas fa-chevron-down arrow"></i>
			</a>
				<div class="submenu show">
					<a href="#" class="submenu-item active"> <i
						class="fas fa-circle"></i> <span>常見問題</span>
					</a> <a href="#" class="submenu-item"> <i class="fas fa-circle"></i>
						<span>聊天室訊息管理</span>
					</a>
				</div></li>
			<li class="nav-item"><a href="#" class="nav-link"> <i
					class="fas fa-chart-bar"></i> <span>儀錶板</span> <i
					class="fas fa-chevron-right arrow"></i>
			</a></li>
		</ul>
	</div>

	<!-- Main Content -->
	
	<div class="main-content">
		<div class="header">
			<h1 class="page-title">常見問題</h1>
			<div class="user-profile">
				<img src="../picture/profile-user.png" alt="User Profile" width="40"
					height="40">
			</div>
		</div>

		<div class="search-container">
			<div class="input-group search-input">
				<input type="text" class="form-control" placeholder="搜尋問題...">
				<a
					href="${pageContext.request.contextPath}/backend/faq/faq_select_page.jsp"
					class="btn btn-primary">搜尋</a>
			</div>
			<button class="btn btn-success" id="btnAddFaq"
				onclick="location.href='${pageContext.request.contextPath}/backend/faq/addFaq.jsp'">新增FAQ</button>
		</div>

		<!-- Hashtag 按鈕區域 -->
          <div class="hashtag-container">
            <button class="hashtag-button">全部</button>
            <button class="hashtag-button">使用規範</button>
            <button class="hashtag-button">租賃相關</button>
            <button class="hashtag-button">付款方式</button>
            <button class="hashtag-button">其他</button>
        </div>



		<table id="faqTable" class="display"  >
			<thead>
				<tr>
					<th>常見問題編號</th>
					<th>管理者編號</th>
					<th>常見問題</th>
					<th >回答</th>
					<th>建檔時間</th>
					<th>問題狀態</th>
					<th>修改</th>
					<th>狀態操作</th>
				</tr>
			</thead>
			<tbody id="faqBody">
				<c:forEach var="FaqVO" items="${faqList}">
					<tr>
						<td>${FaqVO.faqId}</td>
						<td>${FaqVO.adminId}</td>
						<td class="faq-text">${FaqVO.faqAsk}</td>
						<td class="faq-text">${FaqVO.faqAnswer}</td>
						<td><fmt:formatDate value="${FaqVO.createTime}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td>
						<c:if test="${FaqVO.faqStatus == 0 }">
							<span style="color: #dc3545; font-weight: bold;">已下架</span>
						</c:if> 
						<c:if test="${FaqVO.faqStatus == 1}">
							<span style="color: #28a745; font-weight: bold;">顯示中</span>
						</c:if>
						</td>
						<td>
							<form method="post"
								action="${pageContext.request.contextPath}/backend/faq/faq.do"
								style="margin-bottom: 0px;">
								<input class="btn-edit" type="submit" value="編輯"> 
								<input type="hidden" name="faqId" value="${FaqVO.faqId}"> 
								<input type="hidden" name="action" value="update">
							</form>
						</td>
						<td>
							<form method="post"
								action="${pageContext.request.contextPath}/backend/faq/faq.do"
								style="margin-bottom: 0px;">
								<input class="btn-delete" type="submit" value="刪除" onclick="return confirm('確定要下架嗎?')">
								<input type="hidden" name="faqId" value="${FaqVO.faqId}">
								<input type="hidden" name="action" value="delete">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>


		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/vendor/datatable/datatable.js"></script>

		<script>
			
			let faqTable = new DataTable("#faqTable", {
				language: {
					"processing": "處理中...",
					"loadingRecords": "載入中...",
					"lengthMenu": "顯示 _MENU_ 筆資料",
					"zeroRecords": "沒有符合的結果",
					"info": "顯示第 _START_ 至 _END_ 筆結果，共 _TOTAL_ 筆",
					"infoEmpty": "顯示第 0 至 0 筆結果，共 0 筆",
					"infoFiltered": "(從 _MAX_ 筆資料中過濾)",
					"search": "搜尋:",
					"paginate": {
						"first": "第一頁",
						"previous": "上一頁",
						"next": "下一頁",
						"last": "最後一頁"
					},
					"aria": {
						"sortAscending": ": 升冪排列",
						"sortDescending": ": 降冪排列"
					}
				}
			});
		</script>
	
	</div>
</body>
</html>