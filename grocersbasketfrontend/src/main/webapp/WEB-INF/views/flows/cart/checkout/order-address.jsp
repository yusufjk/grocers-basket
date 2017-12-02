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
        
 

	<div class="row">
		
			<div class="col-md-4">
				
				<h4>Select Shipping Address</h4>
				<hr/>
				
				<div class="row">
					<c:forEach items="${addresses}" var="address">					
						<div class="cols-xs-12">
							<h3>${address.addressLineOne}</h3>
							<h3>${address.addressLineTwo}</h3>
							<h4>${address.city} - ${address.postalCode}</h4>
							<h4>${address.state} - ${address.country}</h4>
							<hr/>
							<div class="text-center">
								<a href="${flowExecutionUrl}&_eventId_addressSelection&shippingId=${address.id}" class="btn btn-primary">Select</a>
							</div>												
						</div>
					</c:forEach>			
				</div>
	
	
			</div>		
			
        <div class="col-md-8">
			
				
				<div class="panel panel-primary">
				
					<div class="panel-heading">
						<h4>Add Address</h4>
					</div>
					
					<div class="panel-body">
										
						<f:form
							method="POST"
							modelAttribute="shipping"
							class="form-horizontal"
							id="billingForm"
						>
						
							
							<div class="form-group">
								<label class="control-label col-md-4" for="addressLineOne">Address Line One</label>
								<div class="col-md-8">
									<f:input type="text" path="addressLineOne" class="form-control"
										placeholder="Enter Address Line One" />
									<f:errors path="addressLineOne" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="addressLineTwo">Address Line Two</label>
								<div class="col-md-8">
									<f:input type="text" path="addressLineTwo" class="form-control"
										placeholder="Enter Address Line Two" />
									<f:errors path="addressLineTwo" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="city">City</label>
								<div class="col-md-8">
									<f:input type="text" path="city" class="form-control"
										placeholder="Enter City Name" />
									<f:errors path="city" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-4" for="postalCode">Postal Code</label>
								<div class="col-md-8">
									<f:input type="text" path="postalCode" class="form-control"/>
									<f:errors path="postalCode" cssClass="help-block" element="em"/> 
								</div>
							</div>							
						
							<div class="form-group">
								<label class="control-label col-md-4" for="state">State</label>
								<div class="col-md-8">
									<f:input type="text" path="state" class="form-control"
										placeholder="Enter State Name" />
									<f:errors path="state" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="country">Country</label>
								<div class="col-md-8">
									<f:input type="text" path="country" class="form-control"
										placeholder="Enter Country Name" />
									<f:errors path="country" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<button type="submit" name="_eventId_saveAddress" class="btn btn-primary">
										<span class="glyphicon glyphicon-plus"></span> Add Address
									</button>																	 
								</div>
							</div>
						
						
						</f:form>					
					
					
					</div>
				
				
				</div>
			
								
			
			</div>
        
        </div>
        </div>

    
    <jsp:include page="../../../_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>