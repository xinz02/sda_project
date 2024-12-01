<%@ page import="java.util.List" %>
<%@ page import="entity.FuelConsumption" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<c:set var="fuelConsumptions" value="${requestScope.fuelConsumptions}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Home Page</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
		body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
</style>
</head>
<body>
<div class="container mt-5 p-5 mb-5" style="background-color: white;">
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

    
        <div><h1 class="text-center mb-4">Fuel Consumption List</h1></div>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Fuel ID</th>
                    <th scope="col">Date</th>
                    <th scope="col">Driver Name</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<FuelConsumption> fuelConsumptions = (List<FuelConsumption>) request.getAttribute("fuel");
                    if (fuelConsumptions != null && !fuelConsumptions.isEmpty()) {
                        for (FuelConsumption fuelConsumption : fuelConsumptions) {
                        	int i = 1;
                %>
                            <tr>
                                <td><%= fuelConsumption.getFuelID() %></td>
                                <td><%= fuelConsumption.getDate() %></td>
                                <td><%= fuelConsumption.getDriverName() %></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/fuelconsumption/FuelConsumptionDetailPage?fuelID=<%= fuelConsumption.getFuelID() %>"
                                       class="btn btn-primary">View Details</a>
                                </td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="4">No entry available.</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <!-- Insert Button -->
        <%
		String role = (String) session.getAttribute("role");
		if(!role.equals("admin")) {
	%>
		<a href="${pageContext.request.contextPath}/fuelconsumption/insertFuelConsumptionPage" class="btn btn-success">Insert New Form</a>
 	<% } %>
        
        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Home</a>
    </div>
</div>
</body>
</html>
