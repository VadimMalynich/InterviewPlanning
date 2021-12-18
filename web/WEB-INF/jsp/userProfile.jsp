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

    <fmt:message bundle="${loc}" key="logout.button" var="logout"/>
    <fmt:message bundle="${loc}" key="profile.button" var="profile"/>
    <fmt:message bundle="${loc}" key="home.button" var="home"/>
    <fmt:message bundle="${loc}" key="add.interview.button" var="addInterviewButton"/>
    <fmt:message bundle="${loc}" key="label.platforms" var="platformsButton"/>
    <fmt:message bundle="${loc}" key="feedback.button" var="feedbackButton"/>
    <fmt:message bundle="${loc}" key="cancel.button" var="cancelButton"/>
    <fmt:message bundle="${loc}" key="edit.user.button" var="editUser"/>

    <fmt:message bundle="${loc}" key="label.date" var="dateLabel"/>
    <fmt:message bundle="${loc}" key="label.interview.topic" var="interviewTopic"/>
    <fmt:message bundle="${loc}" key="label.startTime" var="startLabel"/>
    <fmt:message bundle="${loc}" key="label.endTime" var="endLabel"/>
    <fmt:message bundle="${loc}" key="label.platform" var="platformLabel"/>
    <fmt:message bundle="${loc}" key="label.interviewer" var="interviewerLabel"/>
    <fmt:message bundle="${loc}" key="label.welcome" var="welcome">
        <fmt:param value="${sessionScope.user.name}"/>
    </fmt:message>
    <fmt:message bundle="${loc}" key="label.userInterviews" var="userInterviews"/>
    <fmt:message bundle="${loc}" key="label.vacancy" var="vacancyLabel"/>

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
    <fmt:message bundle="${loc}" key="message.user.empryInterviews" var="emptyUserInterviews"/>
    <fmt:message bundle="${loc}" key="message.user.emptyInterviews.continue" var="emptyUserInterviewsContinue"/>
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
                                <c:if test="${userRole eq 2}">
                                    <li>
                                        <a href="Controller?command=go_to_interviewer_feedbacks_page">${feedbackButton}</a>
                                    </li>
                                </c:if>
                                <c:if test="${userRole eq 3}">
                                    <li>
                                        <a href="Controller?command=go_to_edit_user_page">${editUser}</a>
                                    </li>
                                </c:if>
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
                    <c:when test="${not empty sessionScope.filterPlatform}">
                        <h2>${platformMessage}</h2>
                    </c:when>
                    <c:when test="${not empty sessionScope.searchInterview}">
                        <h2>${searchResults}</h2>
                    </c:when>
                    <c:when test="${empty sessionScope.interviewsList}">
                        <c:choose>
                            <c:when test="${userRole eq 2}">
                                <h2>${emptyInterviews}</h2>
                                <p>${emptyInterviewsContinue}</p>
                            </c:when>
                            <c:when test="${userRole eq 3}">
                                <h2>${emptyUserInterviews}</h2>
                                <p>${emptyUserInterviewsContinue}</p>
                            </c:when>
                        </c:choose>
                        <%--                        <a href="Controller?command=go_to_add_interview_page"--%>
                        <%--                           class="template-btn">${addInterviewButton}</a>--%>
                    </c:when>
                    <c:when test="${not empty sessionScope.interviewsList}">
                        <h2>${userInterviews}</h2>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<!-- Page Title End -->

<!-- Job Single Content Starts -->
<c:choose>
    <c:when test="${not empty sessionScope.interviewsList and userRole eq 3}">
        <c:choose>
            <c:when test="${sessionScope.interviewsList.get(0).date.compareTo(sessionScope.currentDate) eq 0}">
                <c:set value="${sessionScope.currentDate}" var="interviewDate" scope="page"/>
            </c:when>
            <c:otherwise>
                <c:set value="${sessionScope.interviewsList.get(0).date}" var="interviewDate" scope="page"/>
            </c:otherwise>
        </c:choose>
        <c:set var="loopsCount" value="0" scope="page"/>

        <div class="whole-wrap">
            <div class="section-top-border">
                <h3 class="mb-30 title_color" style="text-align: center">${interviewDate}</h3>
                <div class="progress-table-wrap">
                    <div class="progress-table">
                        <div class="table-head">
                            <div class="country">${interviewTopic}</div>
                            <div class="country">${vacancyLabel}</div>
                            <div class="visit">${interviewerLabel}</div>
                            <div class="visit">${startLabel}</div>
                            <div class="visit">${endLabel}</div>
                            <div class="visit">${platformLabel}</div>
                            <div class="visit"></div>
                        </div>
                        <c:forEach var="interview" items="${sessionScope.interviewsList}">
                        <c:if test="${interviewDate.compareTo(interview.date) lt 0 and loopsCount gt 0}">
                        <c:set value="${interview.date}" var="interviewDate" scope="page"/>
                    </div>
                </div>
                <h3 class="mb-30 title_color" style="text-align: center">${interviewDate}</h3>
                <div class="progress-table-wrap">
                    <div class="progress-table">
                        <div class="table-head">
                            <div class="country">${interviewTopic}</div>
                            <div class="country">${vacancyLabel}</div>
                            <div class="visit">${interviewerLabel}</div>
                            <div class="visit">${startLabel}</div>
                            <div class="visit">${endLabel}</div>
                            <div class="visit">${platformLabel}</div>
                            <div class="visit"></div>
                        </div>
                        </c:if>
                        <div class="table-row">
                            <div class="country">${interview.topic}</div>
                            <div class="country">${interview.vacancy.topic}</div>
                            <div class="visit">${interview.interviewer.name}</div>
                            <div class="visit">${interview.startTime}</div>
                            <div class="visit">${interview.endTime}</div>
                            <div class="visit">${interview.platform.name}</div>
                            <div class="visit">
                                <!-- <a href="#" style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>-->
                                <!-- <a href="#" style="margin-left: 15px; color: #0b2e13"><em-->
                                <!-- class="fa fa-close fa-2x"></em></a>-->
                                <a href="Controller?command=cancel_booking&interviewId=${interview.id}"
                                   style="margin-bottom: 10px"
                                   class="third-btn">${cancelButton}</a>
                            </div>
                        </div>
                        <c:set var="loopsCount" value="${loopsCount + 1}" scope="page"/>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${not empty sessionScope.interviewsList and userRole eq 2}">
        <c:choose>
            <c:when test="${sessionScope.interviewsList.get(0).date.compareTo(sessionScope.currentDate) eq 0}">
                <c:set value="${sessionScope.currentDate}" var="interviewDate" scope="page"/>
            </c:when>
            <c:otherwise>
                <c:set value="${sessionScope.interviewsList.get(0).date}" var="interviewDate" scope="page"/>
            </c:otherwise>
        </c:choose>
        <c:set var="loopsCount" value="0" scope="page"/>

        <div class="whole-wrap">
            <div class="section-top-border">
                <h3 class="mb-30 title_color" style="text-align: center">${interviewDate}</h3>
                <div class="progress-table-wrap">
                    <div class="progress-table">
                        <div class="table-head">
                            <div class="country">${interviewTopic}</div>
                            <div class="country">${vacancyLabel}</div>
                            <div class="visit">${interviewerLabel}</div>
                            <div class="visit">${startLabel}</div>
                            <div class="visit">${endLabel}</div>
                            <div class="visit">${platformLabel}</div>
                            <div class="visit"></div>
                        </div>
                        <c:forEach var="interview" items="${sessionScope.interviewsList}">
                        <c:if test="${interviewDate.compareTo(interview.date) lt 0 and loopsCount gt 0}">
                        <c:set value="${interview.date}" var="interviewDate" scope="page"/>
                    </div>
                </div>
                <h3 class="mb-30 title_color" style="text-align: center">${interviewDate}</h3>
                <div class="progress-table-wrap">
                    <div class="progress-table">
                        <div class="table-head">
                            <div class="country">${interviewTopic}</div>
                            <div class="country">${vacancyLabel}</div>
                            <div class="visit">${interviewerLabel}</div>
                            <div class="visit">${startLabel}</div>
                            <div class="visit">${endLabel}</div>
                            <div class="visit">${platformLabel}</div>
                            <div class="visit"></div>
                        </div>
                        </c:if>
                        <div class="table-row">
                            <div class="country">${interview.topic}</div>
                            <div class="country">${interview.vacancy.topic}</div>
                            <div class="visit">${interview.interviewer.name}</div>
                            <div class="visit">${interview.startTime}</div>
                            <div class="visit">${interview.endTime}</div>
                            <div class="visit">${interview.platform.name}</div>
                            <div class="visit">
                                <a href="Controller?command=go_to_edit_interview_page&editInterviewId=${interview.id}"
                                   style="color: #0b2e13"><em class="fa fa-edit fa-2x"></em></a>
                                <a href="Controller?command=delete_interview&deleteInterviewId=${interview.id}"
                                   style="color: #0b2e13"><em class="fa fa-close fa-2x"></em></a>
                            </div>
                        </div>
                        <c:set var="loopsCount" value="${loopsCount + 1}" scope="page"/>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <%--<c:when test="${not empty sessionScope.filterInterviewsList}">
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
                                                        class="fa fa-user-secret"></em> ${interviewerLabel}: ${interview.interviewer.name}
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
                                                        class="fa fa-user-secret"></em> ${interviewerLabel}: ${interview.interviewer.name}
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
    </c:when>--%>
</c:choose>

<!-- Job Single Content End -->

<div id="wrapper"></div>

<!-- Footer Area -->
<c:import url="parts/footer.jsp"/>
<!-- Footer Area End -->
</body>
</html>
