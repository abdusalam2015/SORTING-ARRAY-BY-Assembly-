<%-- 
    Document   : courseSave
    Created on : Nov 10, 2015, 11:59:37 PM
    Author     : abdussalam
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <style>
            table, th, td {
                border: 1px solid black;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <%
            ArrayList<String> lst = (ArrayList) session.getAttribute("crsid");
            String userID = session.getAttribute("userSSN").toString();
            String url = "jdbc:mysql://localhost:3306/MUniversity";
            String user = "root";
            String password = "root";
            Connection con = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url, user, password);
            } catch (Exception e) {
                System.out.println("Faild Connection!");
                e.printStackTrace();
            }
            int c = 0;
            Statement stmt2 = null;
            while (c < lst.size()) {
                String sql = "Insert Into Registered Values ('" + userID + "','" + lst.get(c) + "','summer',2016);";
                stmt2 = con.createStatement();
                int i = stmt2.executeUpdate(sql);
                c++;
            }
             %><h3>Registered successfully !</h3>
             <h4> This all courses you are registered in  </h4>
             <table>
                  <tr>
                    <th> CrsCode</th>
                    <th> Name </th>
                </tr>
             <%
            
                Statement stmt3 = null;
                stmt3 = con.createStatement();
               String sql3 = "select CrsCode  from Registered where SSN='" + userID + "'";
                 ResultSet RS3 = stmt3.executeQuery(sql3);
                HashMap<String, String> crsMp = new HashMap();
                ArrayList<String> list = new ArrayList<String>();
                ArrayList<String> list2 = new ArrayList<String>();
                crsMp = (HashMap)request.getSession().getAttribute("mapp");    
                 while (RS3.next()) {
                    String s1 = RS3.getString(1);
                   %> <tr><td> <%=s1%></td><td><%=crsMp.get(s1)%> </td><br></tr><%

                }
      
            
            lst.clear();
            con.close();
        %>  

             </table>
    </body>
</html>
