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

@WebServlet(name = "BrandControllerServlet", value = "/BrandControllerServlet")
public class BrandControllerServlet extends HttpServlet {
    private static final long seriaVersionUID = 1L;
    private BrandDbUtil brandDbUtil;
    @Resource(name = "jdbc/examisaf")
    private DataSource dataSource;
    @Override
    public void init() throws ServletException {
        super.init();
        try {
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
                    addBrand(request,response);
                    break;
                case "LOAD":
                    loadBrand(request,response);
                    break;
                case "UPDATE":
                    updateBrand(request,response);
                    break;
                case "DELETE":
                    deleteBrand(request,response);
                    break;
                default:
                    listBrands(request,response);
            }

        }catch (Exception exc) {
            throw new ServletException(exc);
        }
    }
    private void deleteBrand(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String theBrandId = request.getParameter("brandId");
        brandDbUtil.deleteBrand(theBrandId);
        listBrands(request,response);

    }
    private void updateBrand(HttpServletRequest request,HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("brandId"));
        String name = request.getParameter("name");

        Brand theBrand = new Brand(id,name);
        brandDbUtil.updateBrand(theBrand);
        listBrands(request,response);
    }
    private void loadBrand(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String theBrandId = request.getParameter("brandId");
        Brand theBrand = brandDbUtil.getBrand(theBrandId);
        request.setAttribute("THE_BRAND",theBrand);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/update-brand-form.jsp");
        dispatcher.forward(request,response);
    }
    private void addBrand(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");


        Brand theBrand = new Brand(name);
        brandDbUtil.addBrand(theBrand);
        listBrands(request,response);
    }
    private void listBrands(HttpServletRequest request,HttpServletResponse response) throws Exception {
        List<Brand> brands = brandDbUtil.getBrands();
        request.setAttribute("BRAND_LIST",brands);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-brands.jsp");
        dispatcher.forward(request,response);
    }
}
