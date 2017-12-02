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
 
 <c:if test="${not empty message}">
 <div class="alert alert-info">
 <h3 class="text-center"> ${message} </h3>
 </div>
 
 </c:if>
 
 <c:choose>
 
 <c:when test="${not empty cartLines}">
 
 
 <table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
							<th style="width:22%" class="text-center">Subtotal</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${cartLines}" var="cartLine">
					
					<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="${pageContext.request.contextPath}/img/${cartLine.product.productName}.png"  class="img-responsive product-table-img"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin">${cartLine.product.productName}</h4>
										<p>Brand - ${cartLine.product.supplier.sname}</p>
										<p>Description - ${cartLine.product.description}</p>
										
									</div>
								</div>
							</td>
							<td data-th="Price"> &#8377; ${cartLine.buyingPrice} </td>
							<td data-th="Quantity">
								<input type="number" id="count_${cartLine.id}" min="1" max="10" class="form-control text-center" value="${cartLine.productCount}">
							</td>
							<td data-th="Subtotal" class="text-center">&#8377; ${cartLine.total} </td>
							<td class="actions" data-th="">
								<button type="button" name="refreshCart" value="${cartLine.id}" class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
								<a href="${pageContext.request.contextPath}/cart/${cartLine.id}/remove" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></a>								
							</td>
						</tr>
					</c:forEach>
						
					</tbody>
					
					
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Grand Total &#8377; ${userModel.cart.grandTotal} </strong></td>
						</tr>
						<tr>
							<td><a href="${pageContext.request.contextPath}/show/all/products" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Grand Total  &#8377; ${userModel.cart.grandTotal}</strong></td>
							<td><a href="${pageContext.request.contextPath}/cart/validate" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
 
 
 
 </c:when>
 <c:otherwise>
 <div class="jumbotron">
 <div class="text-center">
 <h2>Your Cart is empty!</h2>
 <div class="text-left">
  <a href="${pageContext.request.contextPath}/show/all/products" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a>
 </div>

 
 </div>
 
 </div>
 
 </c:otherwise>
 
 </c:choose>
 
 
 
 
 	
 
 
 
      </div>
    <jsp:include page="_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
     <script src="${js}/bootbox.min.js"></script>
      <script src="${js}/myapp.js"></script>
   
  
    <script>
	
		window.contextPath = '${pageContext.request.contextPath}';	
	
	</script>
    
    <script src="${js}/bootstrap.min.js"></script>
</body>

</html>