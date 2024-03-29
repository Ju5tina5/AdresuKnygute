<%-- 
    Document   : contacts
    Created on : Jul 12, 2019, 9:26:36 AM
    Author     : ACER
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lt.bit.db.DB"%>
<%@page import="lt.bit.data.Person"%>
<%@page import="lt.bit.data.Address"%>
<%@page import="lt.bit.data.Contact" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contacts</title>
         <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <div class="container">
            <ul>
          <%
                     int id = -1;
                    String ids = request.getParameter("id");
                    try {
                        id = Integer.valueOf(ids);
                    } catch (Exception ex) {
                        response.sendRedirect("index.jsp");
                        return;
                    }
                 try {
                        if (ids != null) {
                        Person p = DB.getById(id);
                        List<Contact> list = DB.getPersonContacts(id);
                        %>
                        <h1>  <%=p.getFirstName()%> 
                             <%= p.getLastName()%>
                        Contacts </h1>
                        
                         <%
                        for (Contact c : list) {
                          %>
                    <li>
                        <%=c.getContact()%>
                        <%=c.getType()%>
                        <a href="deletecontact?id=<%=p.getId()%>&id2=<%=c.getId()%>">Delete</a>
                        <a href="editContacts.jsp?id=<%=p.getId()%>&id2=<%=c.getId()%>">Edit</a>
                    </li>
                    </ul>
                        <% } %>
                        <a href="editContacts.jsp?id=<%=p.getId()%>&id2=-1">New Contact</a>
                        <a href="index.jsp">Back</a>
                          <%
                              }
                        } catch (Exception e){
                        // Ignored
                        } 
                        %>
    </div>
    </body>
</html>
