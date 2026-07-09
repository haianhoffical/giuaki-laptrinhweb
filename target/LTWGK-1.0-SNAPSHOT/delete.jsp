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

    String id = request.getParameter("id");
    
    // Tiến hành xóa
    Connection con = ConnectionPro.getConnection();
    PreparedStatement pst = con.prepareStatement("delete from records where id = ?");
    pst.setString(1, id);
    pst.executeUpdate();
%>

<script>
    alert("Delete Successful!");
    window.location.href = "manage.jsp";
</script>