<%--
  Created by IntelliJ IDEA.
  User: Vadim
  Date: 04.12.2021
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add vacancy</title>
</head>
<body>
<c:import url="parts/header.jsp"/>

<!-- Preloader Starts -->
<div class="preloader">
    <div class="spinner"></div>
</div>
<!-- Preloader End -->

<!-- Header Area Starts -->
<header class="header-area single-page">
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo-area">
                        <a href="index.html"><img src="assets/images/logo-light.png" alt="logo"></a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="custom-navbar">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <div class="main-menu main-menu-light">
                        <ul>
                            <li class="menu-btn">
                                <a href="#" class="login">Профиль</a>
                                <a href="Controller?command=logout" class="template-btn">Выход</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <div class="custom-navbar">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <div class="main-menu main-menu-light">
                            <ul>
                                <li class="active"><a href="Controller?command=gotoindexpage">Главная</a></li>
                                <li class="active"><a href="about.html">Добавить объявление</a></li>
                                <li class="active"><a href="about.html">FAQ</a></li>
                                <li class="active"><a href="about.html">message</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-title text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <h2>Добавление собеседования</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header Area End -->

<!-- Start Align Area -->
<div class="whole-wrap">
    <div class="container">
        <div class="section-top-border">
            <!--            <h3 class="mb-30 title_color">Форма для заполнения информации </h3>-->
            <div class="row">
                <div class="col-lg-3 mb-5 mb-lg-0">
                    <br>
                    <div class="d-flex">
                        <div class="info-text">
                            <h5>Заголовок собеседования</h5>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>дата</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>начало</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>конец</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>платформа</h5>
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <form action="Controller" method="post">
                        <input type="hidden" name="command" value="addadinfo"/>
                        <div class="mt-10">
                            <input type="text" name="addTopic" maxlength="50" placeholder="Заголовок объявления"
                                   onfocus="this.placeholder = 'Майка Polo'"
                                   onblur="this.placeholder = 'Заголовок собеседования'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="date" name="addMaterial" placeholder="Материал"
                                   onfocus="this.placeholder = 'Лён'" onblur="this.placeholder = 'Материал'" required
                                   class="single-input">
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-hourglass-start" aria-hidden="true"></i></div>
                            <input type="time" name="addMaterial" placeholder="Материал"
                                   onfocus="this.placeholder = 'Лён'" onblur="this.placeholder = 'Материал'" required
                                   class="single-input">
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-hourglass-end" aria-hidden="true"></i></div>
                            <input type="time" name="addMaterial" placeholder="Материал"
                                   onfocus="this.placeholder = 'Лён'" onblur="this.placeholder = 'Материал'" required
                                   class="single-input">
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-gg" aria-hidden="true"></i></div>
                            <div class="form-select" id="default-select2">
                                <select name="addType">
                                    <c:forEach var="type" items="${clothesTypeList}">
                                        <option name="${type.typeID}">${type.category}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <br>
                        <br>
                        <button type="submit" class="template-btn">Добавить собеседование</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Align Area -->

<div id="wrapper"></div>

<!-- Footer Area -->
<c:import url="parts/footer.jsp"/>
<!-- Footer Area End -->
</body>
</html>
