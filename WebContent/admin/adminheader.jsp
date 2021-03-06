<%@page import="FB.STG.Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/products.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<%
User currentUser = (User) session.getAttribute("currentUser");
String role = (String) session.getAttribute("role");
String username = (String) session.getAttribute("username");
%>
<header>
	<div class="container-nav">
		<div class="nav-bar">
			<c:choose>
				<c:when test="${not empty currentUser}">
					<c:if test="${currentUser.getRole() eq 'admin' }">
						<div class="nav-bar">
							<div class="logo">
								<a href="http://localhost:8080/FleeBounce/home"> <img
									src="../images/logo.png" />
								</a>
							</div>
							<nav>
								<ul>
									<li><a class="nav-bar-items" href="http://localhost:8080/FleeBounce/home">Trang chủ</a></li>
									<li><a class="nav-bar-items" href="#">Sản phẩm</a></li>
									<li><a class="nav-bar-items" href="#">Giới thiệu</a></li>
									<li><a class="nav-bar-items" href="#">Liên hệ</a></li>
									<li><a class="nav-bar-items" href="#">${username}</a></li>
								</ul>
							</nav>
						</div>
						<a href="#" class="icon"> <img src="../images/cart.png" />
						</a>
						<form action="${pageContext.request.contextPath}/AuthController"
							method="post">
							<button class="log-out" name="action" value="logout">
								<i class="fa fa-sign-out" aria-hidden="true"></i>
							</button>
						</form>
					</c:if>
				</c:when>
				<c:otherwise>
					<div class="container-nav">
						<div class="nav-bar">
							<div class="logo">
								<a href="http://localhost:8080/FleeBounce/home"> <img
									src="../images/logo.png" />
								</a>
							</div>
							<nav>
								<ul>
									<li><a href="http://localhost:8080/FleeBounce/home">Trang
											chủ</a></li>
									<li><a href="#">Sản phẩm</a></li>
									<li><a href="#">Giới thiệu</a></li>
									<li><a href="#">Liên hệ</a></li>
									<li><a href="views/sigin.jsp">Đăng nhập</a></li>
								</ul>
							</nav>
							<a href="#" class="icon"> <img src="../images/cart.png" />
							</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</header>