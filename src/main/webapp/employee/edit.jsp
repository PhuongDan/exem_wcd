<%@ page import="wcd.jpa.entities.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">
    <h1>Edit Employee</h1>
    <div class="row">
        <div class="col-6">
            <% Employee employee = (Employee) request.getAttribute("employee"); %>
            <form method="post" action="edit?id=<%= employee.getEmployee_id() %>">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Employee Id</label>
                    <input type="text" value="<%= employee.getEmployee_id() %>" name="name" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Employee Name</label>
                    <input type="text" value="<%= employee.getEmployee_name() %>" name="name" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <div class="input-group">
                        <input class="form-control" value="<%= employee.getBirthday() %>" id="date" name="birthday" placeholder="MM/DD/YYYY" type="text">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Phone Number</label>
                    <input type="text" value="<%= employee.getEmail() %>" name="name" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email</label>
                    <input type="email" value="<%= employee.getEmail() %>" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>


</body>
</html>