<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <!-- ��ȡ��ǰ��Ŀ·������/��ʼ������/��β -->
<%
  pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
 <title>Ա���б�</title> 
 <!-- 
 ����/��ʼ�����·��������Դ�Ե�ǰ��Դ��·��Ϊ��׼�����׳�����
 ��/��ʼ�����·��������Դ�Է�������·��Ϊ��׼(http://localhost:8080),��Ҫ������Ŀ����
  -->  
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.0.0.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <div class="container">
       <!-- ��ʾ������ -->
       <div class="row">
         <div class="col-md-12">
            <h1>SSM-CRUD</h1>
         </div>
       </div>
       <!-- ��ť -->
       <div class="row">
       <div class="col-md-4 col-md-offset-8">
         <button class="btn btn-primary">����</button>
         <button class="btn btn-danger">ɾ��</button>
       </div>
       </div>
       <!-- ��� -->
       <div class="row">
          <div class="col-md-12">
             <table class="table table-hover">
                <tr>
                  <th>#</th>
                  <th>empName</th>
                  <th>gender</th>
                  <th>email</th>
                  <th>deptName</th>
                  <th>����</th>
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
	                                            ����
	                    </button>
	                    <button class="btn btn-danger btn-sm">
	                       <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
	                                           ɾ��
	                    </button>
	                  </th>
	                </tr>
                </c:forEach>
                
             </table>
          </div>
       </div>
       <!-- ��ҳ��Ϣ -->
       <div class="row">
          <div class="col-md-6">
                       ��ǰ${pageInfo.pageNum }ҳ����${pageInfo.pages }ҳ����${pageInfo.total }����¼
          </div>
          <div class="col-md-6">
			 <nav aria-label="Page navigation">
			  <ul class="pagination">
			    <li><a href="${APP_PATH}/emps/emps?pn=1">��ҳ</a></li>
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
			    <li><a href="${APP_PATH}/emps/emps?pn=${pageInfo.pages }">ĩҳ</a></li>
			  </ul>
			</nav>
          </div>
       </div>
    </div>
  </body>
</html>
