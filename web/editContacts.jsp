<%-- 
    Document   : editContacts
    Created on : Jul 14, 2019, 2:23:04 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="lt.bit.db.DB"%>
<%@page import="lt.bit.data.Person"%>
<%@page import="lt.bit.data.Address"%>
<%@page import="lt.bit.data.Contact" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Contact</title>
    </head>
    <body>
         <% 
        String ids = request.getParameter("id");
        String ids2 = request.getParameter("id2");
         Contact c = null;
         Person p = null;
        try {
              p = DB.getById(Integer.valueOf(ids));
            } catch (Exception e) {
                //Ignored
            }
        try {
                c = DB.getContactById(Integer.valueOf(ids2));
            } catch (Exception e) {
            }
       
         if ( c == null && ids2 != null&& p == null && ids != null  ) {
                 response.sendRedirect("index.jsp");
                 return;
             }
        %>
        <form action="savecontact">
            <% if (ids2 != null && ids != null ) {
                %>
                <input name="id2" type="hidden" value="<%=ids2%>">
                 <input name="id" type="hidden"  value="<%=ids%>">
                <% } %>  
                <input name="ct" placeholder="Contact" value="<%=(c!=null)?c.getContact():""%>">
                <input name="ty" placeholder="Type" value="<%=(c!=null)?c.getType():""%>">
                <input type="submit" value="Save">
                <% p = DB.getById(Integer.valueOf(ids)); %>
                <a href="contacts.jsp?id=<%=p.getId()%>">Cancel</a> 
        </form>
    </body>
</html>
