<%--
  Created by IntelliJ IDEA.
  User: Vadim
  Date: 07.12.2021
  Time: 0:01
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
    <fmt:message bundle="${loc}" key="users.button" var="usersButton"/>
    <fmt:message bundle="${loc}" key="add.vacancy.button" var="addVacancyButton"/>
    <fmt:message bundle="${loc}" key="feedback.button" var="feedbackButton"/>

    <fmt:message bundle="${loc}" key="label.platforms" var="platformsLabel"/>
    <fmt:message bundle="${loc}" key="label.platform" var="platformLabel"/>
    <fmt:message bundle="${loc}" key="label.interviewCount" var="countLabel"/>

    <fmt:message bundle="${loc}" key="message.emptyPlatforms" var="emptyPlatforms"/>
    <c:if test="${requestScope.message ne null}">
        <fmt:message bundle="${loc}" key="${requestScope.message}" var="messageText"/>
    </c:if>


    <title>${platformsLabel}</title>
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
                            <img src="<c:url value="/resources/images/logo-light.png"/>" alt="logo"></a>
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
                                <c:choose>
                                    <c:when test="${sessionScope.user.role.value eq 0}">
                                        <li><a href="Controller?command=go_to_users_page">${usersButton}</a></li>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role.value eq 1}">
                                        <li><a href="Controller?command=go_to_add_vacancy_page">${addVacancyButton}</a></li>
                                        <li><a href="Controller?command=go_to_feedbacks_page">${feedbackButton}</a></li>
                                    </c:when>
                                </c:choose>
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
                        <c:if test="${not empty sessionScope.platformsList}">
                            <h2>${platformsLabel}</h2>
                        </c:if>
                        <c:if test="${empty sessionScope.platformsList}">
                            <p>${emptyPlatforms}</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header Area End -->


<!-- Start Align Area -->
<c:choose>
    <c:when test="${not empty sessionScope.platformsList}">
        <div class="whole-wrap">
            <div class="container">
                <div class="section-top-border">
                    <div class="progress-table-wrap">
                        <div class="progress-table">
                            <div class="table-head">
                                <div class="serial">ID</div>
                                <div class="country">${platformLabel}</div>
                                <div class="country">${countLabel}</div>
                                <div class="percentage"></div>
                            </div>
                            <c:forEach var="platform" items="${sessionScope.platformsList}">
                                <div class="table-row">
                                    <form action="Controller" method="post"
                                          style="width: 100%; display: inherit">
                                        <input type="hidden" name="command" value="edit_platform">
                                        <input type="hidden" name="platformId" value="${platform.id}">
                                        <div class="serial">${platform.id}</div>
                                        <div class="country">
                                            <input type="text" value="${platform.name}"
                                                   placeholder="${platform.name}"
                                                   onfocus="this.placeholder = '${platform.name}'"
                                                   name="editPlatform"
                                                   onblur="this.placeholder = '${platform.name}'"
                                                   class="single-input"
                                                   style="margin-right: 15px" required>
                                        </div>
                                        <div class="country">${platform.count}</div>
                                        <div class="serial">
                                            <button type="submit"><em class="fa fa-save fa-2x"></em></button>
                                        </div>
                                    </form>
                                    <form action="Controller" method="post" style="display: inherit">
                                        <input type="hidden" name="command" value="delete_platform">
                                        <input type="hidden" name="deletePlatformId" value="${platform.id}">
                                        <div class="serial">
                                            <button type="submit">
                                                <em class="fa fa-close fa-2x"></em>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </c:forEach>
                            <div class="table-row">
                                <form action="Controller" method="post" style="display: inherit; width: 100%">
                                    <input type="hidden" name="command" value="add_platform">
                                    <div class="serial"></div>
                                    <div class="country">
                                        <input type="text" placeholder="Zoom"
                                               onfocus="this.placeholder = 'Zoom'"
                                               onblur="this.placeholder = 'Zoom'" class="single-input"
                                               name="addPlatform" style="margin-right: 15px" required>
                                    </div>
                                    <div class="country"></div>
                                    <div class="percentage">
                                        <button type="submit"><em class="fa fa-plus fa-2x"></em></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${empty sessionScope.platformsList}">
        <div class="whole-wrap">
            <div class="container">
                <div class="section-top-border">
                    <div class="progress-table-wrap">
                        <div class="progress-table">
                            <div class="table-head">
                                <div class="serial">ID</div>
                                <div class="country">${platformLabel}</div>
                                <div class="country">${countLabel}</div>
                                <div class="country"></div>
                            </div>
                            <div class="table-row">
                                <form action="Controller" method="post" style="display: inherit; width: 100%">
                                    <input type="hidden" name="command" value="add_platform">
                                    <div class="serial"></div>
                                    <div class="country">
                                        <input type="text" placeholder="Zoom"
                                               onfocus="this.placeholder = 'Zoom'"
                                               onblur="this.placeholder = 'Zoom'" class="single-input"
                                               name="addPlatform" style="margin-right: 15px" required>
                                    </div>
                                    <div class="country"></div>
                                    <div class="country">
                                        <button type="submit"><em class="fa fa-plus fa-2x"></em></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
</c:choose>
<!-- End Align Area -->

<div id="wrapper"></div>

<!-- Footer Area -->
<c:import url="parts/footer.jsp"/>

</body>
</html>
