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
import java.util.List;

@WebServlet(value = "/list")
public class EmployeeController extends HttpServlet {
    private SessionFactory sessionFactory;
    @Override
    public void init() throws ServletException {
        try{
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            List<Employee> ls = session.createQuery("SELECT DISTINCT e FROM Employee e ",Employee.class)
                    .getResultList();
            req.setAttribute("employee",ls);
            session.getTransaction().commit();
            req.getRequestDispatcher("employee/list.jsp").forward(req,resp);
            return;
        }

    }
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Employee employee = session.get(Employee.class, Integer.parseInt(entityId));
            if (employee != null) {
                session.delete(employee);
            }
            session.getTransaction().commit();
            resp.setStatus(200);
            return;
        }catch (Exception e){
            resp.setStatus(403);
        }
    }

}
