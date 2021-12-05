<%--
  Created by IntelliJ IDEA.
  User: Vadim
  Date: 04.12.2021
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@ taglib prefix="ctg" uri="customtags" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>Title</title>
</head>
<body>
<c:import url="parts/header.jsp"/>

<!-- Preloader Starts -->
<div class="preloader">
    <div class="spinner"></div>
</div>
<!-- Preloader End -->

<!-- Header Area Starts -->
<header>
    <div class="header-area blog-menu">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo-area">
                        <a href="index.html"><img src="assets/images/logo.png" alt="logo"></a>
                    </div>
                </div>

                <div class="col-lg-10">
                    <div class="custom-navbar">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <div class="main-menu">
                        <ul>
                            <li class="menu-btn">
                                <a href="#" class="login">Профиль</a>
                                <a href="#" class="template-btn">Выход</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="custom-navbar">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <div class="main-menu">
                        <ul>
                            <li class="active"><a href="index.html">home</a></li>
                            <li class="active"><a href="contact-us.html">add ad</a></li>
                            <li><a href="contact-us.html">contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header Area End -->

<!-- Job Single Content Starts -->
<section class="job-single-content section-padding">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-content">
                    <div class="single-content1">
                        <div class="single-job mb-4 d-lg-flex justify-content-between">
                            <div class="job-text">
                                <h4>Topic</h4>
                                <ul class="mt-4">
                                    <li class="mb-3"><h5><em class="fa fa-id-card-o"></em> Опыт работы</h5></li>
                                    <li class="mb-3"><h5><em class="fa fa-calendar"></em> График работы</h5></li>
                                    <li><h5><em class="fa fa-pie-chart"></em> количество собеседований</h5></li>
                                </ul>
                            </div>
                            <div class="job-btn align-self-center">
                                <a class="third-btn job-btn1">занятость</a>
                                <a href="#" class="third-btn">интервью</a>
                            </div>
                        </div>
                    </div>
                    <div class="single-content2 py-4">
                        <h4>Описание</h4>
                        <p>Текст описания</p>
                    </div>
                    <div class="single-content4 py-4">
                        <h4>job requirements</h4>
                        <ul class="mt-3">
                            <li class="mb-2">requirements spiskom</li>
                        </ul>
                    </div>
                    <div class="single-content6 py-4">
                        <h4>employment status</h4>
                        <span>Part Time/Full Time</span>
                    </div>
                    <div class="single-content7 py-4">
                        <h4>other benefits</h4>
                        <ul class="mt-3">
                            <li class="mb-2">additional requirements spiskom</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Job Single Content End -->

<div id="wrapper"></div>

<!-- Footer Area -->
<c:import url="parts/footer.jsp"/>
<!-- Footer Area End -->
</body>
</html>
