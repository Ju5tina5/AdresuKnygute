<%-- 
    Document   : editAddress
    Created on : Jul 12, 2019, 9:45:32 AM
    Author     : ACER
--%>

<%@page import="sun.security.pkcs11.Secmod.DbMode"%>
<%@page import="java.util.List"%>
<%@page import="com.sun.media.sound.DLSSoundbank"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lt.bit.db.DB"%>
<%@page import="lt.bit.data.Person"%>
<%@page import="lt.bit.data.Address"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Address</title>
    </head>
    <body>
        <% 
        String ids = request.getParameter("id");
        String ids2 = request.getParameter("id2");
         Address a = null;
         Person p = null;
        try {
              p = DB.getById(Integer.valueOf(ids));
            } catch (Exception e) {
                //Ignored
            }
        try {
                a = DB.getAddressById(Integer.valueOf(ids2));
            } catch (Exception e) {
            }
       
         if ( a == null && ids2 != null && p == null && ids != null  ) {
                 response.sendRedirect("index.jsp");
                 return;
             }
        %>
        <form action="saveaddress">
            <% if (ids2 != null && ids != null) {
                %>
                <input name="id2" type="hidden" value="<%=ids2%>">
                <input name="id" type="hidden" value="<%=ids%>">
                <% } %>  
                <input name="ct" placeholder="City" value="<%=(a!=null)?a.getCity():""%>">
                <input name="ps" placeholder="PostalCode" value="<%=(a!=null)?a.getPostalCode():""%>">
                <input name="ad" placeholder="Address" value="<%=(a!=null)?a.getAddress():""%>">
                <input type="submit" value="Save">
                <% p = DB.getById(Integer.valueOf(ids)); %>
                <a href="addressas.jsp?id=<%=p.getId()%>">Cancel</a>
        </form>
    </body>
</html>
