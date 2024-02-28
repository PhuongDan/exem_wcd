package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import wcd.jpa.entities.Employee;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/create")
public class EmployeeCreateController extends HttpServlet {
    private SessionFactory sessionFactory;

    @Override
    public void init() throws ServletException {
        try {
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
        Employee employee = new Employee();
        employee.setEmployee_id(req.getParameter("employee_id"));
        employee.setEmployee_name(req.getParameter("employee_name"));
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthday = null;
            birthday = dateFormat.parse(req.getParameter("birthday"));
            employee.setBirthday(birthday);
            employee.setPhone_number(req.getParameter("phone_number"));
            employee.setEmail(req.getParameter("email"));

            session.save(employee);
            session.getTransaction().commit();
            resp.sendRedirect("list");
        }catch (Exception e){
            resp.setStatus(500);
        }
    }
}


