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
        <h2 class="text-center"><strong>User Registration<em> (Billing)</em></strong></h2>
        <div class="col-lg-8 col-lg-offset-2 login-well-col">
            <div class="login-card">
               
                <f:form 
                class="form-horizontal"
                method="POST"
                id="billingForm"
                modelAttribute="billing">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="al1-input-field">Address Line 1: </label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="addressLineOne" class="form-control text-input" type="text"/>
                        <f:errors path="addressLineOne" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="al2-input-field">Address Line 2:</label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="addressLineTwo" class="form-control text-input" type="text"/>
                        <f:errors path="addressLineTwo" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                   
                   
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="city-input-field">City:</label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="city" class="form-control text-input" type="text"/>
                        <f:errors path="city" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                   
                   <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="postalCode-input-field">Postal Code:</label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="postalCode" class="form-control text-input" type="text" inputmode="tel"/>
                        <f:errors path="postalCode" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                   
                   
                   <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="state-input-field">State:</label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="state" class="form-control text-input" type="text"/>
                        <f:errors path="state" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="country-input-field">Country:</label>
                        </div>
                        <div class="col-sm-6">
                            <f:input path="country" class="form-control text-input" type="text"/>
                        <f:errors path="country" cssClass="help-block" element="em"/> 
                        </div>
                    </div>
                   
                   
                    
                    <div class="billing-buttons">
                     <div class="text-left">
                        <button name="_eventId_personal" class="btn btn-info active" type="submit"><i class="glyphicon glyphicon-arrow-left"></i> Previous </button>
                    </div>
                    
                    <div class="text-right">
                        <button name="_eventId_confirm" class="btn btn-info active" type="submit">Next  <i class="glyphicon glyphicon-arrow-right"></i></button>
                    </div>
                    
                    </div>
                    
                    
                </f:form>
            </div>
        </div>
    </div>

    
    <jsp:include page="../../_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>