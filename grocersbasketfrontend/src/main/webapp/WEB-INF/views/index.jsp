<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/fontawesome-webfont.svg">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/fontawesome-webfont.ttf">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<jsp:include page="_header.jsp" />


 <div class="container-fluid">
 
  <div class="col-lg-3 col-md-3"><img src="${img}/logo.png"></div>
        <div class="col-lg-9 col-md-9">
            <div class="carousel slide" data-ride="carousel" id="carousel-1">
                <div class="carousel-inner" role="listbox">
                    <div class="item active"><img src="${img}/3.png" alt="Slide Image"></div>
                    <div class="item"><img src="${img}/1.jpg" alt="Slide Image"></div>
                    <div class="item"><img src="${img}/2.jpg" alt="Slide Image"></div>
                </div>
                <div><a class="left carousel-control" href="#carousel-1" role="button" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i><span class="sr-only">Previous</span></a><a class="right carousel-control" href="#carousel-1" role="button"
                    data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i><span class="sr-only">Next</span></a></div>
                <ol class="carousel-indicators">
                    <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-1" data-slide-to="1"></li>
                    <li data-target="#carousel-1" data-slide-to="2"></li>
                </ol>
            </div>
        </div>
        <div class="col-lg-3 col-md-3">
            <ul class="list-group category-list">
            <c:forEach var="category" items="${c_list}">
            <a href="${pageContext.request.contextPath}/show/category/${category.cid}/products"> <li class="list-group-item"><span><c:out value="${category.cname}"/></span></li></a>
            </c:forEach>
            </ul>
        </div>
 <c:choose>
 <c:when test="${not empty productList}">
 <div class="text-center">
  <h3><em><strong> ${category.cname} </strong></em></h3>
 </div>

 
  <div class="col-lg-9 col-md-9">
            <div class="row">
           
              <c:forEach items="${productList}" var="product">
        
         <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="well product-card">
                <p class="text-center"> <img class="product-list-img" src="${img}/${product.productName}.png"></p>
                <h2 class="text-center">${product.productName}</h2>
                <h3 class="text-center"> &#8377; ${product.price}</h3>
                <a href="${pageContext.request.contextPath}/show/${product.pid}/product"><input class="btn btn-primary btn-block btn-sm" type="submit" value="View Product"/></a>
            </div>
        </div>
        
        
        </c:forEach>
        </div>
        </div>
        <br>
 
 </c:when>

<c:otherwise>
<br>
<h3 class="text-center"><em><strong> ${category.cname} </strong></em></h3>

 <div class="col-lg-9 col-md-9">
 <div class="jumbotron">
 <div class="text-center">
 <h3>There are no products available for this category!</h3>
            <div class="row">
            </div>
            </div>
 
 
 </div>
 
 </div>
 

</c:otherwise> 
 
 
 
 
 
 
 </c:choose>
 
 
       
       
        
        <div class="col-lg-12 col-md-12">
            <h1 class="text-center brand-heading"><strong><em>Top Brands</em></strong></h1></div>
        <div class="col-lg-4 col-md-4"><img src="${img}/brand1.jpg" class="brand-img"></div>
        <div class="col-lg-4 col-md-4"><img src="${img}/brand3.jpg" class="brand-img"></div>
        <div class="col-lg-4 col-md-4"><img src="${img}/brand2.jpg" class="brand-img"></div>
    </div>
        
        
        
        
        
        
    <jsp:include page="_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>