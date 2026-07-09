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
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    Connection con = ConnectionPro.getConnection();

    // Xử lý nút Submit Cập nhật
    if(request.getParameter("submit") != null) {
        String sname = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        PreparedStatement pstUpdate = con.prepareStatement("update records set stname = ?, course = ?, fee = ? where id = ?");
        pstUpdate.setString(1, sname);
        pstUpdate.setString(2, course);
        pstUpdate.setString(3, fee);
        pstUpdate.setString(4, id);
        pstUpdate.executeUpdate();
        
        out.println("<script>alert('Update Successful!'); window.location.href='manage.jsp';</script>");
    }

    // Hiển thị dữ liệu cũ lên Form
    PreparedStatement pstSelect = con.prepareStatement("select * from records where id = ?");
    pstSelect.setString(1, id);
    ResultSet rs = pstSelect.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Record</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="padding: 20px;">
    <h1>Student Update Form</h1>
    <div class="row">
        <div class="col-sm-4">
            <% while(rs.next()) { %>
            <form class="card p-3" method="post" action="update.jsp?id=<%=id%>">
                <div align="left" class="mb-3">
                    <label class="form-label">Student name</label>
                    <input type="text" class="form-control" name="sname" value="<%=rs.getString("stname")%>" required>
                </div>
                <div align="left" class="mb-3">
                    <label class="form-label">Course</label>
                    <input type="text" class="form-control" name="course" value="<%=rs.getString("course")%>" required>
                </div>
                <div align="left" class="mb-3">
                    <label class="form-label">Fee</label>
                    <input type="number" class="form-control" name="fee" value="<%=rs.getString("fee")%>" required>
                </div>
                <div align="right">
                    <input type="submit" value="Update" name="submit" class="btn btn-info text-white">
                    <a href="manage.jsp" class="btn btn-secondary">Back</a>
                </div>
            </form>
            <% } %>
        </div>
    </div>
</body>
</html>