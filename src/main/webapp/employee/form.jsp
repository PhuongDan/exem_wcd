
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">
    <h1>Add Employee</h1>
    <div class="row">
        <div class="col-6">
            <form method="post" action="create">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Employee Id</label>
                    <input type="text" name="employee_id" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Employee Name</label>
                    <input type="name" name="employee_name" class="form-control"  aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <div class="input-group">
                        <input class="form-control" id="date" name="birthday" placeholder="MM/DD/YYYY" type="text">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Phone Number</label>
                    <input type="text" name="employee_name" class="form-control"  aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>


</body>
</html>