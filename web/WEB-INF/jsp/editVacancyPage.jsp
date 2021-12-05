<%--
  Created by IntelliJ IDEA.
  User: Vadim
  Date: 05.12.2021
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit vacancy</title>
</head>
<body>
<c:import url="parts/header.jsp"/>
<c:set var="vacancy" value="${sessionScope.editVacancy}" scope="page"/>

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
                        <a href="Controller?command=go_to_home_page">
                            <img src="<c:url value="/resources/images/logo-light.png"/>"
                                 alt="logo">
                        </a>
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
                                <li class="active"><a href="Controller?command=go_to_home_page">Главная</a></li>
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
                        <h2>Добавление вакансии</h2>
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
                            <h5>Заголовок вакансии</h5>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>Опыт работы</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>Тип занятости</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>График работы</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>Описание</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p><br><br><br><br><br>
                            <h5>Требования</h5>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <br><br><br><br><br>
                            <h5>Будет преимуществом</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <form action="Controller" method="post">
                        <input type="hidden" name="command" value="add_vacancy"/>
                        <div class="mt-10">
                            <input type="text" name="editTopic" value="${vacancy.topic}" maxlength="50"
                                   placeholder="${vacancy.topic}" onfocus="this.placeholder = '${vacancy.topic}'"
                                   onblur="this.placeholder = '${vacancy.topic}'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input pattern="^\d{1,2}([-]\d{1,2})?$" class="single-input" value="${vacancy.topic}"
                                   type="text" name="editExperience" placeholder="${vacancy.topic}"
                                   onfocus="this.placeholder = '${vacancy.topic}'"
                                   onblur="this.placeholder = '${vacancy.topic}'">
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-gg" aria-hidden="true"></i></div>
                            <div class="form-select" id="default-select1">
                                <select name="editEmployment">
                                    <c:forEach var="employment" items="${sessionScope.employmentList}">
                                        <c:choose>
                                            <c:when test="${employment.id==vacancy.employment.id}">
                                                <option value="${employment.id}" selected>${employment.type}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${employment.id}">${employment.type}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-gg" aria-hidden="true"></i></div>
                            <div class="form-select" id="default-select2">
                                <select name="editSchedule">
                                    <c:forEach var="schedule" items="${sessionScope.scheduleList}">
                                        <c:choose>
                                            <c:when test="${schedule.id==vacancy.schedule.id}">
                                                <option value="${schedule.id}" selected>${schedule.timetable}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${schedule.id}">${schedule.timetable}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="mt-10">
                            <textarea name="editDescription" class="single-textarea" maxlength="300"
                                      placeholder="${vacancy.description}"
                                      onfocus="this.placeholder = '${vacancy.description}'"
                                      onblur="this.placeholder = '${vacancy.description}'" required><c:out
                                    value="${vacancy.description}"/></textarea>
                        </div>
                        <div class="mt-10">
                            <textarea name="editRequirements" class="single-textarea" maxlength="500"
                                      placeholder="${vacancy.requirements}"
                                      onfocus="this.placeholder = '${vacancy.requirements}'"
                                      onblur="this.placeholder = '${vacancy.requirements}'" required><c:out
                                    value="${vacancy.requirements}"/></textarea>
                        </div>
                        <div class="mt-10">
                            <textarea name="editAdditional" class="single-textarea" maxlength="500"
                                      placeholder="${vacancy.additionalRequirements}"
                                      onfocus="this.placeholder = '${vacancy.additionalRequirements}'"
                                      onblur="this.placeholder = '${vacancy.additionalRequirements}'"><c:out
                                    value="${vacancy.additionalRequirements}"/></textarea>
                        </div>
                        <br>
                        <br>
                        <button type="submit" class="template-btn">Редактировать вакансию</button>
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

