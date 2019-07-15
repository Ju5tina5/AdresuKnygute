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
    </head>
    <body>
        <ul>
            <%
                String ids = request.getParameter("id");
                 try {
                        int id = Integer.valueOf(ids);
                        if ( ids != null ) {
                        Person p = DB.getById(id);
                        List<Address> list = DB.getPersonAddresses(id);
                        %>
                         <p>  <%=p.getFirstName()%> 
                                <%= p.getLastName()%>
                                Addresses: </p>
                         <%
                        for (Address a: list) {
                        %>     
                    <li>
                        <%=a.getCity()%>
                        <%=a.getAddress()%>
                        <%=a.getPostalCode()%>
                        <a href="deleteaddress?id=<%=p.getId()%>&id2=<%=a.getId()%>">Delete</a>
                        <a href="editAddress.jsp?id=<%=p.getId()%>&id2=<%=a.getId()%>">Edit</a>
                    </li>
                     <% } %>   
                    </ul>
                    <a href="editAddress.jsp?id=<%=p.getId()%>&id2=-1">New Address</a>
                     <a href="index.jsp">Back</a>
                            <%                     
                            }   
                        } catch (Exception e){
                        // Ignored
                        } 
                        %>
    </body>
</html>
