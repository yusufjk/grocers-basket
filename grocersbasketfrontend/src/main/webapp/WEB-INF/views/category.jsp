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
          
             <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/admin">Admin Dashboard</a></li>
				<li class="active">Category</li>
        </ol>
  
         
    <div class="modal fade" role="dialog" tabindex="-1" id="insert-category-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h2 class="text-center modal-title"><strong><em>Insert Category</em></strong></h2></div>
                <div class="modal-body">
                     <form  action="${pageContext.request.contextPath}/admin/category/insertCategory" method="POST" class="form-horizontal">
				
								
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <label class="control-label" for="name-input-field">Category Name</label>
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="cname" class="form-control text-input" type="text"/>
                                        </div>
                                    </div>
                                    
                                </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                    <input name="action" class="btn btn-primary" type="submit" value="Insert"/>
                </div>
            </div>
        </div>
    </div>
   
    

    <div class="well">
     
        
         <h1 class="text-center text-primary"><strong><em>Category List </em></strong></h1>
         <a class="btn btn-info active pull-right insert-btn" role="button" href="${pageContext.request.contextPath}/admin/category/insertCategory" data-toggle="modal" data-target="#insert-category-modal">Insert Category</a>

       
        <div class="table-responsive user-table text-center">
            <table class="table table-striped table-bordered">
                <thead class="text-center">
                    <tr class="text-center">
                        <th class="text-center">ID </th>
                        <th class="text-center">Category </th>
                        <th class="text-center">Actions </th>
                    </tr>
                </thead>
                <tbody>
				
				 <c:forEach items="${c_list}" var="c_list">
						<tr>
					
						<td><c:out value="${c_list.cid}"/></td>
						<td><c:out value="${c_list.cname}"/></td>
						 <td>
                            <a data-toggle="modal" href="#edit-category-modal-${c_list.cid}"> <i class="glyphicon glyphicon-pencil crud-glyphs"></i></a>
                            <a data-toggle="modal" href="#delete-category-modal-${c_list.cid}"> <i class="glyphicon glyphicon-trash crud-glyphs"></i></a>
                        </td>
						
						</tr>
						
						
						<div class="modal fade" role="dialog" tabindex="-1" id="delete-category-modal-${c_list.cid}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h2 class="text-center modal-title"><strong><em>Delete Category</em></strong></h2></div>
                <div class="modal-body">
                    <h3 class="text-center"><em>Are you sure you want to delete this category?</em></h3></div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                    <a href="${pageContext.request.contextPath}/admin/category/deleteCategory?cid=${c_list.cid}"> <input class="btn btn-primary" type="submit" value="Confirm"/></a>
                    
                </div>
            </div>
        </div>
    </div>
    
    
    
    
     <div class="modal fade" role="dialog" tabindex="-1" id="edit-category-modal-${c_list.cid}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form  action="${pageContext.request.contextPath}/admin/category/editCategory?cid=${c_list.cid}" class="form-horizontal" method="POST">
                <div class="modal-header">
                 
                
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h2 class="text-center modal-title"><strong><em>Edit Category</em></strong></h2></div>
                <div class="modal-body">
                
                    
                       
                       
                       
                                    <div class="form-group hidden">
                                        <div class="col-sm-4">
                                            <label class="control-label" for="name-input-field">Category ID</label>
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="cid" class="form-control text-input" value="${c_list.cid}" type="text"/>
                                        </div>
                                    </div>
                                    
				
								
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <label class="control-label" for="name-input-field">Category Name</label>
                                        </div>
                                        <div class="col-sm-6">
                                            <input name="cname" class="form-control text-input" value="${c_list.cname}" type="text"/>
                                        </div>
                                    </div>
                                    
                               
                      
                  
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                 <input  class="btn btn-primary" type="submit" value="Save"/> 
                     
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
   
      <jsp:include page="_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>
</body>

</html>