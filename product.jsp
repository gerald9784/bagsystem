<%@ page language="java" contentType="text/html" errorPage="error.jsp"  %>
<%@ page import="com.products.dao.ProductDao,com.products.bean.Product,java.util.List,java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="nav.jsp" %>
<%-- <%@ include file="sidebar.jsp"%> --%>
<div class="row">
<div class="col s12 m4"> 
    <div class="card-panel">
        <h4 class="header2">New Product</h4>
        <form action="create" method="post">
            <div class="input-field">
                <input type="text" name="ProductName" id="ProductName">
                <label for="ProductName"> Product Name </label>
            </div>
            <div class="input-field">
                <textarea id="description" class="materialize-textarea" length="120"></textarea>
                <label for="description"> description</label>
            </div>
            <div class="input-field">
                <input type="file" name="image" id="image">
                <label for="image"> Image</label>
            </div>
            <button class="btn waves-effect waves-light" type="submit" name="action">
                Create
                <i class="material-icons right">add</i>
            </button>
        </form>
    </div>
</div>
<div class="col s12 m8"> 
    <div class="card-panel">
        <h4 class="header2">Products</h4>
        <ul class="collection">
            <%
                ProductDao productDao = new ProductDao();
                List<Product> products =productDao.queryProducts(ProductDao.ORDER_BY_NONE);
                for(Product product:products){
                    out.println("<li class='collection-item avatar'>");
                    out.println("<img src='images/yuna.jpg' alt='' class='circle'>");
                    out.println("<span class='title'>"+ product.getName() +"</span>");
                    out.println("<p>"+product.getDescription()+"</p>");
                    out.println("<a href='#!' class='secondary-content'><i class='material-icons orange-text'>edit</i></a>");
                    out.println("</li>");
                }
            %>
            </ul>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
