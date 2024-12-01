<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<%@ page import="java.util.List" %>
<%@ page import="entity.Maintenance" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
		body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            /* padding: 20px;
            text-align: center; */
        }
</style>
</head>
<body> 
<div class="container mt-5 p-5 mb-5" style="background-color: white;">

<!-- Bootstrap Alert for Success Message -->
    <!-- Bootstrap Alert for Success Message -->
    <% 
        String message = request.getParameter("message");
        if (message != null && !message.isEmpty()) { 
    %>
        <div class="container mt-3">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= message %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
    <% } %>

	<div><h1 class="text-center mb-4">List of Maintenance</h1></div>
	
	<div>
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">No.</th>
		      <th scope="col">Date</th>
		      <th scope="col">Vehicle Type</th>
		      <th scope="col">Vehicle Number</th>
		      <th scope="col">Approve Status</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  
    
		  <%
			  List<Maintenance> vmList = (List<Maintenance>) request.getAttribute("vmList");
		  	  if (vmList != null && !vmList.isEmpty()) {
              for (int i = 0; i < vmList.size(); i++) {
		  %>
		    <tr>
		      <th scope="row"><%= i+1 %></th>
		      <td><%= vmList.get(i).getDate() %></td>
		      <td><%= vmList.get(i).getVehicleType() %></td>
		      <td><%= vmList.get(i).getVehicleNum() %></td>
		      <td><%= vmList.get(i).getApproveStatus() %></td>
		      <td><a href="${pageContext.request.contextPath}/maintenance/viewDetail/<%= vmList.get(i).getMaintenanceID() %>" class="btn btn-primary btn-sm active p-2" role="button" aria-pressed="true">View Details</a></td>
		    </tr>
		  <%
                  }
               } else {
           %>
		    <tr>
               <td colspan="6">No maintenance entry available.</td>
            </tr>
            <%
                }
            %>
		  </tbody>
		</table>
	</div>
	<%
		String role = (String) session.getAttribute("role");
		if(!role.equals("admin")) {
	%>
		<a href="${pageContext.request.contextPath}/maintenance/addMaintenance" class="btn btn-success">Insert New Form</a>
 	<% } %>
 	
 	 <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Home</a>
</div>

</body>
</html>