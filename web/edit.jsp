<%-- 
    Document   : edit
    Created on : Jul 10, 2019, 4:25:30 PM
    Author     : ACER
--%>

<%@page import="org.apache.tomcat.jni.Mmap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="lt.bit.db.DB"%>
<%@page import="lt.bit.data.Person" %>
<%@page import="lt.bit.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
    </head>
    <body>
        <% 
        String ids = request.getParameter("id");
            Person p = null;
            try {
                p = DB.getById(Integer.valueOf(ids));
            } catch (Exception e) {
                // ignore
            }
             if (p == null && ids != null ) {
                 response.sendRedirect("index.jsp");
                 return;
             }
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        %>
        <form action="save">
             <% if (ids != null) {
                %>
                <input name="id" type="hidden" value="<%=p.getId()%>">
                <% } %>  
            <input name="fn" placeholder="First Name" value="<%=(p!=null)?p.getFirstName():""%>">
            <input name="ln" placeholder="Last Name" value="<%=(p!=null)?p.getLastName():""%>">
            <input name="dt" placeholder="Birth Date" value="<%=(p!=null)?sdf.format(p.getBirthDate()):""%>">
            <input name="sl" placeholder="Salary" value="<%=(p!=null)?p.getSalary():""%>">
            <input type="submit" value="save">
            <a href="index.jsp">Cancel</a>
        </form>
    </body>
</html>
