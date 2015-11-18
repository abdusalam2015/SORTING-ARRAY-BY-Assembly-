<%-- 
    Document   : connect
    Created on : Nov 8, 2015, 10:46:10 PM
    Author     : abdussalam
--%>


<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            table, th, td {
                border: 1px solid black;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form action="ServletShow">
            <%
                String url = "jdbc:mysql://localhost:3306/MUniversity";
                String user = "root";
                String password = "root";
                Connection con = null;
                //jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=convertToNull [root on Default schema]
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, user, password);

                } catch (Exception e) {
                    System.out.println("Faild Connection!");
                    //out.print("fasfsadfsdfsadf");
                    e.printStackTrace();
                }
                String SSN = request.getParameter("SSN");
                String pass = request.getParameter("pass");

                session.setAttribute("userSSN", SSN);

                Statement stmt2 = null;
                stmt2 = con.createStatement();
                String sql2 = "select SSN , Password, Name from Student where SSN ='" + SSN + "'and Password ='" + pass + "'";
                try {

                    ResultSet RS2 = stmt2.executeQuery(sql2);
                    RS2.next();
                    String uname = RS2.getString(3).toString();
                    session.setAttribute("uname", uname);
                    if (RS2.getString(1).equals(SSN) && RS2.getString(2).equals(pass)) {

            %><h1>Welcome <%=uname%> </h1> <%
                }
                stmt2.close();

                Statement stmt3 = null;
                stmt3 = con.createStatement();
                String sql3 = "select CrsCode , Name from Course ";
                ResultSet RS3 = stmt3.executeQuery(sql3);
                HashMap<String, String> crsMp = new HashMap();
                ArrayList<String> list = new ArrayList<String>();
                ArrayList<String> list2 = new ArrayList<String>();
                while (RS3.next()) {
                    String s1 = RS3.getString(1);
                    String s2 = RS3.getString(2);
                    crsMp.put(s1, s2);
                    list2.add(s1);

                }
                RS3.close();
                stmt3.close();


            %>
            <table  style="width:50%"     >

                <%
                session.setAttribute("mapp", crsMp);
                Statement stmt = null;
                    stmt = con.createStatement();
                    String sql = "select CrsCode  from Registered where SSN='" + SSN + "'";

                    ResultSet RS = stmt.executeQuery(sql);
                    while (RS.next()) {

                        String str = RS.getString(1);
                        list.add(str);
                    }
                    con.close();
                %>

                <tr>

                    <%
                        int c = 0;
                        if (list.size() != list2.size()) {
                    %>
                <tr>
                    <th> CrsCode</th>
                    <th> Name </th>
                </tr>
                <h3>Select any Course you want to Regaster in</h3><%
                    for (int i = 0; i < list2.size(); i++) {
 //<td><input type="checkbox" id="row_sel<%=crsMp.get(list2.get(i) //" name="<portlet:namespace/>row_sel<%=crsMp.get(list2.get(i)//" class="row_sel" /></td>

                        if (!list.contains(list2.get(i))) {
                %> 
                <td width="50%"> <b><input type="checkbox" name=checkedRows     value=<%=list2.get(i)%> > <%=list2.get(i)%> </td> 
                         <td width="50%"> <%=crsMp.get(list2.get(i))%></td>  <br>

                        </tr>
                        <%

                                }
                            }
                        %>
                        </table>
                        <br>
                        <input type="submit"   value="Check" />
                        </form>
                        <%        } else {
                        %>
                        <h3> you registered before ! No available courses! </h3>
                        <form action="connect.jsp">
                            <input type="submit" value="Back" />
                        </form>
                        <form action="courseSave.jsp">
                            <input type="submit" value="ShowCourses" />
                        </form>

                        <%
                                }
                            } catch (Exception e) {
                                out.print("Invalid  Password OR SSN");
                            }
                        %>

                        </body>
                        </html>
