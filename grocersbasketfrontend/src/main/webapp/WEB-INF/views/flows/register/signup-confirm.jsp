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
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading text-center">
                    <h3 class="panel-title"><strong>Personal Details</strong></h3></div>
                <div class="panel-body">
                    <h3><strong><em>${registerModel.user.firstName}
							${registerModel.user.lastName}</em></strong></h3>
                    <hr>
                    <h4><strong>Email: </strong><em> ${registerModel.user.uemail} </em> </h4>
                    <h4><strong>Contact no:</strong> <em> ${registerModel.user.phoneNumber} </em></h4>
                    <div class="text-right">
                       <a href="${flowExecutionUrl}&_eventId_personal"> <button class="btn btn-info" type="button"><strong>Edit </strong></button></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading text-center">
                    <h3 class="panel-title"><strong>Billing Address</strong></h3></div>
                <div class="panel-body">
                    <h4><strong>Address Line 1:</strong> <em>${registerModel.billing.addressLineOne}</em></h4>
                    <h4><strong>Address Line 2:</strong><em>${registerModel.billing.addressLineTwo}</em> </h4>
                    <h4><strong>City: </strong><em>${registerModel.billing.city}</em></h4>
                    <h4><strong>Postal Code: </strong><em>${registerModel.billing.postalCode}</em></h4>
                    <h4><strong>State: </strong><em>${registerModel.billing.state}</em></h4>
                    <h4><strong>Country: </strong><em>${registerModel.billing.country}</em></h4>
                    <div class="text-right">
                       <a href="${flowExecutionUrl}&_eventId_billing"> <button class="btn btn-info" type="button"><strong>Edit </strong></button></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center">
            <a href="${flowExecutionUrl}&_eventId_submit"><button class="btn btn-success active btn-lg submit-button" type="button"><strong>Confirm </strong></button></a>
        </div>
    </div>
   
   
    
    <jsp:include page="../../_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>