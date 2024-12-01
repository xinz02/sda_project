<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="entity.FuelConsumption" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fuel Consumption Detail</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

    <div class="container mt-5 p-5 mb-5" style="background-color: white;">

        <h1>Fuel Consumption Detail</h1>

        <c:if test="${not empty fuel}">
            <% FuelConsumption fuel = (FuelConsumption) request.getAttribute("fuel"); %>

            <div class="row">
                <div class="col-md-6">
                    <p><strong>Fuel ID:</strong> <%= fuel.getFuelID() %></p>
                    <p><strong>Date:</strong> <%= fuel.getDate() %></p>
                    <p><strong>Driver Name:</strong> <%= fuel.getDriverName() %></p>
                    <p><strong>Fuel Cost:</strong> <%= fuel.getFuelCost() %></p>
                </div>
                <div class="col-md-6">
                    <p><strong>Fuel Type:</strong> <%= fuel.getFuelType() %></p>
                    <p><strong>Vehicle Type:</strong> <%= fuel.getVehicleType() %></p>
                    <p><strong>Vehicle Number:</strong> <%= fuel.getVehicleNum() %></p>
                </div>
            </div>

            <div class="mt-3">
                <% 
                    String role = (String) session.getAttribute("role");
                    if (!role.equals("admin")) {
                %>
                    <!-- Edit Button -->
                    <a href="${pageContext.request.contextPath}/fuelconsumption/editFuelConsumption?fuelID=<%= fuel.getFuelID() %>" class="btn btn-primary">Edit</a>

                    <!-- Delete Button -->
                    <form id="deleteForm" action="deleteFuelConsumption" method="post" style="display: inline;">
                        <input type="hidden" name="fuelID" value="<%= fuel.getFuelID() %>">
                        <button type="button" class="btn btn-danger" onclick="confirmDelete()">Delete</button>
                    </form>
                <% } %>

                <!-- JavaScript Cancel Button -->
                <a href="#" class="btn btn-secondary" onclick="goBack()">Cancel</a>
            </div>

            <script>
                function confirmDelete() {
                    var result = confirm("Are you sure you want to delete this entry?");
                    if (result) {
                        // If the user confirms, submit the form
                        document.getElementById("deleteForm").submit();
                    }
                }

                function goBack() {
                    window.history.back(); // Go back to the previous page
                }
            </script>
        </c:if>

    </div>

</body>
</html>
