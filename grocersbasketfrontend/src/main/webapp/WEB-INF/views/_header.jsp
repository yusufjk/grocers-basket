<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
    <%@ page isELIgnored="false" %> 
    <nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
        <a href="${pageContext.request.contextPath}/index" class="navbar-brand navbar-link"><strong>Grocer's Basket</strong></a>
            <button data-toggle="collapse" data-target="#navcol-1" class="navbar-toggle collapsed"></button>
        </div>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="nav navbar-nav navbar-right">
               <security:authorize access="isAnonymous()">
                <li id="register"><a href="${pageContext.request.contextPath}/login"><strong>Login</strong></a></li>
                <li id="login"><a href="${pageContext.request.contextPath}/register"><strong>Sign Up</strong></a></li>
                </security:authorize>
                
                <security:authorize access="isAuthenticated()">
                <li class="dropdown"><a data-toggle="dropdown" href="javascript:void(0)" class="dropdown-toggle"><strong><em> ${userModel.fullName} <span class="caret"></span></em></strong></a>
                    <ul class="dropdown-menu dropdown-menu-right">
                    
                    
                    <security:authorize access="hasAuthority('user')">
                        <li><a href="${pageContext.request.contextPath}/cart/show">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
	                    				<span class="badge">${userModel.cart.cartLines}</span>
	                    				- &#8377; ${userModel.cart.grandTotal}</a>
                        </li>
                        <hr>
                        </security:authorize>
                        
                        <security:authorize access="hasAuthority('admin')">
                      <li><a href="${pageContext.request.contextPath}/admin"><strong>Admin Panel</strong></a></li>
                        </security:authorize>
                        
                        <hr>
                        <li><a href="${pageContext.request.contextPath}/perform-logout">Logout</a></li>
                    </ul>
                </li>
                </security:authorize>
            </ul>
        </div>
    </div>
</nav>