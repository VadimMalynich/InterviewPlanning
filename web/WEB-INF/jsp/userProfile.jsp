<%--
  Created by IntelliJ IDEA.
  User: Vadim
  Date: 07.12.2021
  Time: 22:38
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
    <fmt:message bundle="${loc}" key="add.interview.button" var="addInterviewButton"/>
    <fmt:message bundle="${loc}" key="add.vacancy.button" var="addVacancyButton"/>
    <fmt:message bundle="${loc}" key="label.platforms" var="platformsButton"/>

    <fmt:message bundle="${loc}" key="label.date" var="dateLabel"/>
    <fmt:message bundle="${loc}" key="label.startTime" var="startLabel"/>
    <fmt:message bundle="${loc}" key="label.endTime" var="endLabel"/>
    <fmt:message bundle="${loc}" key="label.platform" var="platformLabel"/>
    <fmt:message bundle="${loc}" key="label.interviewer" var="interviewerLabel"/>
    <fmt:message bundle="${loc}" key="label.welcome" var="welcome">
        <fmt:param value="${sessionScope.user.name}"/>
    </fmt:message>

    <fmt:message bundle="${loc}" key="searchInterview.input.placeholder" var="searchPlaceholder"/>


    <fmt:message bundle="${loc}" key="message.searchResults" var="searchResults">
        <fmt:param value="${sessionScope.searchInterview}"/>
    </fmt:message>
    <fmt:message bundle="${loc}" key="message.platform" var="platformMessage">
        <fmt:param value="${sessionScope.filterPlatform}"/>
    </fmt:message>
    <c:if test="${requestScope.message ne null}">
        <fmt:message bundle="${loc}" key="${requestScope.message}" var="messageText"/>
    </c:if>
    <fmt:message bundle="${loc}" key="message.emptyInterviews" var="emptyInterviews"/>
    <fmt:message bundle="${loc}" key="message.emptyInterviews.continue" var="emptyInterviewsContinue"/>

    <!-- Page Title -->
    <title>${profile}</title>
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
<header class="newsletter-area section-padding3">
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo-area">
                        <a href="Controller?command=go_to_home_page">
                            <img src="<c:url value="/resources/images/logo-light.png"/>" alt="logo">
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
                            <li class="menu-btn">
                                <a href="Controller?command=go_to_profile_page" class="login">${profile}</a>
                                <a href="Controller?command=logout" class="template-btn">${logout}</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <div class="custom-navbar">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <div class="main-menu main-menu-light">
                            <ul>
                                <li class="active"><a href="Controller?command=go_to_home_page">${home}</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <c:if test="${requestScope.message ne null}">
                    <div class="col-lg-6">
                        <div class="main-menu main-menu-light">
                            <ul>
                                <li style="color: #fff">
                                    <c:out value="${messageText}"/>
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <div class="page-title text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <br>
                    <h2 id="welcome">${welcome}</h2>
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
                <br><br><br>
                <c:choose>
                    <c:when test="${sessionScope.filterPlatform ne null}">
                        <h2>${platformMessage}</h2>
                    </c:when>
                    <c:when test="${sessionScope.searchInterview ne null}">
                        <h2>${searchResults}</h2>
                    </c:when>
                    <c:when test="${empty sessionScope.interviewsList}">
                        <h2>${emptyInterviews}</h2>
                        <p>${emptyInterviewsContinue}</p>
<%--                        <a href="Controller?command=go_to_add_interview_page"--%>
<%--                           class="template-btn">${addInterviewButton}</a>--%>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<!-- Page Title End -->

<!-- Job Single Content Starts -->
<c:choose>
    <c:when test="${not empty sessionScope.interviewsList}">
        <section class="job-single-content section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="main-content">
                            <div class="single-content1">
                                <c:forEach var="interview" items="${sessionScope.interviewsList}">
                                    <div class="single-job mb-4 d-lg-flex justify-content-between">
                                        <div class="job-text">
                                            <h4>${interview.topic}</h4>
                                            <ul class="mt-4">
                                                <li class="mb-3"><h5><em
                                                        class="fa fa-user"></em> ${interview.vacancy.topic}
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
                                        <div class="job-btn align-top">
                                            <a href="Controller?command=go_to_edit_interview_page&editInterviewId=${interview.id}"
                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                            <a href="Controller?command=delete_interview&deleteInterviewId=${interview.id}"
                                               style="color: #0b2e13"><em class="fa fa-close fa-2x"></em></a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="sidebar mt-5 mt-lg-0">
                            <div class="single-widget search-widget">
                                <form class="example" action="Controller" method="post"
                                      style="margin:auto;max-width:300px">
                                    <input type="hidden" name="command" value="search_interviews"/>
                                    <input type="text" placeholder="${searchPlaceholder}" name="searchInterviews"
                                           onfocus="this.placeholder = ''"
                                           onblur="this.placeholder = '${searchPlaceholder}'" required>
                                    <button type="submit"><em class="fa fa-search"></em></button>
                                </form>
                            </div>
                            <div class="single-item mb-4">
                                <h4 class="mb-4">${platformsButton}</h4>
                                <c:forEach var="platform" items="${sessionScope.platformsList}">
                                    <a href="Controller?command=filter_interviews&filterIdType=${platform.id}"
                                       class="sidebar-btn d-flex justify-content-between mb-3">
                                        <span><c:out value="${platform.name}"/></span>
                                        <span class="text-right"><c:out value="${platform.count}"/></span>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </c:when>
    <c:when test="${not empty sessionScope.filterInterviewsList}">
        <section class="job-single-content section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="main-content">
                            <div class="single-content1">
                                <c:forEach var="interview" items="${sessionScope.filterInterviewsList}">
                                    <div class="single-job mb-4 d-lg-flex justify-content-between">
                                        <div class="job-text">
                                            <h4>${interview.topic}</h4>
                                            <ul class="mt-4">
                                                <li class="mb-3"><h5><em
                                                        class="fa fa-user"></em> ${interview.vacancy.topic}
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
                                        <div class="job-btn align-top">
                                            <a href="Controller?command=go_to_edit_interview_page&editInterviewId=${interview.id}"
                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                            <a href="Controller?command=delete_interview&deleteInterviewId=${interview.id}"
                                               style="color: #0b2e13"><em class="fa fa-close fa-2x"></em></a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="sidebar mt-5 mt-lg-0">
                            <div class="single-widget search-widget">
                                <form class="example" action="Controller" method="post"
                                      style="margin:auto;max-width:300px">
                                    <input type="hidden" name="command" value="search_interviews"/>
                                    <input type="text" placeholder="${searchPlaceholder}" name="searchInterviews"
                                           onfocus="this.placeholder = ''"
                                           onblur="this.placeholder = '${searchPlaceholder}'" required>
                                    <button type="submit"><em class="fa fa-search"></em></button>
                                </form>
                            </div>
                            <div class="single-item mb-4">
                                <h4 class="mb-4">${platformsButton}</h4>
                                <c:forEach var="platform" items="${sessionScope.platformsList}">
                                    <a href="Controller?command=filter_interviews&filterIdType=${platform.id}"
                                       class="sidebar-btn d-flex justify-content-between mb-3">
                                        <span><c:out value="${platform.name}"/></span>
                                        <span class="text-right"><c:out value="${platform.count}"/></span>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </c:when>
    <c:when test="${not empty sessionScope.searchInterviewsList}">
        <section class="job-single-content section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="main-content">
                            <div class="single-content1">
                                <c:forEach var="interview" items="${sessionScope.searchInterviewsList}">
                                    <div class="single-job mb-4 d-lg-flex justify-content-between">
                                        <div class="job-text">
                                            <h4>${interview.topic}</h4>
                                            <ul class="mt-4">
                                                <li class="mb-3"><h5><em
                                                        class="fa fa-user"></em> ${interview.vacancy.topic}
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
                                        <div class="job-btn align-top">
                                            <a href="Controller?command=go_to_edit_interview_page&editInterviewId=${interview.id}"
                                               style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                            <a href="Controller?command=delete_interview&deleteInterviewId=${interview.id}"
                                               style="color: #0b2e13"><em class="fa fa-close fa-2x"></em></a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="sidebar mt-5 mt-lg-0">
                            <div class="single-widget search-widget">
                                <form class="example" action="Controller" method="post"
                                      style="margin:auto;max-width:300px">
                                    <input type="hidden" name="command" value="search_interviews"/>
                                    <input type="text" placeholder="${searchPlaceholder}" name="searchInterviews"
                                           onfocus="this.placeholder = ''"
                                           onblur="this.placeholder = '${searchPlaceholder}'" required>
                                    <button type="submit"><em class="fa fa-search"></em></button>
                                </form>
                            </div>
                            <div class="single-item mb-4">
                                <h4 class="mb-4">${platformsButton}</h4>
                                <c:forEach var="platform" items="${sessionScope.platformsList}">
                                    <a href="Controller?command=filter_interviews&filterIdType=${platform.id}"
                                       class="sidebar-btn d-flex justify-content-between mb-3">
                                        <span><c:out value="${platform.name}"/></span>
                                        <span class="text-right"><c:out value="${platform.count}"/></span>
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

<!-- Footer Area -->
<c:import url="parts/footer.jsp"/>
<!-- Footer Area End -->
</body>
</html>
