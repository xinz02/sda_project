<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Fuel Consumption</title>

    <!-- Add jQuery and jQuery UI CDN links -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Your existing styles or scripts go here -->
</head>
<body class="container">
<%
	String dName = (String) session.getAttribute("driverName");
%>

<h2 class="mt-4">Insert Fuel Consumption</h2>

<form class="mt-4" action="insertFuelConsumption" method="post">
    <div class="form-group">
        <label for="date">Date:</label>
        <!-- Use type="text" with pattern for date validation -->
        <input type="text" class="form-control" id="date" name="date" placeholder="Select date" required>
    </div>

    <div class="form-group">
        <label for="driverName">Driver Name:</label>
        <input type="text" class="form-control" id="driverName" name="driverName" readonly value="<%= dName %>">
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

    <button type="submit" class="btn btn-primary">Submit</button>
</form>

<button type="button" class="btn btn-secondary mt-2" onclick="goBack()">Cancel</button>

<!-- Add this script after the jQuery and jQuery UI imports -->
<script>
    $(function () {
        $("#date").datepicker();
    });

    function goBack() {
        window.history.back();
    }
</script>

</body>
</html>
