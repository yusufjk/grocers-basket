<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
 
         <body>
          <jsp:include page="_header.jsp" />
          
  
         
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/show/all/products">Products</a></li>
				<li class="active">${product.productName}</li>
        </ol>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"><img src="${pageContext.request.contextPath}/img/${product.productName}.png" class="single-product-img"></div>
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
            <h1 class="text-center">${product.productName} </h1>
            <hr/>
            <h3 class="text-left text-info"><strong>${product.description}</strong></h3>
            <hr/>
            <h4 class="text-left text-primary"><strong>Price: &#8377; ${product.price} /-</strong></h4>
            <hr>
           
           <c:choose>
				
				<c:when test="${product.stock < 1}">
				
					
					<h4><strong>Quantity Available: <span style="color:red">Out of Stock!</span> </strong></h4>
				</c:when>
				<c:otherwise>				
					
					 <h4><strong>Quantity Available: ${product.stock} </strong></h4>
						
				</c:otherwise>
			
			</c:choose>
           
           <security:authorize access="hasAuthority('user')">
			<c:choose>
				
				<c:when test="${product.stock < 1}">
				
				<a href="javascript:void(0)" class="btn btn-success disabled"><strike>
				<span class="glyphicon glyphicon-shopping-cart"></span> <strong>Add to Cart </strong></strike></a>
					
				</c:when>
				<c:otherwise>				
					
				<a href="${pageContext.request.contextPath}/cart/add/${product.pid}/product" class="btn btn-success hidden">
				<span class="glyphicon glyphicon-shopping-cart"></span> <strong> Add to Cart </strong></a>
						
				</c:otherwise>
			</c:choose>
			</security:authorize>
          <a href="${pageContext.request.contextPath}/cart/add/${product.pid}/product" class="btn btn-success">
				<span class="glyphicon glyphicon-shopping-cart"></span> <strong> Add to Cart </strong></a>
           
            <hr/>
           
        </div>
    </div>
   
      <jsp:include page="_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>
</body>

</html>