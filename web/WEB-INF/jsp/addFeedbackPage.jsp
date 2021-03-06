<%--
  Created by IntelliJ IDEA.
  User: Vadim
  Date: 08.12.2021
  Time: 19:57
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
    <fmt:message bundle="${loc}" key="feedback.button" var="feedbackButton"/>
    <fmt:message bundle="${loc}" key="add.feedback.button" var="addFeedbackButton"/>

    <fmt:message bundle="${loc}" key="label.review" var="reviewLabel"/>
    <fmt:message bundle="${loc}" key="label.mark" var="markLabel"/>
    <fmt:message bundle="${loc}" key="label.requirements.additional" var="additional"/>
    <fmt:message bundle="${loc}" key="addrequirements.textarea.placeholder" var="placeholder"/>

    <fmt:message bundle="${loc}" key="page.addFeedback" var="pageTitle"/>

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
                            <li class="menu-btn">
                                <a href="Controller?command=go_to_profile_page" class="login">${profile}</a>
                                <a href="Controller?command=logout" class="template-btn">${logout}</a>
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
                                <li class="active"><a href="Controller?command=go_to_home_page">${home}</a></li>
                                <li><a href="Controller?command=go_to_interviewer_feedbacks_page">${feedbackButton}</a>
                                </li>
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
        <div class="page-title text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <h2>${pageTitle}</h2>
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
            <!--            <h3 class="mb-30 title_color">?????????? ?????? ???????????????????? ???????????????????? </h3>-->
            <div class="row">
                <div class="col-lg-3 mb-5 mb-lg-0">
                    <br>
                    <div class="d-flex">
                        <div class="info-text">
                            <h5>${reviewLabel}</h5>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <br><br><br><br><br>
                            <p></p>
                            <h5>${markLabel}</h5>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <br>
                            <h5>${additional}</h5>
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <form action="Controller" method="post">
                        <input type="hidden" name="command" value="add_feedback"/>
                        <div class="mt-10">
                            <textarea name="addReview" class="single-textarea" maxlength="500"
                                      placeholder="${placeholder}" onfocus="this.placeholder = ''"
                                      onblur="this.placeholder = '${placeholder}'" required></textarea>
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-info" aria-hidden="true"></i></div>
                            <input type="number" name="addMark" min="1" max="10" required placeholder="${markLabel}"
                                   class="single-input">
                        </div>
                        <div class="mt-10">
                            <div class="col-lg-9 col-md-1 mt-sm-3 element-wrap">
                                <div class="single-element-widget">
                                    <div class="switch-wrap d-flex justify-content-between">
                                        <p>${notRespond}</p>
                                        <div class="primary-radio">
                                            <input type="radio" id="radio1" name="addRespond" value="false" checked>
                                            <label for="radio1"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9 col-md-1 mt-sm-3 element-wrap">
                                <div class="single-element-widget">
                                    <div class="switch-wrap d-flex justify-content-between">
                                        <p>${respond}</p>
                                        <div class="primary-radio">
                                            <input type="radio" id="radio2" name="addRespond" value="true">
                                            <label for="radio2"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>
                        <button type="submit" class="template-btn">${addFeedbackButton}</button>
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
