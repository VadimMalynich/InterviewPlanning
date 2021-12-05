<%--
  Created by IntelliJ IDEA.
  User: Vadim
  Date: 04.12.2021
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Interviews</title>
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
            <div class="col-lg-8">
                <div class="main-content">
                    <div class="single-content1">
                        <div class="single-job mb-4 d-lg-flex justify-content-between">
                            <div class="job-text">
                                <h4>Topic</h4>
                                <ul class="mt-4">
                                    <li class="mb-3"><h5><em class="fa fa-user"></em> Вакансия</h5></li>
                                    <li class="mb-3"><h5><em class="fa fa-user-secret"></em> Интервьюер(или логин или
                                        имя)</h5></li>
                                    <li class="mb-3"><h5><em class="fa fa-calendar"></em> Дата</h5></li>
                                    <li class="mb-3"><h5><em class="fa fa-hourglass-start"></em> Начало</h5></li>
                                    <li class="mb-3"><h5><em class="fa fa-hourglass-end"></em> Конец</h5></li>
                                    <li><h5><em class="fa fa-video-camera"></em> Платформа</h5></li>
                                </ul>
                            </div>
                            <div class="job-btn align-self-center">
                                <button type="button" class="third-btn">забронировать</button>
                            </div>
                            <div class="job-btn align-top">
                                <a href="#" style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                <a href="#" style="color: #0b2e13"><em class="fa fa-close fa-2x"></em></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="sidebar mt-5 mt-lg-0">
                    <div class="single-widget search-widget">
                        <form class="example" action="Controller" method="post" style="margin:auto;max-width:300px">
                            <input type="hidden" name="command" value="search_ads"/>
                            <input type="text" placeholder="${searchPlaceholder}" name="searchAd"
                                   onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = '${searchPlaceholder}'" required>
                            <button type="submit"><em class="fa fa-search"></em></button>
                        </form>
                    </div>
                    <div class="single-item mb-4">
                        <h4 class="mb-4">job by location</h4>
                        <a href="#" class="sidebar-btn d-flex justify-content-between mb-3">
                            <span>New York</span>
                            <span class="text-right">25 job</span>
                        </a>
                        <a href="#" class="sidebar-btn d-flex justify-content-between mb-3">
                            <span>California</span>
                            <span class="text-right">25 job</span>
                        </a>
                        <a href="#" class="sidebar-btn d-flex justify-content-between mb-3">
                            <span>Swizerland</span>
                            <span class="text-right">25 job</span>
                        </a>
                        <a href="#" class="sidebar-btn d-flex justify-content-between mb-3">
                            <span>Canada</span>
                            <span class="text-right">25 job</span>
                        </a>
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
