<%-- 
    Document   : addressas.jsp
    Created on : Jul 12, 2019, 9:25:44 AM
    Author     : ACER
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lt.bit.db.DB"%>
<%@page import="lt.bit.data.Person"%>
<%@page import="lt.bit.data.Address"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Address</title>
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
                            List<Address> list = DB.getPersonAddresses(id);
                %>
                <h1>  <%=p.getFirstName()%> 
                    <%= p.getLastName()%>
                    Addresses: </h1>
                    <%
                        for (Address a : list) {
                    %>     
                <li>
                    <%=a.getCity()%>
                    <%=a.getAddress()%>
                    <%=a.getPostalCode()%>
                    <a href="deleteaddress?id=<%=p.getId()%>&id2=<%=a.getId()%>">Delete</a>
                    <a href="editAddress.jsp?id=<%=p.getId()%>&id2=<%=a.getId()%>">Edit</a>
                </li>
                <% }%>   
            </ul>
            <a href="editAddress.jsp?id=<%=p.getId()%>&id2=-1">New Address</a>
            <a href="index.jsp">Back</a>
            <%
                    }
                } catch (Exception e) {
                    // Ignored
                }
            %>
        </div>
    </body>
</html>
