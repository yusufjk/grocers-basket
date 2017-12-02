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
<body>
  <jsp:include page="_header.jsp" />
  
   
        
     <div class="container-fluid">
     
     
      <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/admin">Admin Dashboard</a></li>
				<li class="active">Users</li>
        </ol>
     
     <div class="well">
        
      
        <h1 class="text-center userlist-heading"><strong><em>User List</em></strong></h1>
        
        <div class="table-responsive user-table text-center">
            <table class="table table-striped table-bordered">
                <thead class="text-center">
                    <tr class="text-center">
           
                        <th class="text-center">First Name </th>
                         <th class="text-center">Last Name </th>
                        <th class="text-center">Email </th>
                        <th class="text-center">Role </th>
                         <th class="text-center">Phone Number </th>
                        <th class="text-center">Password </th>
                        <th class="text-center">Actions </th>
                    </tr>
                </thead>
                <tbody>
				<c:forEach items="${ulist}" var="user">
						<tr>
					
						<td><c:out value="${user.firstName}"/></td>
						<td><c:out value="${user.lastName}"/></td>
						<td><c:out value="${user.uemail}"/></td>
						<td><c:out value="${user.role}"/></td>
						<td><c:out value="${user.phoneNumber}"/></td>
						<td><c:out value="${user.upassword}"/></td>
						 <td>
                            <a href="#edit_user_modal_${user.phoneNumber}" data-toggle="modal"> <i class="glyphicon glyphicon-pencil crud-glyphs"></i></a>
                            <a href="#delete_user_modal_${user.phoneNumber}"  data-toggle="modal"> <i class="glyphicon glyphicon-trash crud-glyphs"></i></a>
                        </td>
						
						</tr>
						
						 <div class="modal fade" role="dialog" tabindex="-1" id="delete_user_modal_${user.phoneNumber}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
             <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h2 class="text-center modal-title"><strong><em>Delete User</em></strong></h2></div>
                <div class="modal-body">
                    <h3 class="text-center"><em>Are you sure you want to delete user?</em></h3></div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                    <a href="${pageContext.request.contextPath}/admin/users/deleteUser?uemail=${user.uemail}"><input class="btn btn-primary" type="submit" value="Confirm"/></a>
                </div>
               
            </div>
        </div>
    </div>
				
				
				
				
				
				 <div class="modal fade" role="dialog" tabindex="-1" id="edit_user_modal_${user.phoneNumber}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
           
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h2 class="text-center modal-title"><strong><em>Edit User</em></strong></h2></div>
               <form  action="${pageContext.request.contextPath}/admin/users/editUser" class="form-horizontal" method="POST">
                <div class="modal-body">
                     
                                   
                                   
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <label class="control-label" for="name-input-field">First Name </label>
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="firstName" id="firstName" class="form-control text-input" value="${user.firstName}" type="text"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <label class="control-label" for="name-input-field">Last Name </label>
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="lastName" id="lastNname" class="form-control text-input" value="${user.lastName}" type="text"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <label class="control-label" for="email-input-field">Email </label>
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="uemail" id="uemail"  class="form-control text-input" value="${user.uemail}" type="text"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <label class="control-label" for="name-input-field">Role </label>
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="role" id="role" class="form-control text-input" value="${user.role}" type="text"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <label class="control-label" for="phone-input-field">Phone Number </label>
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="phoneNumber" id="phoneNumber" class="form-control text-input" value="${user.phoneNumber}" type="text"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <label class="control-label" for="pawssword-input-field">Password </label>
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="upassword" id="upassword" class="form-control text-input" value="${user.upassword}" type="text"/>
                                        </div>
                                    </div>
                                    
                              
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                    <input class="btn btn-primary" type="submit" value="Save"/>
                
                </div>
              
                </form> 
            </div>
        </div>
    </div>
				
				
				
						
						
						</c:forEach> 
                   
                </tbody>
            </table>
        </div>
    </div>
     
     </div>
    
    
  
    
        
   
   
      <jsp:include page="_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>
</body>

</html>