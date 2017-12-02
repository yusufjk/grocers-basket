<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
       
       
			<div class="alert alert-success">
				<h3 class="text-center">Your Order is Confirmed!!</h3>
			</div>
		    <div class="row">
		        <div class="col-xs-12">
		    		<div class="invoice-title">
		    			<h2>Invoice</h2><h3 class="pull-right">Order # ${orderDetail.id}</h3>
		    		</div>
		    		<hr>
		    		<div class="row">
		    			<div class="col-xs-6">
		    				<address>
		    				<strong>Billed To:</strong><br>
		    					${orderDetail.user.firstName} ${orderDetail.user.lastName}<br>
		    					${orderDetail.billing.addressLineOne}<br>
		    					${orderDetail.billing.addressLineTwo}<br>
		    					${orderDetail.billing.city} - ${orderDetail.billing.postalCode}<br>
		    					${orderDetail.billing.state} - ${orderDetail.billing.country}
		    				</address>
		    			</div>
		    			<div class="col-xs-6 text-right">
		    				<address>
		        			<strong>Shipped To:</strong><br>
		    					${orderDetail.user.firstName} ${orderDetail.user.lastName}<br>
		    					${orderDetail.shipping.addressLineOne}<br>
		    					${orderDetail.shipping.addressLineTwo}<br>
		    					${orderDetail.shipping.city} - ${orderDetail.shipping.postalCode}<br>
		    					${orderDetail.shipping.state} - ${orderDetail.shipping.country}
		    				</address>
		    			</div>
		    		</div>
		    		<div class="row">
		    			<div class="col-xs-6">
		    				<address>
		    					<strong>Payment Method:</strong><br>
		    					Card Payment <br>
		    					${orderDetail.user.uemail}
		    				</address>
		    			</div>
		    			<div class="col-xs-6 text-right">
		    				<address>
		    					<strong>Order Date:</strong><br>
		    					${orderDetail.orderDate}<br><br>
		    				</address>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    
		    <div class="row">
		    	<div class="col-md-12">
		    		<div class="panel panel-default">
		    			<div class="panel-heading">
		    				<h3 class="panel-title"><strong>Order summary</strong></h3>
		    			</div>
		    			<div class="panel-body">
		    				<div class="table-responsive">
		    					<table class="table table-condensed">
		    						<thead>
		                                <tr>
		        							<td><strong>Item</strong></td>
		        							<td class="text-center"><strong>Price</strong></td>
		        							<td class="text-center"><strong>Quantity</strong></td>
		        							<td class="text-right"><strong>Totals</strong></td>
		                                </tr>
		    						</thead>
		    						<tbody>
		    							
		    							<c:forEach items="${orderDetail.orderItems}" var="orderItem">
			    							<tr>
			    								<td>${orderItem.product.productName}</td>
			    								<td class="text-center">&#8377; ${orderItem.buyingPrice}</td>
			    								<td class="text-center">${orderItem.productCount}</td>
			    								<td class="text-right">&#8377; ${orderItem.total}</td>
			    							</tr>
		    							</c:forEach>
		    						</tbody>
		    					</table>
		    				</div>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    <div class="text-center">
		    	<a href="${pageContext.request.contextPath}/show/all/products" class="btn btn-lg btn-warning">Continue Shopping</a>
		    </div>
		</div>

    
    <jsp:include page="../../../_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>