<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

 <%@ taglib uri="http://www.springframework.org/tags/form"  prefix="f"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:url value="/js" var="js"></c:url>
<c:url value="/img" var="img"></c:url>
<c:url value="/fonts" var="fonts"></c:url>

<title>Grocer's Basket</title>
     <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/css/Google-Style-Login.css">
    <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/css/Pretty-Footer.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<jsp:include page="_header.jsp" />

     <div class="container">
        <p class="text-center"> <img src="${img}/logo.png"></p>
        <h2 class="text-center"><strong>User Registration</strong></h2>
        <div class="col-lg-8 col-lg-offset-2 login-well-col">
            <div class="login-card">
                <f:form class="form-horizontal"  modelAttribute="user" method="POST" action="${pageContext.request.contextPath}/saveUser">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="name-input-field">Name </label>
                        </div>
                        <div class="col-sm-6">
                            <f:input class="form-control text-input" path="uname"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="email-input-field">Email </label>
                        </div>
                        <div class="col-sm-6">
                             <f:input class="form-control text-input" path="uemail"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="pawssword-input-field">Password </label>
                        </div>
                        <div class="col-sm-6">
                            <f:password class="form-control text-input" path="upassword"/>
                        </div>
                    </div>
                    <p class="text-center">
                        <f:button class="btn btn-success active btn-block submit-button" path="button">Submit Form</f:button>
                    </p>
                </f:form>
            </div>
        </div>
    </div>
    <jsp:include page="_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>