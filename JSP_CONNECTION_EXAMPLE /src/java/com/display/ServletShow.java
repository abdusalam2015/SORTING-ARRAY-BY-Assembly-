/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.display;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.HashMap;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jboss.weld.servlet.SessionHolder;
import sun.org.mozilla.javascript.Token;

/**
 *
 * @author abdussalam
 */
@WebServlet(name = "ServletShow", urlPatterns = {"/ServletShow"})
public class ServletShow extends HttpServlet {

    ArrayList<String> crsID = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String[] checked = request.getParameterValues("checkedRows");
            String[] checked2 = request.getParameterValues("crsName");
            HashMap<String , String >mp = (HashMap)request.getSession().getAttribute("mapp");    

            out.print("<h3> This Courses You  registerd  in :-   </h3>");
            out.print("<table border = 1><tr><td><h3> Course Code</h3></td> <td> <h3> Course Name </h3></td></tr> ");
            for (int i = 0; i < checked.length; i++) {
                crsID.add(checked[i]);

                out.print("<tr><td>" + checked[i] + "</td>  <td> " + mp.get(checked[i]) + "</td> </tr>");
                out.print("<br>");

            }
            out.print("</table>");
            out.print("<form   action=\"courseSave.jsp\">\n"
                    + "            <input type=\"submit\" value=\"Save\" />\n"
                    + "        </form>\n");
            out.print("<form   action=\"save.jsp\">\n"
                    + "            <INPUT TYPE=\"button\" VALUE=\"Edit\" onClick=\"history.go(-1);\">\n"
                    + "        </form>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        crsID.clear();
        HttpSession session = request.getSession(true);
        session.setAttribute("crsid", crsID);

        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
