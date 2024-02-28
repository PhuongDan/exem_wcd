<%@ page import="wcd.jpa.entities.Employee" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<div class="container">
    <h1 class="text-center">ABC Company`s Employee List</h1>
    <a href="create">Create</a>
    <table class="table">
        <thead>
        <th>No</th>
        <th>Employee Id</th>
        <th>Employee Name</th>
        <th>Birthday</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th></th>
        <th></th>
        </thead>
        <tbody>
        <% for (Employee e : (List<Employee>)request.getAttribute("employee")){ %>
        <tr>
            <td></td>
            <td><%= e.getEmployee_id()  %></td>
            <td><%= e.getEmployee_name()  %></td>
            <td><%= e.getBirthday()  %></td>
            <td><%= e.getPhone_number()  %></td>
            <td><%= e.getEmail()  %></td>
            <td><a href="edi?id=<%= e.getEmployee_id() %>">Edit</a> </td>
            <td><a class="text-danger" onclick="delete(<%= e.getEmployee_id() %>)" href="javascript:void(0);">Delete</a> </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function deleteE(employee_id) {
        if(confirm("Are you sure?")) {
            var url = `list?id=` + employee_id;
            fetch(url, {
                method: 'DELETE'
                // body: formData
            }).then(rs => {
                if (confirm("Delete successfully! Reload page?"))
                    window.location.reload();
            }).error(err => {
                alert(err)
            })
        }


    }
</script>
</body>
</html>