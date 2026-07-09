<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="newpackage.*"%>
<%
    // KIỂM TRA SESSION ĐỂ BẢO VỆ TRANG
    User loggedUser = (User) session.getAttribute("logUser");
    if (loggedUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%
    // Xử lý nút Submit Thêm mới
    request.setCharacterEncoding("UTF-8");
    if(request.getParameter("submit") != null) {
        String sname = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Connection con = ConnectionPro.getConnection();
        PreparedStatement pst = con.prepareStatement("insert into records(stname, course, fee) values(?,?,?)");
        pst.setString(1, sname);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.executeUpdate();
        
        out.println("<script>alert('Thêm dữ liệu thành công!');</script>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Register Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="padding: 20px;">
    
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1>Student Register Form</h1>
        <div>
            <span>Xin chào, <b><%= loggedUser.getName() %></b>!</span> | 
            <a href="LogoutServlet" class="btn btn-danger btn-sm">Đăng xuất</a>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4">
            <form class="card p-3" method="post" action="manage.jsp">
                <div align="left" class="mb-3">
                    <label class="form-label">Student name</label>
                    <input type="text" class="form-control" name="sname" required>
                </div>
                <div align="left" class="mb-3">
                    <label class="form-label">Course</label>
                    <input type="text" class="form-control" name="course" required>
                </div>
                <div align="left" class="mb-3">
                    <label class="form-label">Fee</label>
                    <input type="number" class="form-control" name="fee" required>
                </div>
                <div align="right">
                    <input type="submit" value="Submit" name="submit" class="btn btn-info text-white">
                    <input type="reset" value="Reset" name="reset" class="btn btn-warning text-white">
                </div>
            </form>
        </div>

        <div class="col-sm-8">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Student Name</th>
                        <th>Course</th>
                        <th>Fee</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = ConnectionPro.getConnection();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from records");
                        while(rs.next()) {
                            String id = rs.getString("id");
                    %>
                    <tr>
                        <td><%= rs.getString("stname") %></td>
                        <td><%= rs.getString("course") %></td>
                        <td><%= rs.getString("fee") %></td>
                        <td><a href="update.jsp?id=<%=id%>" class="btn btn-primary btn-sm">Edit</a></td>
                        <td><a href="delete.jsp?id=<%=id%>" class="btn btn-danger btn-sm">Delete</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>