<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
	<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="<c:url value="/resources/img/Symbol1.png"/>">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/main.css" />"> <!-- Resource style -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/js/jquery.menu-aim.js" />"></script>
	<script src="<c:url value="/resources/js/main.js" />"></script>
	<title>Home</title>
</head>
<body>
	<header class="cd-main-header">
		<!--<a href="#0" class="cd-logo"><img src="img/cd-logo.svg" alt="Logo"></a>-->
		<!--<a href="#0" class="cd-logo"><img src="img/cd-logo.svg" alt="Logo"></a>-->
		<a href="home" style="padding-left: 20px"><img src="<c:url value="/resources/img/Symbol1.png"/>"
						 style="vertical-align:center;"
						 width="35px" height="55px" alt="Sparky"></a>
		<a href="home"><img class="text-logo" src="<c:url value="/resources/img/IndianBank.png"/>"
													style="padding: 7px 0 7px 0"
													width="200px" height="65px" alt="Indian Bank"></a>

		<a href="#0" class="cd-nav-trigger"><span></span></a>

		<nav class="cd-nav">
			<ul class="cd-top-nav">
				<li class="has-children account">
					<a href="#0">
						<i style="padding-right: 10px" class="fa fa-user" aria-hidden="true"></i>${username}</a>
					<ul>

						<li><a href="userdetails">My Account</a></li>
						<li><a href="<c:url value="/logout" />">Logout</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</header> <!-- .cd-main-header -->
	<main class="cd-main-content">
		<nav class="cd-side-nav is-fixed">
			<ul>
				<li>
					<a href="home">Home</a>
				</li>
				<li>
					<a href="management">Management</a>
				</li>
				<li class="has-children">
					<a href="#0">Request</a>
					<ul>
						<li><a href="pendingrequest">Pending</a></li>
						<li><a href="completedrequest">Completed</a></li>
					</ul>
				</li>
				<c:if test="${role == 'ROLE_MANAGER' }">
				<li>
					<a href="transaction">Transaction</a>
				</li>
				</c:if>
				<c:if test="${role == 'ROLE_ADMIN' }">
				<li>
					<a href="systemlogs">System Logs</a>
				</li>
				</c:if>
				<li>
					<a href="loginmanagement">Login Management</a>
				</li>
			</ul>
		</nav>