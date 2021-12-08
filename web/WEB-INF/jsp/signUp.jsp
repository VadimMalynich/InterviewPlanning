<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Favicon -->
    <link rel="shortcut icon" href="<c:url value="/resources/images/logo/favicon.png"/>" type="image/x-icon">

    <!-- Locale-->
    <fmt:setLocale value="${sessionScope.locale}"/>
    <fmt:setBundle basename="langs.labels" var="loc"/>

    <fmt:message bundle="${loc}" key="signUp.button" var="signUp"/>
    <fmt:message bundle="${loc}" key="signIn.button" var="signIn"/>

    <fmt:message bundle="${loc}" key="label.login" var="login"/>
    <fmt:message bundle="${loc}" key="login.input.title" var="loginTitle"/>
    <fmt:message bundle="${loc}" key="login.input.placeholder" var="loginPlaceholder"/>

    <fmt:message bundle="${loc}" key="label.password" var="password"/>
    <fmt:message bundle="${loc}" key="label.confirmPassword" var="confirmPassword"/>
    <fmt:message bundle="${loc}" key="password.input.title" var="passwordTitle"/>
    <fmt:message bundle="${loc}" key="password.input.placeholder" var="passwordPlaceholder"/>
    <fmt:message bundle="${loc}" key="confirmPassword.input.placeholder" var="confirmPasswordPlaceholder"/>

    <fmt:message bundle="${loc}" key="label.name" var="name"/>
    <fmt:message bundle="${loc}" key="name.input.title" var="nameTitle"/>
    <fmt:message bundle="${loc}" key="name.input.placeholder" var="namePlaceholder"/>

    <fmt:message bundle="${loc}" key="passwordsEquals" var="match"/>
    <fmt:message bundle="${loc}" key="passwordsNotEquals" var="notMatch"/>

    <fmt:message bundle="${loc}" key="page.signUp" var="pageTitle"/>

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
<header>
    <div class="header-top">
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
                            <c:if test="${requestScope.message ne null}">
                                <li>
                                    <c:out value="${messageText}"/>
                                </li>
                            </c:if>
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
                                <a href="Controller?command=go_to_sign_in_page"
                                   class="template-btn">${signIn}</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header Area End -->

<!-- Contact Form Starts -->
<div class="whole-wrap">
    <div class="container">
        <div class="section-top-border">
            <div class="row">
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <br>
                    <div class="d-flex">
                        <div class="info-text">
                            <h4>${login}</h4>
                        </div>
                    </div>
                    <p></p>
                    <div class="d-flex">
                        <div class="info-text">
                            <h4>${password}</h4>
                        </div>
                    </div>
                    <br>
                    <div class="d-flex">
                        <div class="info-text">
                            <h4>${confirmPassword}</h4>
                        </div>
                    </div>
                    <p></p>
                    <div class="d-flex">
                        <div class="info-text">
                            <h4>${name}</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <form action="Controller" method="post">
                        <input type="hidden" name="command" value="sign_up"/>
                        <div class="mt-10">
                            <input type="text"
                                   pattern="${"^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$"}"
                                   title="${loginTitle}"
                                   placeholder="${loginPlaceholder}" name="signUpLogin"
                                   onfocus="this.placeholder = 'example@gmail.com'"
                                   onblur="this.placeholder = '${loginPlaceholder}'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="password"
                                   pattern="${"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])\\w{6,20}$"}"
                                   title="${passwordTitle}"
                                   maxlength="20" placeholder="${passwordPlaceholder}" name="signUpPassword"
                                   id="newPassword"
                                   onfocus="this.placeholder = 'Password1'"
                                   onblur="this.placeholder = '${passwordPlaceholder}'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="password"
                                   pattern="${"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])\\w{6,20}$"}"
                                   title="${passwordTitle}"
                                   maxlength="20" onChange="checkPasswordMatch();"
                                   placeholder="${confirmPasswordPlaceholder}" name="signUpConfirmPassword"
                                   id="confirmPassword"
                                   onfocus="this.placeholder = 'Password1'"
                                   onblur="this.placeholder = '${confirmPasswordPlaceholder}'" required
                                   class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="text"
                                   title="${nameTitle}"
                                   placeholder="${namePlaceholder}" name="signUpName"
                                   onfocus="this.placeholder = 'Vasya'"
                                   onblur="this.placeholder = '${namePlaceholder}'" required class="single-input">
                        </div>
                        <br>
                        <div id="divCheckPasswordsMatch">${match}</div>
                        <div id="divCheckPasswordsNotMatch">${notMatch}</div>
                        <br>
                        <button type="submit" class="template-btn" id="signUpButton">${signUp}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact Form End -->

<div id="wrapper"></div>

<!-- Footer Area -->
<c:import url="parts/footer.jsp"/>
<!-- Footer Area End -->
</body>
</html>
