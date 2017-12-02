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
       <div class="container">

	<div class="row">
			<!--  To display all the goods -->
			<div class="col-md-6">
				
				<div class="row">
					<c:forEach items="${checkoutModel.cartLines}" var="cartLine">
					<div class="col-xs-12">
						
						<div>
							<h3>${cartLine.product.productName}</h3>
							<hr/>
							<h4>Quantity -${cartLine.productCount}</h4>
							<h5>Buying Price - &#8377; ${cartLine.buyingPrice}/-</h5>							
						</div>						
						<hr/>
						<div class="text-right">
							<h3>Grand Total - &#8377; ${cartLine.total}/-</h3>
						</div>						
					</div>
					</c:forEach>
				</div>
				
				
			</div>
			
			<div class="col-md-6">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                    <h3 class="panel-title">
	                        Payment Details
	                    </h3>
	                </div>
	                <div class="panel-body">
	                    <form role="form">
	                    <div class="form-group">
	                        <label for="cardNumber">
	                            CARD NUMBER</label>
	                        <div class="input-group">
	                            <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
	                                required autofocus />
	                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-xs-7 col-md-7">
	                            <div class="form-group">
	                                <label for="expityMonth">EXPIRY DATE</label>
	                                <br/>
	                                <div class="col-xs-6 col-lg-6 pl-ziro">
	                                    <input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
	                                </div>
	                                <div class="col-xs-6 col-lg-6 pl-ziro">
	                                    <input type="text" class="form-control" id="expityYear" placeholder="YY" required /></div>
	                            </div>
	                        </div>
	                        <div class="col-xs-5 col-md-5 pull-right">
	                            <div class="form-group">
	                                <label for="cvCode">
	                                    CV CODE</label>
	                                <input type="password" class="form-control" id="cvCode" placeholder="CV" required />
	                            </div>
	                        </div>
	                    </div>
	                    </form>
	                </div>
	            </div>
	            <ul class="nav nav-pills nav-stacked">
	                <li class="active"><a href="#"><span class="badge pull-right"> &#8377; ${checkoutModel.checkoutTotal}/-</span> Final Payment</a></li>
	            </ul>
	            <br/>
	            <a href="${flowExecutionUrl}&_eventId_pay" class="btn btn-success btn-lg btn-block" role="button">Pay</a>
			
			</div>

	</div>
</div>
</div>

    
    <jsp:include page="../../../_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>