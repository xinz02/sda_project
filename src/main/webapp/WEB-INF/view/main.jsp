<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
		body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            /* padding: 20px;
            text-align: center; */
        }
           .select-role-button {
        top: 10px;
        left: 10px;
    }
</style>
</head>
<body>
	<div class="container position-absolute top-50 start-50 translate-middle p-5" style="background-color: white;">
		<div class="m-5"><h1 class="text-center mb-4">I-Fleet System</h1></div>
		<div class="d-flex justify-content-around m-5">
		<a href="${pageContext.request.contextPath}/role" class="btn btn-secondary select-role-button">Select Role</a>
		<a href="${pageContext.request.contextPath}/fuelconsumption/FuelListPage" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Fuel Consumption</a>
		<a href="${pageContext.request.contextPath}/maintenance/viewMaintenance" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Maintenance</a>
		</div>
	</div>
</body>
</html>