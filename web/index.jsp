<%@ page import="db.StartupConfig" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 30.11.18
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <%! StartupConfig sc = new StartupConfig();
        StringBuffer users = new StringBuffer();
    %>
  </head>
  <body>

    <%
        try {
            Connection con = this.sc.getConnection();
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM account;");
            while(rs.next()) {

                out.println("<p>" + rs.getString(2) + "</p>");
            }
          } catch (SQLException e) {
            e.printStackTrace();
            }

    %>

  </body>
</html>
