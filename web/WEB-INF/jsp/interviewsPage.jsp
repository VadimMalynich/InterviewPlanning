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
    <fmt:message bundle="${loc}" key="book.button" var="bookButton"/>
    <fmt:message bundle="${loc}" key="users.button" var="usersButton"/>
    <fmt:message bundle="${loc}" key="add.vacancy.button" var="addVacancyButton"/>
    <fmt:message bundle="${loc}" key="feedback.button" var="feedbackButton"/>

    <fmt:message bundle="${loc}" key="label.platforms" var="platformsButton"/>
    <fmt:message bundle="${loc}" key="label.date" var="dateLabel"/>
    <fmt:message bundle="${loc}" key="label.startTime" var="startLabel"/>
    <fmt:message bundle="${loc}" key="label.endTime" var="endLabel"/>
    <fmt:message bundle="${loc}" key="label.platform" var="platformLabel"/>
    <fmt:message bundle="${loc}" key="label.interviewer" var="interviewerLabel"/>
    <fmt:message bundle="${loc}" key="label.vacancy" var="vacancyLabel"/>

    <fmt:message bundle="${loc}" key="page.home" var="pageTitle"/>

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
                                <c:when test="${userRole eq 2}">
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
                                    <li><a href="Controller?command=go_to_interviewer_feedbacks_page">${feedbackButton}</a></li>
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

<!-- Job Single Content Starts -->
<section class="job-single-content section-padding">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-content">
                    <div class="single-content1">
                        <c:forEach var="interview" items="${sessionScope.interviewsList}">
                            <div class="single-job mb-4 d-lg-flex justify-content-between">
                                <div class="job-text">
                                    <h4>${interview.topic}</h4>
                                    <ul class="mt-4">
                                        <li class="mb-3"><h5><em
                                                class="fa fa-user"></em> ${vacancyLabel}: ${interview.vacancy.topic}
                                        </h5></li>
                                        <li class="mb-3"><h5><em
                                                class="fa fa-user-secret"></em> ${interviewerLabel}: ${interview.user.name}
                                        </h5></li>
                                        <li class="mb-3"><h5><em class="fa fa-calendar"></em> ${dateLabel}:
                                            <fmt:formatDate value="${interview.date}" type="date"/></h5></li>
                                        <li class="mb-3"><h5><em
                                                class="fa fa-hourglass-start"></em> ${startLabel}: ${interview.startTime}
                                        </h5></li>
                                        <li class="mb-3"><h5><em
                                                class="fa fa-hourglass-end"></em> ${endLabel}: ${interview.endTime}
                                        </h5>
                                        </li>
                                        <li><h5><em
                                                class="fa fa-video-camera"></em> ${platformLabel}: ${interview.platform.name}
                                        </h5></li>
                                    </ul>
                                </div>
                                <div class="job-btn align-self-center">
                                    <button type="button" class="third-btn">${bookButton}</button>
                                </div>
                            </div>
                        </c:forEach>
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
