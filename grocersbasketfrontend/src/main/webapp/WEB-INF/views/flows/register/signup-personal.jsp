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

 <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header"><a class="navbar-brand navbar-link" href="${flowExecutionUrl}&_eventId_home"><strong>Grocer's Basket</strong></a>
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"></button>
            </div>
            <div class="collapse navbar-collapse" id="navcol-1"></div>
        </div>
    </nav>
    <div class="container">
        <p class="text-center"> <img src="${img}/logo.png"></p>
        <h2 class="text-center"><strong>User Registration<em> (Personal)</em></strong></h2>
        <div class="col-lg-8 col-lg-offset-2 login-well-col">
            <div class="login-card">
               
                <f:form 
                class="form-horizontal"
                method="POST"
                id="registerForm"
                modelAttribute="user">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="f_name-input-field">First Name </label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="firstName" class="form-control text-input" type="text"/>
                        <f:errors path="firstName" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="l_name-input-field">Last Name</label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="lastName" class="form-control text-input" type="text"/>
                       <f:errors path="lastName" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="email-input-field">Email </label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="uemail" class="form-control text-input" type="text" inputmode="email"/>
                        <f:errors path="uemail" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                    
                    
                     <div class="form-group hidden">
                        <div class="col-sm-4">
                            <label class="control-label" for="email-input-field">Email </label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="role" class="form-control text-input" type="text" value="user"/>
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="number-input-field">Contact Number</label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="phoneNumber" class="form-control text-input" maxlength="10" type="text" inputmode="tel"/>
                        <f:errors path="phoneNumber" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="password-input-field">Password </label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="upassword" class="form-control text-input" type="password"/>
                        <f:errors path="upassword" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                    
                  
                       
                        <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label confirm-pass-label" for="confirmpassword-input-field">Confirm Password</label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="confirmPassword" class="form-control text-input" type="password"/>
                        <f:errors path="confirmPassword" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                    
                    <p class="text-right">
                        <button name="_eventId_billing" class="btn btn-info active" type="submit">Billing <i class="glyphicon glyphicon-arrow-right"></i></button>
                    </p>
                </f:form>
            </div>
        </div>
    </div>

    
    <jsp:include page="../../_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>