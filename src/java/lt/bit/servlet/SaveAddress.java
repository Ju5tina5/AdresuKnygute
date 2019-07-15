/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lt.bit.data.Address;
import lt.bit.data.Person;
import lt.bit.db.DB;
import sun.security.pkcs11.wrapper.Functions;

/**
 *
 * @author ACER
 */
@WebServlet(name = "SaveAddress", urlPatterns = {"/saveaddress"})
public class SaveAddress extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NullPointerException {
        
          String ids = request.getParameter("id");
          String ids2 = request.getParameter("id2");
          String city = request.getParameter("ct");
          String postal = request.getParameter("ps");
          String address = request.getParameter("ad");
         
         try {
             Integer id2 = Integer.valueOf(ids2);
             Integer id = Integer.valueOf(ids);
             Integer adr = Integer.valueOf(address);
            if ( "-1".equals(ids2)) {
                Address a = new Address(adr, postal, city);
                DB.addAddress(id, a);
                } else {
                       Address a = new Address(adr, postal, city);
                       a.setId(id2);
                       DB.updateAddress(a);
                   }
                }catch (Exception e) {// ignored
            }
        response.sendRedirect("addressas.jsp?id="+ids);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
