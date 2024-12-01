<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page import="entity.Maintenance" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Maintenance Detail</title>
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


<%
	String role = (String) session.getAttribute("role");
	Maintenance vm = (Maintenance) request.getAttribute("vm");
	//List<Maintenance> mList = (List<Maintenance>) request.getAttribute("mList");
%>

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


	<div><h1 class="text-center mb-4">Detail of Maintenance</h1></div>
	
	<% if(role.equals("driver")) {%> 
	<div class="pl-2">
		<p class="h4 p-2">Date: <%= vm.getDate() %></p>
		<p class="h4 p-2">Driver Name: <%= vm.getDriverName() %></p>
		<p class="h4 p-2">Vehicle Type: <%= vm.getVehicleType() %></p>
		<p class="h4 p-2">Vehicle Number: <%= vm.getVehicleNum() %></p>
		<p class="h4 p-2">Approve Status: <%= vm.getApproveStatus() %>
		</p>
		
	<div class="d-grid gap-2 d-md-block">
	<% 
	if(!vm.getApproveStatus().equals("Approved")){ %>
		<a href="${pageContext.request.contextPath}/maintenance/EditDetail/<%= vm.getMaintenanceID() %>" class="btn btn-success btn-lg active p-3" role="button" aria-pressed="true">Edit</a>
		<button class="btn btn-danger btn-lg active p-3" onclick="confirmDelete('<%= vm.getMaintenanceID() %>')">Delete</button>
	<% } %>
		<button class="btn btn-secondary  btn-lg active p-3" onclick="goBack()">Cancel</button>
		
	</div>
	</div>
	<% } %>
	
	<% if(role.equals("admin")) {%> 
	<div class="pl-2">
	<form action="${pageContext.request.contextPath}/maintenance/approveMaintenance/<%= vm.getMaintenanceID() %>" method="post">
		<p class="h4 p-2">Date: <%= vm.getDate() %></p>
		<p class="h4 p-2">Driver Name: <%= vm.getDriverName() %></p>
		<p class="h4 p-2">Vehicle Type: <%= vm.getVehicleType() %></p>
		<p class="h4 p-2">Vehicle Number: <%= vm.getVehicleNum() %></p>
		<p class="h4 p-2">Approve Status: 
		
		<select class="form-select" aria-label="approveStatus" name="approveStatus" id="approveStatus">
          <option value="Pending" disabled <%= "Pending".equals(vm.getApproveStatus()) ? "selected" : "" %>>Pending</option>
          <option value="Approved" <%= "Approved".equals(vm.getApproveStatus()) ? "selected" : "" %>>Approved</option>
          <option value="Rejected" <%= "Rejected".equals(vm.getApproveStatus()) ? "selected" : "" %>>Rejected</option>
        </select>
        </p>
		
	<div class="d-grid gap-2 d-md-block">
		<%-- <a href="${pageContext.request.contextPath}/maintenance/approveMaintenance/<%= vm.getMaintenanceID() %>" class="btn btn-success btn-lg active p-3" role="button" aria-pressed="true">Save Changes</a> --%>
		<button class="btn btn-primary btn-lg active p-3" type="submit">Save Changes</button>
		<button class="btn btn-secondary  btn-lg active p-3" type="button" onclick="goBack()">Cancel</button>
		
	</div>
	</form>
	</div>
	<% } %>
	

<script>
function confirmDelete(maintenanceID) {
    var result = confirm("Are you sure you want to delete this entry?");
    if (result) {
        // If the user confirms, redirect to the delete URL
        window.location.href = "${pageContext.request.contextPath}/maintenance/DeleteDetail/" + maintenanceID;
    }
}

function goBack() {
	window.location.href = "${pageContext.request.contextPath}/maintenance/viewMaintenance";
}
</script>
</body>
</html>