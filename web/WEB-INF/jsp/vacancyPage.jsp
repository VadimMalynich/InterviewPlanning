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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%@ taglib prefix="ctg" uri="customtags" %>--%>
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
    <fmt:message bundle="${loc}" key="interview.button" var="interviewButton"/>
    <fmt:message bundle="${loc}" key="users.button" var="usersButton"/>
    <fmt:message bundle="${loc}" key="add.interview.button" var="addInterviewButton"/>
    <fmt:message bundle="${loc}" key="add.vacancy.button" var="addVacancyButton"/>
    <fmt:message bundle="${loc}" key="label.platforms" var="platformsButton"/>

    <fmt:message bundle="${loc}" key="label.experience" var="experienceLabel"/>
    <fmt:message bundle="${loc}" key="label.interviewCount" var="interviewCountLabel"/>
    <fmt:message bundle="${loc}" key="label.requirements" var="requirementsLabel"/>
    <fmt:message bundle="${loc}" key="label.schedule" var="scheduleLabel"/>
    <fmt:message bundle="${loc}" key="label.requirements.additional" var="additional"/>
    <fmt:message bundle="${loc}" key="label.employments" var="employments"/>
    <fmt:message bundle="${loc}" key="label.description" var="descriptionLabel"/>

    <fmt:message bundle="${loc}" key="vacancy.topic.input.placeholder" var="topicPlaceholder"/>
    <fmt:message bundle="${loc}" key="vacancy.topic.input.placeholderFocus" var="topicPlaceholderFocus"/>
    <fmt:message bundle="${loc}" key="experience.input.placeholder" var="experiencePlaceholder"/>
    <fmt:message bundle="${loc}" key="description.textarea.placeholder" var="descriptionPlaceholder"/>
    <fmt:message bundle="${loc}" key="requirements.textarea.placeholder" var="requirementsPlaceholder"/>
    <fmt:message bundle="${loc}" key="addrequirements.textarea.placeholder" var="addRequirementsPlaceholder"/>

    <fmt:message bundle="${loc}" key="page.addVacancy" var="pageTitle"/>

    <c:if test="${requestScope.message ne null}">
        <fmt:message bundle="${loc}" key="${requestScope.message}" var="messageText"/>
    </c:if>

    <title>${sessionScope.vacancyPageInfo.topic}</title>
</head>
<body>
<c:import url="parts/header.jsp"/>
<c:set var="vacancy" value="${sessionScope.vacancyPageInfo}" scope="page"/>
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
                                    <img src="<c:url value="/resources/images/elements/flag_russia.png"/> " height="30"
                                         width="40" alt="RU">
                                </a>
                            </li>
                            <li>
                                <a href="Controller?command=en_US">
                                    <img src="<c:url value="/resources/images/elements/flag_usa.png"/> " height="30"
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
                                        <a href="Controller?command=go_to_user_profile_page"
                                           class="login">${profile}</a>
                                    </li>
                                    <li>
                                        <a href="Controller?command=logout" class="template-btn">${logout}</a>
                                    </li>
                                </c:when>
                            </c:choose>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
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
                                    <li><a href="Controller?command=go_to_users_page">${usersButton}</a></li>
                                    <li><a href="Controller?command=go_to_platforms_page">${platformsButton}</a></li>
                                </c:when>
                                <c:when test="${userRole eq 1}">
                                    <li><a href="Controller?command=go_to_add_vacancy_page">${addVacancyButton}</a></li>
                                    <li><a href="Controller?command=go_to_platforms_page">${platformsButton}</a></li>
                                </c:when>
                                <c:when test="${userRole eq 2}">
                                    <li><a href="Controller?command=go_to_add_interview_page">${addInterviewButton}</a>
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

<!-- Job Single Content Starts -->
<section class="job-single-content section-padding">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-content">
                    <div class="single-content1">
                        <div class="single-job mb-4 d-lg-flex justify-content-between">
                            <div class="job-text">
                                <h4><c:out value="${vacancy.topic}"/></h4>
                                <ul class="mt-4">
                                    <li class="mb-3"><h5><em class="fa fa-id-card-o"></em> <c:out
                                            value=" ${experienceLabel}: ${vacancy.experience}"/></h5>
                                    </li>
                                    <li class="mb-3"><h5><em class="fa fa-calendar"></em> <c:out
                                            value=" ${scheduleLabel}: ${vacancy.schedule.timetable}"/></h5></li>
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
                                <a href="#" class="third-btn">${interviewButton}</a>
                            </div>
                        </div>
                    </div>
                    <div class="single-content2 py-4">
                        <h4>${descriptionLabel}</h4>
                        <p><c:out value="${vacancy.description}"/></p>
                    </div>
                    <div class="single-content4 py-4">
                        <h4>${requirementsLabel}</h4>
                        <ul class="mt-3">
                            <c:forEach var="req" items="${fn:split(vacancy.requirements, '.') }">
                                <li class="mb-2"><c:out value="${req}"/></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="single-content6 py-4">
                        <h4>${employments}</h4>
                        <span><c:out value="${vacancy.employment.type}"/></span>
                    </div>
                    <div class="single-content7 py-4">
                        <h4>${additional}</h4>
                        <ul class="mt-3">
                            <c:forEach var="addReq" items="${fn:split(vacancy.additionalRequirements, '.') }">
                                <li class="mb-2"><c:out value="${addReq}"/></li>
                            </c:forEach>
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
