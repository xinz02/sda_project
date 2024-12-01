<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page import=" entity.Maintenance" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Car Maintenance Data Input Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
            text-align: center;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        label {
            margin-top: 10px;
            display: block;
            color: #666;
        }
        input[type="text"],
        input[type="date"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #5cb85c;
            color: white;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        fieldset {
        	margin-top: 15px;
        	margin-bottom: 15px;
        }
        
        button {
        	margin-top: 15px;
        	width: 100%;
        	padding: 10px;
        }
    </style>
</head>
<body>
<%
	Maintenance vm = (Maintenance) request.getAttribute("vm");
	List<Maintenance> mList = (List<Maintenance>) request.getAttribute("mList");
%>

    <div class="container">
        <h2>Car Maintenance Edit Form</h2>
      
          <form action="${pageContext.request.contextPath}/maintenance/EditDetail/<%= vm.getMaintenanceID() %>" method="post">

		<label for="driverName">Driver Name:</label><br>
		<input type="text" id="driverName" name="driverName" value="<%= vm.getDriverName() %>" readonly><br>

        
         <label for="date">Date:</label><br>
        <input type="date" id="date" name="date" value="<%= vm.getDate() %>"><br>

        <label for="vehicleNum">Vehicle Number:</label><br>
        <input type="text" id="vehicleNum" name="vehicleNum" value="<%= vm.getVehicleNum() %>"><br>

        <label for="vehicleType">Vehicle Type:</label><br>
        <input type="text" id="vehicleType" name="vehicleType" value="<%= vm.getVehicleType() %>"><br>


        <input type="submit" value="Submit">
        <button type="button" class="btn btn-secondary btn-lg active p-3" onclick="goBack()">Cancel</button>

    </form>
           
    </div>
    
    <script>

function goBack() {
	window.location.href = "${pageContext.request.contextPath}/maintenance/viewDetail/<%= vm.getMaintenanceID() %>";
}
</script>
</body>
</html>