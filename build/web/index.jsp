<%-- 
    Document   : index.jsp
    Created on : Jul 10, 2019, 2:43:01 PM
    Author     : ACER
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="lt.bit.db.DB"%>
<%@page import="lt.bit.data.Person"%>
<%@page import="java.util.List"%>
<%@page import="lt.bit.servlet.DeleteServlet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/main.css">
        <title>Adresine</title>
    </head>
    <body>
        <div class="container">
            <h1 style=>List of all people:</h1>
            <ul>
            <% 
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                List<Person> list = DB.getAll();
                list.sort((p1, p2) -> p1.getFirstName().compareTo(p2.getFirstName()));
                for (Person p : list) {
                    %>
                    <li><%=p.getFirstName()%>
                        <%=p.getLastName()%>
                        <%=sdf.format(p.getBirthDate())%>
                        <%=p.getSalary()%>
                        <a href="delete?id=<%=p.getId()%>">Delete</a>
                        <a href="edit.jsp?id=<%=p.getId()%>">Edit</a>
                        <a href="addressas.jsp?id=<%=p.getId()%>">Address</a>
                        <a href="contacts.jsp?id=<%=p.getId()%>">Contacts</a>
                    </li>
                    <%
                }
            %>
            <a style="text-align: center" href="edit.jsp">Add Person</a>
            </ul>
        </div>
    </body>
</html>