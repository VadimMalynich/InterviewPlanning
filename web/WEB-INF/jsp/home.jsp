<%--
  Created by IntelliJ IDEA.
  User: Vadim
  Date: 04.12.2021
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ctg" uri="customtags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Favicon -->
    <link rel="shortcut icon" href="<c:url value="/resources/images/logo/favicon.png"/>" type="image/x-icon">

    <!-- Locale -->
    <fmt:setLocale value="${sessionScope.locale}"/>
    <fmt:setBundle basename="langs.labels" var="loc"/>

    <fmt:message bundle="${loc}" key="signIn.button" var="signIn"/>
    <fmt:message bundle="${loc}" key="signUp.button" var="signUp"/>
    <fmt:message bundle="${loc}" key="logout.button" var="logout"/>
    <fmt:message bundle="${loc}" key="profile.button" var="profile"/>
    <fmt:message bundle="${loc}" key="home.button" var="home"/>
    <fmt:message bundle="${loc}" key="interview.button" var="interviewsButton"/>
    <fmt:message bundle="${loc}" key="users.button" var="usersButton"/>
    <fmt:message bundle="${loc}" key="add.interview.button" var="addInterviewButton"/>
    <fmt:message bundle="${loc}" key="add.vacancy.button" var="addVacancyButton"/>
    <fmt:message bundle="${loc}" key="feedback.button" var="feedbackButton"/>
    <fmt:message bundle="${loc}" key="edit.user.button" var="editUser"/>

    <fmt:message bundle="${loc}" key="label.platforms" var="platformsButton"/>
    <fmt:message bundle="${loc}" key="label.schedule" var="scheduleLabel"/>
    <fmt:message bundle="${loc}" key="label.interviewCount" var="interviewCountLabel"/>

    <fmt:message bundle="${loc}" key="searchVacancy.input.placeholder" var="searchPlaceholder"/>

    <fmt:message bundle="${loc}" key="page.home" var="pageTitle"/>

    <fmt:message bundle="${loc}" key="message.searchResults" var="searchResults">
        <fmt:param value="${sessionScope.searchVacancy}"/>
    </fmt:message>
    <fmt:message bundle="${loc}" key="message.schedule" var="platformMessage">
        <fmt:param value="${sessionScope.filterSchedule}"/>
    </fmt:message>
    <fmt:message bundle="${loc}" key="message.employment" var="employmentMessage">
        <fmt:param value="${sessionScope.filterEmployment}"/>
    </fmt:message>
    <fmt:message bundle="${loc}" key="message.emptyVacancies" var="emptyVacancies"/>
    <fmt:message bundle="${loc}" key="message.emptyVacancies.continue" var="emptyVacanciesContinue"/>

    <c:if test="${requestScope.message ne null}">
        <fmt:message bundle="${loc}" key="${requestScope.message}" var="messageText"/>
    </c:if>

    <!-- Page Title -->
    <title>${pageTitle}</title>
</head>
<body>
<c:import url="parts/header.jsp"/>
<c:set var="userRole" value="${sessionScope.user.role.value}" scope="page"/>

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
                        <a href="Controller?command=go_to_home_page">
                            <img src="<c:url value="/resources/images/logo.png"/>" alt="logo">
                        </a>
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
                            <li>
                                <a href="Controller?command=ru_RU">
                                    <img src="<c:url value="/resources/images/elements/flag_russia.png"/>" height="30"
                                         width="40" alt="RU">
                                </a>
                            </li>
                            <li>
                                <a href="Controller?command=en_US">
                                    <img src="<c:url value="/resources/images/elements/flag_usa.png"/>" height="30"
                                         width="40" alt="EN">
                                </a>
                            </li>
                            <c:choose>
                                <c:when test="${sessionScope.user eq null}">
                                    <li class="menu-btn">
                                        <a href="Controller?command=go_to_sign_in_page"
                                           class="template-btn">${signIn}</a>
                                    </li>
                                    <li>
                                        <a href="Controller?command=go_to_sign_up_page"
                                           class="template-btn">${signUp}</a>
                                    </li>
                                </c:when>
                                <c:when test="${userRole eq 0 or userRole eq 1}">
                                    <a href="Controller?command=logout" class="template-btn">${logout}</a>
                                </c:when>
                                <c:when test="${userRole eq 2 or userRole eq 3}">
                                    <li class="menu-btn">
                                        <a href="Controller?command=go_to_profile_page" class="login">${profile}</a>
                                    </li>
                                    <li>
                                        <a href="Controller?command=logout" class="template-btn">${logout}</a>
                                    </li>
                                </c:when>
                            </c:choose>
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
                            <li class="active"><a href="Controller?command=go_to_home_page">${home}</a></li>
                            <c:choose>
                                <c:when test="${userRole eq 0}">
                                    <li><a href="Controller?command=go_to_platforms_page">${platformsButton}</a></li>
                                    <li><a href="Controller?command=go_to_users_page">${usersButton}</a></li>
                                </c:when>
                                <c:when test="${userRole eq 1}">
                                    <li><a href="Controller?command=go_to_platforms_page">${platformsButton}</a></li>
                                    <li><a href="Controller?command=go_to_add_vacancy_page">${addVacancyButton}</a></li>
                                    <li><a href="Controller?command=go_to_feedbacks_page">${feedbackButton}</a></li>
                                </c:when>
                                <c:when test="${userRole eq 2}">
                                    <li>
                                        <a href="Controller?command=go_to_interviewer_feedbacks_page">${feedbackButton}</a>
                                    </li>
                                </c:when>
                                <c:when test="${userRole eq 3}">
                                    <li>
                                        <a href="Controller?command=go_to_edit_user_page">${editUser}</a>
                                    </li>
                                </c:when>
                            </c:choose>
                            <c:if test="${requestScope.message ne null}">
                                <li>
                                    <c:out value="${messageText}"/>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header Area End -->

<!-- Page Title Starts -->
<div class="page-title text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <c:choose>
                    <c:when test="${not empty sessionScope.filterByEmploymentList}">
                        <h2>${employmentMessage}</h2>
                    </c:when>
                    <c:when test="${not empty sessionScope.filterByScheduleList}">
                        <h2>${platformMessage}</h2>
                    </c:when>
                    <c:when test="${not empty sessionScope.searchVacancy}">
                        <h2>${searchResults}</h2>
                    </c:when>
                    <c:when test="${empty sessionScope.vacanciesList}">
                        <h2>${emptyVacancies}</h2>
                        <p>${emptyVacanciesContinue}</p>
                        <c:if test="${sessionScope.user.role.value eq 1}">
                            <a href="Controller?command=go_to_add_vacancy_page"
                               class="template-btn">${addVacancyButton}</a>
                        </c:if>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<!-- Page Title End -->

<!-- Job Single Content Starts -->
<c:choose>
    <c:when test="${not empty sessionScope.vacanciesList}">
        <section class="job-single-content section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="jobs-tab tab-item">
                            <ul>
                                <c:forEach var="employment" items="${sessionScope.employmentList}">
                                    <li>
                                        <a class="nav-link"
                                           href="Controller?command=filter_vacancies_by_employment&filterIdType=${employment.id}"><c:out
                                                value="${employment.type}"/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="main-content">
                            <div class="single-content1">
                                <c:forEach var="vacancy" items="${sessionScope.vacanciesList}">
                                    <c:choose>
                                        <c:when test="${userRole eq 3 and sessionScope.user.vacancy.id eq vacancy.id}">
                                            <a href="Controller?command=go_to_vacancy_page&vacancyId=${vacancy.id}">
                                                <div class="single-job mb-4 d-lg-flex justify-content-between">
                                                    <div class="job-text">
                                                        <h4><c:out value="${vacancy.topic}"/></h4>
                                                        <ul class="mt-4">
                                                            <ctg:experience-label experience="${vacancy.experience}"
                                                                                  bundle="${sessionScope.locale}"/>
                                                            <li class="mb-3"><h5><em
                                                                    class="fa fa-calendar"></em> ${scheduleLabel}: ${vacancy.schedule.timetable}
                                                            </h5>
                                                            </li>
                                                            <li><h5><em
                                                                    class="fa fa-pie-chart"></em> ${interviewCountLabel}: ${vacancy.interviewsCount}
                                                            </h5></li>
                                                        </ul>
                                                    </div>
                                                    <div class="job-btn align-self-center">
                                                        <c:choose>
                                                            <c:when test="${vacancy.employment.id eq 1}">
                                                                <a class="third-btn job-btn1"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 2}">
                                                                <a class="third-btn job-btn2"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 3}">
                                                                <a class="third-btn job-btn3"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 4}">
                                                                <a class="third-btn job-btn4"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                        </c:choose>
                                                        <a href="Controller?command=go_to_interviews_page&vacancyId=${vacancy.id}"
                                                           style="margin-bottom: 10px"
                                                           class="third-btn">${interviewsButton}</a>
                                                        <c:if test="${userRole eq 2}">
                                                            <a href="Controller?command=go_to_add_interview_page&vacancyId=${vacancy.id}"
                                                               class="third-btn">${addInterviewButton}</a>
                                                        </c:if>
                                                    </div>
                                                    <c:if test="${userRole eq 1}">
                                                        <div class="job-btn align-top">
                                                            <a href="Controller?command=go_to_edit_vacancy_page&editVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                                            <a href="Controller?command=delete_vacancy&deleteVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em
                                                                    class="fa fa-close fa-2x"></em></a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </a>
                                        </c:when>
                                        <c:when test="${userRole eq null or userRole eq 0 or userRole eq 1 or userRole eq 2}">
                                            <a href="Controller?command=go_to_vacancy_page&vacancyId=${vacancy.id}">
                                                <div class="single-job mb-4 d-lg-flex justify-content-between">
                                                    <div class="job-text">
                                                        <h4><c:out value="${vacancy.topic}"/></h4>
                                                        <ul class="mt-4">
                                                            <ctg:experience-label experience="${vacancy.experience}"
                                                                                  bundle="${sessionScope.locale}"/>
                                                            <li class="mb-3"><h5><em
                                                                    class="fa fa-calendar"></em> ${scheduleLabel}: ${vacancy.schedule.timetable}
                                                            </h5>
                                                            </li>
                                                            <li><h5><em
                                                                    class="fa fa-pie-chart"></em> ${interviewCountLabel}: ${vacancy.interviewsCount}
                                                            </h5></li>
                                                        </ul>
                                                    </div>
                                                    <div class="job-btn align-self-center">
                                                        <c:choose>
                                                            <c:when test="${vacancy.employment.id eq 1}">
                                                                <a class="third-btn job-btn1"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 2}">
                                                                <a class="third-btn job-btn2"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 3}">
                                                                <a class="third-btn job-btn3"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 4}">
                                                                <a class="third-btn job-btn4"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                        </c:choose>
                                                        <a href="Controller?command=go_to_interviews_page&vacancyId=${vacancy.id}"
                                                           style="margin-bottom: 10px"
                                                           class="third-btn">${interviewsButton}</a>
                                                        <c:if test="${userRole eq 2}">
                                                            <a href="Controller?command=go_to_add_interview_page&vacancyId=${vacancy.id}"
                                                               class="third-btn">${addInterviewButton}</a>
                                                        </c:if>
                                                    </div>
                                                    <c:if test="${userRole eq 1}">
                                                        <div class="job-btn align-top">
                                                            <a href="Controller?command=go_to_edit_vacancy_page&editVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                                            <a href="Controller?command=delete_vacancy&deleteVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em
                                                                    class="fa fa-close fa-2x"></em></a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </a>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="sidebar mt-5 mt-lg-0">
                            <div class="single-widget search-widget">
                                <form class="example" action="Controller" method="post"
                                      style="margin:auto;max-width:300px">
                                    <input type="hidden" name="command" value="search_vacancies"/>
                                    <input type="text" placeholder="${searchPlaceholder}" name="searchVacancies"
                                           onfocus="this.placeholder = ''"
                                           onblur="this.placeholder = '${searchPlaceholder}'" required/>
                                    <button type="submit"><em class="fa fa-search"></em></button>
                                </form>
                            </div>
                            <div class="single-item mb-4">
                                <h4 class="mb-4">${scheduleLabel}</h4>
                                <c:forEach var="schedule" items="${sessionScope.scheduleList}">
                                    <a href="Controller?command=filter_vacancies_by_schedule&filterIdType=${schedule.id}"
                                       class="sidebar-btn d-flex justify-content-between mb-3">
                                        <span><c:out value="${schedule.timetable}"/></span>
                                        <span class="text-right"><c:out value="${schedule.count}"/></span>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </c:when>
    <c:when test="${not empty sessionScope.filterByScheduleList}">
        <section class="job-single-content section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="jobs-tab tab-item">
                            <ul>
                                <c:forEach var="employment" items="${sessionScope.employmentList}">
                                    <li>
                                        <a class="nav-link"
                                           href="Controller?command=filter_vacancies_by_employment&filterIdType=${employment.id}"><c:out
                                                value="${employment.type}"/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="main-content">
                            <div class="single-content1">
                                <c:forEach var="vacancy" items="${sessionScope.filterByScheduleList}">
                                    <c:choose>
                                        <c:when test="${userRole eq 3 and sessionScope.user.vacancy.id eq vacancy.id}">
                                            <a href="Controller?command=go_to_vacancy_page&vacancyId=${vacancy.id}">
                                                <div class="single-job mb-4 d-lg-flex justify-content-between">
                                                    <div class="job-text">
                                                        <h4><c:out value="${vacancy.topic}"/></h4>
                                                        <ul class="mt-4">
                                                            <ctg:experience-label experience="${vacancy.experience}"
                                                                                  bundle="${sessionScope.locale}"/>
                                                            <li class="mb-3"><h5><em
                                                                    class="fa fa-calendar"></em> ${scheduleLabel}: ${vacancy.schedule.timetable}
                                                            </h5>
                                                            </li>
                                                            <li><h5><em
                                                                    class="fa fa-pie-chart"></em> ${interviewCountLabel}: ${vacancy.interviewsCount}
                                                            </h5></li>
                                                        </ul>
                                                    </div>
                                                    <div class="job-btn align-self-center">
                                                        <c:choose>
                                                            <c:when test="${vacancy.employment.id eq 1}">
                                                                <a class="third-btn job-btn1"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 2}">
                                                                <a class="third-btn job-btn2"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 3}">
                                                                <a class="third-btn job-btn3"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 4}">
                                                                <a class="third-btn job-btn4"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                        </c:choose>
                                                        <a href="Controller?command=go_to_interviews_page&vacancyId=${vacancy.id}"
                                                           style="margin-bottom: 10px"
                                                           class="third-btn">${interviewsButton}</a>
                                                        <c:if test="${userRole eq 2}">
                                                            <a href="Controller?command=go_to_add_interview_page&vacancyId=${vacancy.id}"
                                                               class="third-btn">${addInterviewButton}</a>
                                                        </c:if>
                                                    </div>
                                                    <c:if test="${userRole eq 1}">
                                                        <div class="job-btn align-top">
                                                            <a href="Controller?command=go_to_edit_vacancy_page&editVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                                            <a href="Controller?command=delete_vacancy&deleteVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em
                                                                    class="fa fa-close fa-2x"></em></a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </a>
                                        </c:when>
                                        <c:when test="${userRole eq null or userRole eq 0 or userRole eq 1 or userRole eq 2}">
                                            <a href="Controller?command=go_to_vacancy_page&vacancyId=${vacancy.id}">
                                                <div class="single-job mb-4 d-lg-flex justify-content-between">
                                                    <div class="job-text">
                                                        <h4><c:out value="${vacancy.topic}"/></h4>
                                                        <ul class="mt-4">
                                                            <ctg:experience-label experience="${vacancy.experience}"
                                                                                  bundle="${sessionScope.locale}"/>
                                                            <li class="mb-3"><h5><em
                                                                    class="fa fa-calendar"></em> ${scheduleLabel}: ${vacancy.schedule.timetable}
                                                            </h5>
                                                            </li>
                                                            <li><h5><em
                                                                    class="fa fa-pie-chart"></em> ${interviewCountLabel}: ${vacancy.interviewsCount}
                                                            </h5></li>
                                                        </ul>
                                                    </div>
                                                    <div class="job-btn align-self-center">
                                                        <c:choose>
                                                            <c:when test="${vacancy.employment.id eq 1}">
                                                                <a class="third-btn job-btn1"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 2}">
                                                                <a class="third-btn job-btn2"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 3}">
                                                                <a class="third-btn job-btn3"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 4}">
                                                                <a class="third-btn job-btn4"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                        </c:choose>
                                                        <a href="Controller?command=go_to_interviews_page&vacancyId=${vacancy.id}"
                                                           style="margin-bottom: 10px"
                                                           class="third-btn">${interviewsButton}</a>
                                                        <c:if test="${userRole eq 2}">
                                                            <a href="Controller?command=go_to_add_interview_page&vacancyId=${vacancy.id}"
                                                               class="third-btn">${addInterviewButton}</a>
                                                        </c:if>
                                                    </div>
                                                    <c:if test="${userRole eq 1}">
                                                        <div class="job-btn align-top">
                                                            <a href="Controller?command=go_to_edit_vacancy_page&editVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                                            <a href="Controller?command=delete_vacancy&deleteVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em
                                                                    class="fa fa-close fa-2x"></em></a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </a>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="sidebar mt-5 mt-lg-0">
                            <div class="single-widget search-widget">
                                <form class="example" action="Controller" method="post"
                                      style="margin:auto;max-width:300px">
                                    <input type="hidden" name="command" value="search_vacancies"/>
                                    <input type="text" placeholder="${searchPlaceholder}" name="searchVacancies"
                                           onfocus="this.placeholder = ''"
                                           onblur="this.placeholder = '${searchPlaceholder}'" required/>
                                    <button type="submit"><em class="fa fa-search"></em></button>
                                </form>
                            </div>
                            <div class="single-item mb-4">
                                <h4 class="mb-4">${scheduleLabel}</h4>
                                <c:forEach var="schedule" items="${sessionScope.scheduleList}">
                                    <a href="Controller?command=filter_vacancies_by_schedule&filterIdType=${schedule.id}"
                                       class="sidebar-btn d-flex justify-content-between mb-3">
                                        <span><c:out value="${schedule.timetable}"/></span>
                                        <span class="text-right"><c:out value="${schedule.count}"/></span>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </c:when>
    <c:when test="${not empty sessionScope.filterByEmploymentList}">
        <section class="job-single-content section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="jobs-tab tab-item">
                            <ul>
                                <c:forEach var="employment" items="${sessionScope.employmentList}">
                                    <li>
                                        <a class="nav-link"
                                           href="Controller?command=filter_vacancies_by_employment&filterIdType=${employment.id}"><c:out
                                                value="${employment.type}"/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="main-content">
                            <div class="single-content1">
                                <c:forEach var="vacancy" items="${sessionScope.filterByEmploymentList}">
                                    <c:choose>
                                        <c:when test="${userRole eq 3 and sessionScope.user.vacancy.id eq vacancy.id}">
                                            <a href="Controller?command=go_to_vacancy_page&vacancyId=${vacancy.id}">
                                                <div class="single-job mb-4 d-lg-flex justify-content-between">
                                                    <div class="job-text">
                                                        <h4><c:out value="${vacancy.topic}"/></h4>
                                                        <ul class="mt-4">
                                                            <ctg:experience-label experience="${vacancy.experience}"
                                                                                  bundle="${sessionScope.locale}"/>
                                                            <li class="mb-3"><h5><em
                                                                    class="fa fa-calendar"></em> ${scheduleLabel}: ${vacancy.schedule.timetable}
                                                            </h5>
                                                            </li>
                                                            <li><h5><em
                                                                    class="fa fa-pie-chart"></em> ${interviewCountLabel}: ${vacancy.interviewsCount}
                                                            </h5></li>
                                                        </ul>
                                                    </div>
                                                    <div class="job-btn align-self-center">
                                                        <c:choose>
                                                            <c:when test="${vacancy.employment.id eq 1}">
                                                                <a class="third-btn job-btn1"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 2}">
                                                                <a class="third-btn job-btn2"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 3}">
                                                                <a class="third-btn job-btn3"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 4}">
                                                                <a class="third-btn job-btn4"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                        </c:choose>
                                                        <a href="Controller?command=go_to_interviews_page&vacancyId=${vacancy.id}"
                                                           style="margin-bottom: 10px"
                                                           class="third-btn">${interviewsButton}</a>
                                                        <c:if test="${userRole eq 2}">
                                                            <a href="Controller?command=go_to_add_interview_page&vacancyId=${vacancy.id}"
                                                               class="third-btn">${addInterviewButton}</a>
                                                        </c:if>
                                                    </div>
                                                    <c:if test="${userRole eq 1}">
                                                        <div class="job-btn align-top">
                                                            <a href="Controller?command=go_to_edit_vacancy_page&editVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                                            <a href="Controller?command=delete_vacancy&deleteVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em
                                                                    class="fa fa-close fa-2x"></em></a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </a>
                                        </c:when>
                                        <c:when test="${userRole eq null or userRole eq 0 or userRole eq 1 or userRole eq 2}">
                                            <a href="Controller?command=go_to_vacancy_page&vacancyId=${vacancy.id}">
                                                <div class="single-job mb-4 d-lg-flex justify-content-between">
                                                    <div class="job-text">
                                                        <h4><c:out value="${vacancy.topic}"/></h4>
                                                        <ul class="mt-4">
                                                            <ctg:experience-label experience="${vacancy.experience}"
                                                                                  bundle="${sessionScope.locale}"/>
                                                            <li class="mb-3"><h5><em
                                                                    class="fa fa-calendar"></em> ${scheduleLabel}: ${vacancy.schedule.timetable}
                                                            </h5>
                                                            </li>
                                                            <li><h5><em
                                                                    class="fa fa-pie-chart"></em> ${interviewCountLabel}: ${vacancy.interviewsCount}
                                                            </h5></li>
                                                        </ul>
                                                    </div>
                                                    <div class="job-btn align-self-center">
                                                        <c:choose>
                                                            <c:when test="${vacancy.employment.id eq 1}">
                                                                <a class="third-btn job-btn1"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 2}">
                                                                <a class="third-btn job-btn2"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 3}">
                                                                <a class="third-btn job-btn3"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 4}">
                                                                <a class="third-btn job-btn4"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                        </c:choose>
                                                        <a href="Controller?command=go_to_interviews_page&vacancyId=${vacancy.id}"
                                                           style="margin-bottom: 10px"
                                                           class="third-btn">${interviewsButton}</a>
                                                        <c:if test="${userRole eq 2}">
                                                            <a href="Controller?command=go_to_add_interview_page&vacancyId=${vacancy.id}"
                                                               class="third-btn">${addInterviewButton}</a>
                                                        </c:if>
                                                    </div>
                                                    <c:if test="${userRole eq 1}">
                                                        <div class="job-btn align-top">
                                                            <a href="Controller?command=go_to_edit_vacancy_page&editVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                                            <a href="Controller?command=delete_vacancy&deleteVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em
                                                                    class="fa fa-close fa-2x"></em></a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </a>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="sidebar mt-5 mt-lg-0">
                            <div class="single-widget search-widget">
                                <form class="example" action="Controller" method="post"
                                      style="margin:auto;max-width:300px">
                                    <input type="hidden" name="command" value="search_vacancies"/>
                                    <input type="text" placeholder="${searchPlaceholder}" name="searchVacancies"
                                           onfocus="this.placeholder = ''"
                                           onblur="this.placeholder = '${searchPlaceholder}'" required/>
                                    <button type="submit"><em class="fa fa-search"></em></button>
                                </form>
                            </div>
                            <div class="single-item mb-4">
                                <h4 class="mb-4">${scheduleLabel}</h4>
                                <c:forEach var="schedule" items="${sessionScope.scheduleList}">
                                    <a href="Controller?command=filter_vacancies_by_schedule&filterIdType=${schedule.id}"
                                       class="sidebar-btn d-flex justify-content-between mb-3">
                                        <span><c:out value="${schedule.timetable}"/></span>
                                        <span class="text-right"><c:out value="${schedule.count}"/></span>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </c:when>
    <c:when test="${not empty sessionScope.searchVacanciesList}">
        <section class="job-single-content section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="jobs-tab tab-item">
                            <ul>
                                <c:forEach var="employment" items="${sessionScope.employmentList}">
                                    <li>
                                        <a class="nav-link"
                                           href="Controller?command=filter_vacancies_by_employment&filterIdType=${employment.id}"><c:out
                                                value="${employment.type}"/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="main-content">
                            <div class="single-content1">
                                <c:forEach var="vacancy" items="${sessionScope.searchVacanciesList}">
                                    <c:choose>
                                        <c:when test="${userRole eq 3 and sessionScope.user.vacancy.id eq vacancy.id}">
                                            <a href="Controller?command=go_to_vacancy_page&vacancyId=${vacancy.id}">
                                                <div class="single-job mb-4 d-lg-flex justify-content-between">
                                                    <div class="job-text">
                                                        <h4><c:out value="${vacancy.topic}"/></h4>
                                                        <ul class="mt-4">
                                                            <ctg:experience-label experience="${vacancy.experience}"
                                                                                  bundle="${sessionScope.locale}"/>
                                                            <li class="mb-3"><h5><em
                                                                    class="fa fa-calendar"></em> ${scheduleLabel}: ${vacancy.schedule.timetable}
                                                            </h5>
                                                            </li>
                                                            <li><h5><em
                                                                    class="fa fa-pie-chart"></em> ${interviewCountLabel}: ${vacancy.interviewsCount}
                                                            </h5></li>
                                                        </ul>
                                                    </div>
                                                    <div class="job-btn align-self-center">
                                                        <c:choose>
                                                            <c:when test="${vacancy.employment.id eq 1}">
                                                                <a class="third-btn job-btn1"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 2}">
                                                                <a class="third-btn job-btn2"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 3}">
                                                                <a class="third-btn job-btn3"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 4}">
                                                                <a class="third-btn job-btn4"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                        </c:choose>
                                                        <a href="Controller?command=go_to_interviews_page&vacancyId=${vacancy.id}"
                                                           style="margin-bottom: 10px"
                                                           class="third-btn">${interviewsButton}</a>
                                                        <c:if test="${userRole eq 2}">
                                                            <a href="Controller?command=go_to_add_interview_page&vacancyId=${vacancy.id}"
                                                               class="third-btn">${addInterviewButton}</a>
                                                        </c:if>
                                                    </div>
                                                    <c:if test="${userRole eq 1}">
                                                        <div class="job-btn align-top">
                                                            <a href="Controller?command=go_to_edit_vacancy_page&editVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                                            <a href="Controller?command=delete_vacancy&deleteVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em
                                                                    class="fa fa-close fa-2x"></em></a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </a>
                                        </c:when>
                                        <c:when test="${userRole eq null or userRole eq 0 or userRole eq 1 or userRole eq 2}">
                                            <a href="Controller?command=go_to_vacancy_page&vacancyId=${vacancy.id}">
                                                <div class="single-job mb-4 d-lg-flex justify-content-between">
                                                    <div class="job-text">
                                                        <h4><c:out value="${vacancy.topic}"/></h4>
                                                        <ul class="mt-4">
                                                            <ctg:experience-label experience="${vacancy.experience}"
                                                                                  bundle="${sessionScope.locale}"/>
                                                            <li class="mb-3"><h5><em
                                                                    class="fa fa-calendar"></em> ${scheduleLabel}: ${vacancy.schedule.timetable}
                                                            </h5>
                                                            </li>
                                                            <li><h5><em
                                                                    class="fa fa-pie-chart"></em> ${interviewCountLabel}: ${vacancy.interviewsCount}
                                                            </h5></li>
                                                        </ul>
                                                    </div>
                                                    <div class="job-btn align-self-center">
                                                        <c:choose>
                                                            <c:when test="${vacancy.employment.id eq 1}">
                                                                <a class="third-btn job-btn1"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 2}">
                                                                <a class="third-btn job-btn2"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 3}">
                                                                <a class="third-btn job-btn3"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                            <c:when test="${vacancy.employment.id eq 4}">
                                                                <a class="third-btn job-btn4"><c:out
                                                                        value="${vacancy.employment.type}"/></a>
                                                            </c:when>
                                                        </c:choose>
                                                        <a href="Controller?command=go_to_interviews_page&vacancyId=${vacancy.id}"
                                                           style="margin-bottom: 10px"
                                                           class="third-btn">${interviewsButton}</a>
                                                        <c:if test="${userRole eq 2}">
                                                            <a href="Controller?command=go_to_add_interview_page&vacancyId=${vacancy.id}"
                                                               class="third-btn">${addInterviewButton}</a>
                                                        </c:if>
                                                    </div>
                                                    <c:if test="${userRole eq 1}">
                                                        <div class="job-btn align-top">
                                                            <a href="Controller?command=go_to_edit_vacancy_page&editVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                                            <a href="Controller?command=delete_vacancy&deleteVacancyId=${vacancy.id}"
                                                               style="color: #0b2e13"><em
                                                                    class="fa fa-close fa-2x"></em></a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </a>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="sidebar mt-5 mt-lg-0">
                            <div class="single-widget search-widget">
                                <form class="example" action="Controller" method="post"
                                      style="margin:auto;max-width:300px">
                                    <input type="hidden" name="command" value="search_vacancies"/>
                                    <input type="text" placeholder="${searchPlaceholder}" name="searchVacancies"
                                           onfocus="this.placeholder = ''"
                                           onblur="this.placeholder = '${searchPlaceholder}'" required/>
                                    <button type="submit"><em class="fa fa-search"></em></button>
                                </form>
                            </div>
                            <div class="single-item mb-4">
                                <h4 class="mb-4">${scheduleLabel}</h4>
                                <c:forEach var="schedule" items="${sessionScope.scheduleList}">
                                    <a href="Controller?command=filter_vacancies_by_schedule&filterIdType=${schedule.id}"
                                       class="sidebar-btn d-flex justify-content-between mb-3">
                                        <span><c:out value="${schedule.timetable}"/></span>
                                        <span class="text-right"><c:out value="${schedule.count}"/></span>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </c:when>
</c:choose>
<!-- Job Single Content End -->

<div id="wrapper"></div>

<!-- Footer Area Starts -->
<c:import url="parts/footer.jsp"/>
<!-- Footer Area End -->
</body>
</html>
