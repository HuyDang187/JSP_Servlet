package mvctwo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MvcDemoServletTwo", value = "/MvcDemoServletTwo")
public class MvcDemoServletTwo extends HttpServlet {
    public MvcDemoServletTwo(){
        super();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> students = StudentDataUtil.getStudents();

        request.setAttribute("student_list",students);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view_students_two.jsp");

        dispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
