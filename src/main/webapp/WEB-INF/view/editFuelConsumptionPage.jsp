<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Fuel Consumption</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Include jQuery and jQuery UI -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- JavaScript for initializing the date picker -->
    <script>
        $(function() {
            // Initialize date picker
            $("#date").datepicker();
        });

        function validateForm() {
            // Basic validation, you can add more complex validation as needed
            var date = $("#date").val();
            var driverName = $("#driverName").val();
            var fuelCost = $("#fuelCost").val();
            var fuelType = $("#fuelType").val();
            var vehicleNum = $("#vehicleNum").val();
            var vehicleType = $("#vehicleType").val();

            if (date === "" || driverName === "" || fuelCost === "" || fuelType === "" || vehicleNum === "" || vehicleType === "") {
                alert("Please fill in all required fields.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body class="container">

    <h2 class="mt-4">Update Fuel Consumption</h2>

    <form id="updateForm" action="${pageContext.request.contextPath}/fuelconsumption/editFuelConsumption" method="post">
        <% if(request.getParameter("fuelID") != null) { %>
            <!-- Include a hidden field for fuel ID when editing -->
            <input type="hidden" id="fuelID" name="fuelID" value="<%= request.getParameter("fuelID") %>">

        <% } %>

        <div class="form-group">
            <label for="date">Date:</label>
            <!-- Use type="text" with pattern for date validation -->
            <input type="text" class="form-control" id="date" name="date" placeholder="Select date" required>
        </div>

<div class="form-group">
    <label for="driverName">Driver Name:</label>
    <input type="text" class="form-control" id="driverName" name="driverName" value="<%= (String)session.getAttribute("driverName") %>" readonly required>
</div>

        <div class="form-group">
            <label for="fuelCost">Fuel Cost:</label>
            <!-- Use type="number" for numeric input -->
            <input type="number" class="form-control" id="fuelCost" name="fuelCost" required>
        </div>

        <div class="form-group">
            <label for="fuelType">Fuel Type:</label>
            <input type="text" class="form-control" id="fuelType" name="fuelType" required>
        </div>

        <div class="form-group">
            <label for="vehicleNum">Vehicle Number:</label>
            <input type="text" class="form-control" id="vehicleNum" name="vehicleNum" required>
        </div>

        <div class="form-group">
            <label for="vehicleType">Vehicle Type:</label>
            <input type="text" class="form-control" id="vehicleType" name="vehicleType" required>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
        <button type="button" class="btn btn-secondary" onclick="goBack()">Cancel</button>
    </form>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>

</body>
</html>
