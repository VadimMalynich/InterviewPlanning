<%--
  Created by IntelliJ IDEA.
  User: Vadim
  Date: 04.12.2021
  Time: 19:16
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
    <fmt:message bundle="${loc}" key="label.platforms" var="platformsButton"/>
    <fmt:message bundle="${loc}" key="home.button" var="home"/>
    <fmt:message bundle="${loc}" key="add.vacancy.button" var="addVacancyButton"/>
    <fmt:message bundle="${loc}" key="feedback.button" var="feedbackButton"/>

    <fmt:message bundle="${loc}" key="label.experience" var="experienceLabel"/>
    <fmt:message bundle="${loc}" key="label.vacancy.topic" var="topicLabel"/>
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
                                <li><a href="Controller?command=go_to_platforms_page">${platformsButton}</a></li>
                                <li><a href="Controller?command=go_to_add_vacancy_page">${addVacancyButton}</a></li>
                                <li><a href="Controller?command=go_to_feedbacks_page">${feedbackButton}</a></li>
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
            <!--            <h3 class="mb-30 title_color">Форма для заполнения информации </h3>-->
            <div class="row">
                <div class="col-lg-3 mb-5 mb-lg-0">
                    <br>
                    <div class="d-flex">
                        <div class="info-text">
                            <h5>${topicLabel}</h5>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>${experienceLabel}</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>${employments}</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>${scheduleLabel}</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p>
                            <h5>${descriptionLabel}</h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <p></p><br><br><br><br><br>
                            <h5>${requirementsLabel}</h5>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-text">
                            <br><br><br><br><br>
                            <h5>${additional}</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <form action="Controller" method="post">
                        <input type="hidden" name="command" value="add_vacancy"/>
                        <div class="mt-10">
                            <input type="text" name="addTopic" maxlength="50" placeholder="${topicPlaceholder}"
                                   onfocus="this.placeholder = '${topicPlaceholderFocus}'"
                                   onblur="this.placeholder = '${topicPlaceholder}'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input pattern="^\d{1,2}([-]\d{1,2})?$" class="single-input"
                                   type="text" name="addExperience" placeholder="${experiencePlaceholder}"
                                   onfocus="this.placeholder = '1-3'"
                                   onblur="this.placeholder = '${experiencePlaceholder}'">
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-gg" aria-hidden="true"></i></div>
                            <div class="form-select" id="default-select1">
                                <select name="addEmployment">
                                    <c:forEach var="employment" items="${sessionScope.employmentList}">
                                        <option value="${employment.id}">${employment.type}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-gg" aria-hidden="true"></i></div>
                            <div class="form-select" id="default-select2">
                                <select name="addSchedule">
                                    <c:forEach var="schedule" items="${sessionScope.scheduleList}">
                                        <option value="${schedule.id}">${schedule.timetable}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="mt-10">
                            <textarea name="addDescription" class="single-textarea" maxlength="300"
                                      placeholder="${descriptionPlaceholder}" onfocus="this.placeholder = ''"
                                      onblur="this.placeholder = '${descriptionPlaceholder}'" required></textarea>
                        </div>
                        <div class="mt-10">
                            <textarea name="addRequirements" class="single-textarea" maxlength="500"
                                      placeholder="${requirementsPlaceholder}" onfocus="this.placeholder = ''"
                                      onblur="this.placeholder = '${requirementsPlaceholder}'" required></textarea>
                        </div>
                        <div class="mt-10">
                            <textarea name="addAdditional" class="single-textarea" maxlength="500"
                                      placeholder="${addRequirementsPlaceholder}" onfocus="this.placeholder = ''"
                                      onblur="this.placeholder = '${addRequirementsPlaceholder}'"></textarea>
                        </div>
                        <br>
                        <br>
                        <button type="submit" class="template-btn">${addVacancyButton}</button>
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
