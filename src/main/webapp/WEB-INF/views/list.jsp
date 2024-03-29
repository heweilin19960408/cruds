<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <!-- 获取当前项目路径，以/开始，不以/结尾 -->
<%
  pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
 <title>员工列表</title> 
 <!-- 
 不以/开始的相对路径，找资源以当前资源的路径为基准，容易出问题
 以/开始的相对路径，找资源以服务器的路径为基准(http://localhost:8080),需要加上项目名称
  -->  
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.0.0.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <div class="container">
       <!-- 显示标题行 -->
       <div class="row">
         <div class="col-md-12">
            <h1>SSM-CRUD</h1>
         </div>
       </div>
       <!-- 按钮 -->
       <div class="row">
       <div class="col-md-4 col-md-offset-8">
         <button class="btn btn-primary">新增</button>
         <button class="btn btn-danger">删除</button>
       </div>
       </div>
       <!-- 表格 -->
       <div class="row">
          <div class="col-md-12">
             <table class="table table-hover">
                <tr>
                  <th>#</th>
                  <th>empName</th>
                  <th>gender</th>
                  <th>email</th>
                  <th>deptName</th>
                  <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
	                <tr>
	                  <th>${emp.empId }</th>
	                  <th>${emp.empName }</th>
	                  <th>${emp.gender }</th>
	                  <th>${emp.email }</th>
	                  <th>${emp.department.deptName }</th>
	                  <th>
	                    <button class="btn btn-primary btn-sm">
	                      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
	                                            新增
	                    </button>
	                    <button class="btn btn-danger btn-sm">
	                       <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
	                                           删除
	                    </button>
	                  </th>
	                </tr>
                </c:forEach>
                
             </table>
          </div>
       </div>
       <!-- 分页信息 -->
       <div class="row">
          <div class="col-md-6">
                       当前${pageInfo.pageNum }页，共${pageInfo.pages }页，共${pageInfo.total }条记录
          </div>
          <div class="col-md-6">
			 <nav aria-label="Page navigation">
			  <ul class="pagination">
			    <li><a href="${APP_PATH}/emps/emps?pn=1">首页</a></li>
			    <c:if test="${pageInfo.hasPreviousPage }">
			    <li>
			      <a href="${APP_PATH}/emps/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    </c:if>
			    <c:forEach items="${pageInfo.navigatepageNums }" var="page">
			       <c:if test="${page == pageInfo.pageNum}">
			          <li class="active"><a href="#">${page }</a></li>
			       </c:if>
			       <c:if test="${page != pageInfo.pageNum}">
			          <li><a href="${APP_PATH}/emps/emps?pn=${page }">${page }</a></li>
			       </c:if>
			    </c:forEach>
			    <c:if test="${pageInfo.hasNextPage }">
			    <li>
			      <a href="${APP_PATH}/emps/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    </c:if>
			    <li><a href="${APP_PATH}/emps/emps?pn=${pageInfo.pages }">末页</a></li>
			  </ul>
			</nav>
          </div>
       </div>
    </div>
  </body>
</html>
