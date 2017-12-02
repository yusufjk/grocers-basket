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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/fontawesome-webfont.svg">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/fontawesome-webfont.ttf">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
  <jsp:include page="_header.jsp" />
  
   <div class="container admin-container">
        <h1 class="text-center"><strong>Admin Dashboard</strong></h1>
        <div class="col-lg-3 col-md-12 text-center">
        <a href="admin/users"> <img src="${img}/user.png" alt="User" class="admin-icons" /></a>
            <h2 class="text-center">User </h2></div>
            
        <div class="col-lg-3 col-md-12 text-center">
        <a href="admin/supplier"> <img src="${img}/supplier.png" alt="Supplier" class="admin-icons" /></a>
            <h2 class="text-center">Supplier </h2></div>
        <div class="col-lg-3 col-md-4 text-center"><a href="admin/product"> <img src="${img}/product.png" alt="Product" class="admin-icons" /></a>
            <h2 class="text-center">Product </h2></div>
        <div class="col-lg-3 col-md-12 text-center"><a href="admin/category"> <img src="${img}/category.png" alt="Category" class="admin-icons" /></a>
            <h2 class="text-center">Category </h2></div>
    </div>
  
      <jsp:include page="_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>
</body>

</html>