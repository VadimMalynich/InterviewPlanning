<%--
  Created by IntelliJ IDEA.
  User: Vadim
  Date: 08.12.2021
  Time: 17:52
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

    <fmt:message bundle="${loc}" key="logout.button" var="logout"/>
    <fmt:message bundle="${loc}" key="home.button" var="home"/>
    <fmt:message bundle="${loc}" key="label.platforms" var="platformsButton"/>
    <fmt:message bundle="${loc}" key="add.vacancy.button" var="addVacancyButton"/>

    <fmt:message bundle="${loc}" key="label.vacancy" var="vacancyLabel"/>
    <fmt:message bundle="${loc}" key="label.interviewer" var="interviewerLabel"/>
    <fmt:message bundle="${loc}" key="label.requirements.additional" var="additional"/>
    <fmt:message bundle="${loc}" key="label.review" var="reviewLabel"/>
    <fmt:message bundle="${loc}" key="label.mark" var="markLabel"/>

    <fmt:message bundle="${loc}" key="feedback.button" var="pageTitle"/>

    <fmt:message bundle="${loc}" key="message.emptyFeedbacks" var="emptyFeedbacks"/>
    <fmt:message bundle="${loc}" key="message.meetAdd" var="respond"/>
    <fmt:message bundle="${loc}" key="message.not.meetAdd" var="notRespond"/>

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
                            <li>
                                <a href="Controller?command=logout" class="template-btn">${logout}</a>
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
                            <li class="active"><a href="Controller?command=go_to_home_page">${home}</a></li>
                            <li><a href="Controller?command=go_to_platforms_page">${platformsButton}</a></li>
                            <li><a href="Controller?command=go_to_add_vacancy_page">${addVacancyButton}</a></li>
                            <li><a href="Controller?command=go_to_feedbacks_page">${pageTitle}</a></li>
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
                    <c:when test="${empty sessionScope.feedbackList}">
                        <h2>${emptyFeedbacks}</h2>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<!-- Page Title End -->

<!-- Job Single Content Starts -->
<section class="job-single-content section-padding">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-content">
                    <div class="single-content1">
                        <c:forEach var="feedback" items="${sessionScope.feedbackList}">
                            <div class="single-job mb-4 d-lg-flex justify-content-between">
                                <div class="job-text">
                                    <h4>${vacancyLabel}: ${feedback.interview.vacancy.topic}</h4>
                                    <ul class="mt-4">
                                        <li class="mb-3"><h5><em
                                                class="fa fa-user-secret"></em> ${interviewerLabel}: ${feedback.user.name}
                                        </h5></li>
                                        <li class="mb-3"><h5><em
                                                class="fa fa-book"></em> ${reviewLabel}: ${feedback.description}</h5>
                                        </li>

                                        <li class="mb-3"><h5><em class="fa fa-info"></em> ${markLabel}: ${feedback.mark}
                                        </h5></li>
                                    </ul>
                                </div>
                                <div class="job-btn align-self-center">
                                    <c:choose>
                                        <c:when test="${feedback.additionalRequirements}">
                                            <a class="third-btn job-btn4"><c:out value="${respond}"/></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="third-btn job-btn2"><c:out value="${notRespond}"/></a>
                                        </c:otherwise>
                                    </c:choose>
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

<!-- Footer Area Starts -->
<c:import url="parts/footer.jsp"/>
<!-- Footer Area End -->
</body>
</html>
