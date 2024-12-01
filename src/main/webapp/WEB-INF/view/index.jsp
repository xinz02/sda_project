<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh; /* 100% viewport height */
            margin: 0; /* Remove default margin */
        }
    </style>
</head>
<body class="bg-light text-dark">
    <div class="container my-auto mx-auto shadow p-5 rounded-4">
        <div class="mx-3">
            <h1 class="mb-2 text-center">Login</h1>
            <div class="d-grid gap-2 mt-3">
                <h5 class="text-center mt-2 mb-2">Please Select Your Role:</h5>
                <form class="w-100" method="post" action="${pageContext.request.contextPath}/admin">
                	<button class="btn btn-primary btn-lg mt-2 w-100" type="submit">Login As Admin</button>
                </form>
                
                <form class="w-100" method="post" action="${pageContext.request.contextPath}/driver">
                	<button class="btn btn-primary btn-lg w-100" type="submit">Login As Driver</button>
                </form>
                
            </div>
        </div>
    </div>
</body>
</html>
