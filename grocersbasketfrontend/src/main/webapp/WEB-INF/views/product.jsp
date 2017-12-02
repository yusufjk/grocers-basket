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
				<li class="active">Product</li>
        </ol>
  
  
        <div class="modal fade" role="dialog" tabindex="-1" id="insert-product-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
             <form  action="${pageContext.request.contextPath}/admin/product/insertProduct" method="POST" enctype="multipart/form-data" class="form-horizontal">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h2 class="text-center modal-title"><strong><em>Insert Product</em></strong></h2></div>
                <div class="modal-body">
                    
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Product Name </label>
                            </div>
                            <div class="col-sm-8">
                                <input name="productName" class="form-control text-input" type="text"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Description </label>
                            </div>
                            <div class="col-sm-8">
                                <input name="description" class="form-control" type="text"/>
                            </div>
                        </div>
                       
                           
                    
                        
                        
                      <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Category </label>
                            </div> 
                           <div class="col-sm-8">
                           	<select class="form-control" name="cid">
						
						<option value="" >----Category---</option>
					  <c:forEach items="${c_list}" var="category">
					  
						<option value="${category.cid}"><c:out value="${category.cname}"/></option>
						</c:forEach> 
					
					
					</select>
                           </div>
                           
                            </div>
		
			
				
                        
                         <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Supplier </label>
                            </div> 
                           <div class="col-sm-8">
                           	<select  class="form-control" name="sid">
						
						 <option value="">----Supplier----</option>
						<c:forEach items="${s_list}" var="supplier">
						<option value="${supplier.sid}"><c:out value="${supplier.sname}"/></option>
						</c:forEach> 
					    
					</select>
                           </div>
                           
                            </div>
                        
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Price </label>
                            </div>
                            <div class="col-sm-8">
                                <input name="price" class="form-control" type="number"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Stock </label>
                            </div>
                            <div class="col-sm-8">
                                <input name="stock" class="form-control" type="number"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Select Image </label>
                            </div>
                            <div class="col-sm-8">
                                <input  name="image" type="file" accept="image/*"/>
                            </div>
                        </div>
                   
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                    <input class="btn btn-primary" type="submit" value="Insert"/>
                </div>
                </form>
                   </div>
                
        </div>
    </div>
    
   
    
     <div class="well">
        <h1 class="text-center text-primary"><strong><em>Product List</em></strong></h1><a class="btn btn-info active pull-right insert-btn" role="button" href="${pageContext.request.contextPath}/admin/product/insertProduct" data-toggle="modal" data-target="#insert-product-modal">Insert Product</a>
        <div class="table-responsive user-table text-center">
            <table class="table table-striped table-bordered">
                <thead class="text-center">
                    <tr class="text-center">
                        <th class="text-center">ID </th>
                        <th class="text-center">Image </th>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Description </th>
                        <th class="text-center">Price </th>
                        <th class="text-center">Stock </th>
                        <th class="text-center">Category </th>
                        <th class="text-center">Supplier  </th>
                        <th class="text-center">Actions </th>
                    </tr>
                </thead>
                <tbody>
               
                <c:forEach items="${p_list}" var="product">
                    <tr>
                        <td><c:out value="${product.pid}"/></td>
                        
                        <td><img class="product-table-img" src="${pageContext.request.contextPath}/img/${product.productName}.png" /></td>
                        <td><c:out value="${product.productName}"/></td>
                        <td><c:out value="${product.description}"/></td>
                        <td><c:out value="${product.price}"/></td>
                        <td><c:out value="${product.stock}"/></td>
                         <td><c:out value="${product.category.cname}"/></td>
                          <td><c:out value="${product.supplier.sname}"/></td>
           
                        <td>
                            <a data-toggle="modal" href="#edit-product-modal-${product.pid}"> <i class="glyphicon glyphicon-pencil crud-glyphs"></i></a>
                            <a data-toggle="modal" href="#delete-product-modal-${product.pid}"> <i class="glyphicon glyphicon-trash crud-glyphs"></i></a>
                        </td>
                    </tr>
                    
                    
                    <div class="modal fade" role="dialog" tabindex="-1" id="delete-product-modal-${product.pid}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h2 class="text-center modal-title"><strong><em>Delete Product</em></strong></h2></div>
                <div class="modal-body">
                    <h3 class="text-center"><em>Are you sure you want to delete this product?</em></h3></div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                    <a href="${pageContext.request.contextPath}/admin/product/deleteProduct?pid=${product.pid}"><input class="btn btn-primary" type="submit" value="Confirm"/></a>
                </div>
            </div>
        </div>
    </div>
                   
                   
                   
                   
                   
                   
                      <div class="modal fade" role="dialog" tabindex="-1" id="edit-product-modal-${product.pid}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
             <form  action="${pageContext.request.contextPath}/admin/product/editProduct?pid=${product.pid}" method="POST" enctype="multipart/form-data" class="form-horizontal">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h2 class="text-center modal-title"><strong><em>Edit Product</em></strong></h2></div>
                <div class="modal-body">
                    
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Product Name </label>
                            </div>
                            <div class="col-sm-8">
                                <input name="productName" class="form-control text-input" value="${product.productName}" type="text"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Description </label>
                            </div>
                            <div class="col-sm-8">
                                <input name="description" class="form-control" value="${product.description}" type="text"/>
                            </div>
                        </div>
                       
                           
                    
                        
                        
                      <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Category </label>
                            </div> 
                           <div class="col-sm-8">
                           	<select class="form-control" name="cid">
                           	<option value="${product.category.cid}"><c:out value=" ${product.category.cname}"/></option>
					  <c:forEach items="${c_list}" var="category">
					 
						<option value="${category.cid}"><c:out value="${category.cname}"/></option>
						</c:forEach>  
					
					
					</select>
                           </div>
                           
                            </div>
		
			
				
                        
                         <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Supplier </label>
                            </div> 
                           <div class="col-sm-8">
                           	<select  class="form-control" name="sid">
						
						<option value="${product.supplier.sid}"><c:out value=" ${product.supplier.sname}"/></option>
						<c:forEach items="${s_list}" var="supplier">
						<option value="${supplier.sid}"><c:out value="${supplier.sname}"/></option>
						</c:forEach> 
					    
					</select>
                           </div>
                           
                            </div>
                        
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Price </label>
                            </div>
                            <div class="col-sm-8">
                                <input name="price" value="${product.price}" class="form-control" type="number"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Stock </label>
                            </div>
                            <div class="col-sm-8">
                                <input name="stock" value="${product.stock}" class="form-control" type="number"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="name-input-field">Select Image </label>
                            </div>
                            <div class="col-sm-8">
                                <input  name="image" value="${product.image}" type="file" accept="image/*"/>
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
        
   
   
      <jsp:include page="_footer.jsp" />
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>
</body>

</html>