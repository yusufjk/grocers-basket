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
          <div class="text-center">  
    <h1>Welcome!</h1>
    <h3>onlineshopping.com</h3>
    <h6>You can use your email address as username to login!</h6>
    <div>
     <a href="${pageContext.request.contextPath}/login" class="btn btn-lg btn-success">Login Here</a>
    </div>
   </div>
    </div>

    
    <jsp:include page="../../_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>