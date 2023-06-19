package controller;

import dbutil.BrandDbUtil;
import dbutil.PhoneDbUtil;
import entity.Brand;
import entity.Phone;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PhoneControllerServlet", value = "/PhoneControllerServlet")
public class PhoneControllerServlet extends HttpServlet {
    private static final long seriaVersionUID = 1L;
    private PhoneDbUtil phoneDbUtil;
    private BrandDbUtil brandDbUtil;
    @Resource(name = "jdbc/examisaf")
    private DataSource dataSource;
    @Override
    public void init() throws ServletException {
        super.init();
        try {
            phoneDbUtil = new PhoneDbUtil(dataSource);
            brandDbUtil = new BrandDbUtil(dataSource);
        }catch (Exception exc) {
            throw  new ServletException(exc);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null)
                theCommand="list";
            switch (theCommand) {
                case "ADD":
                    addPhone(request,response);
                    break;
                case "LOAD":
                    loadPhone(request,response);
                    break;
                case "UPDATE":
                    updatePhone(request,response);
                    break;
                case "DELETE":
                    deletePhone(request,response);
                    break;
                default:
                    listPhones(request,response);
            }

        }catch (Exception exc) {
            throw new ServletException(exc);
        }
    }
    private void deletePhone(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String thePhoneId = request.getParameter("phoneId");
        phoneDbUtil.deletePhone(thePhoneId);
        listPhones(request,response);

    }
    private void updatePhone(HttpServletRequest request,HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("phoneId"));
        String name = request.getParameter("name");
        Double price =Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        Phone thePhone = new Phone(id,name,price,description,brandId);
        phoneDbUtil.updatePhone(thePhone);
        listPhones(request,response);
    }
    private void loadPhone(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String thePhoneId = request.getParameter("phoneId");
        Phone thePhone = phoneDbUtil.getPhone(thePhoneId);
        request.setAttribute("THE_PHONE",thePhone);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/update-phone-form.jsp");
        dispatcher.forward(request,response);
    }
    private void addPhone(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String name = request.getParameter("name");
        Double price =Double.parseDouble(request.getParameter("price")) ;
        String description = request.getParameter("description");
        int brandId = Integer.parseInt(request.getParameter("brandId"));

        Phone thePhone = new Phone(name,price,description,brandId);
        phoneDbUtil.addPhone(thePhone);
        listPhones(request,response);
    }
    private void listPhones(HttpServletRequest request,HttpServletResponse response) throws Exception {
        List<Phone> phones = phoneDbUtil.getPhones();
         request.setAttribute("PHONE_LIST",phones);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-phones.jsp");
        dispatcher.forward(request,response);
    }
}
