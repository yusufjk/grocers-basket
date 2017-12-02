<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
             <%@ taglib uri="http://www.springframework.org/tags" prefix="t" %>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
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
  <jsp:include page="_header.jsp" />
 <div class="container-fluid">
 
 
 
 
 
        <p class="text-center"> <img src="${img}/logo.png"></p>
        
        
       <c:if test="${not empty logout}">
					<div class="row">

						<div class="col-md-offset-3 col-md-6">

							<div class="alert alert-success">${logout}</div>

						</div>
					</div>

				</c:if>
       
        
        <h2 class="text-center"><strong>User Login</strong></h2>
        <div class="col-lg-8 col-lg-offset-2">
         <c:if test="${not empty message}">
					<div class="row">


							<div class="alert alert-danger">${message}</div>

						
					</div>

				</c:if>
        
            <div class="login-card">
                <form class="form-inline form-signin" action="${pageContext.request.contextPath}/login" method="post">
                    <input name="uemail" class="form-control" type="email" placeholder="Email address"  id="inputEmail"/>
                    <input name="upassword" class="form-control" type="password"  placeholder="Password" id="inputPassword"/>
                  
                
										
										<div class="text-center">
										<input type="submit" value="Login" class="btn btn-primary" />
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
										</div>
											
										
									
                
                </form>
                <br>
                <div class="text-center">
                  <a class="forgot-password">Forgot your password?</a> <br> <br>
                  <a href="${pageContext.request.contextPath}/register" class="forgot-password">New User? Register Here!</a>
                </div>
              
                
                </div>
        </div>
    </div>
      <jsp:include page="_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>
</body>

</html>