package control;

import model.bean.UserBean;
import model.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req,resp);
        HttpSession session = req.getSession();
        UserBean newUser = new UserBean();
        try {
            newUser.setNome(req.getParameter("Nome"));
            newUser.setCognome(req.getParameter("Cognome"));
            newUser.setUsername(req.getParameter("Username"));
            newUser.setEmail("Email");
            newUser.setPassword("Password");
            if (UserDao.doInsertUser(newUser)) {
                newUser.setValid(true);
                session.setAttribute("utente", newUser);
                resp.sendRedirect("view/Home.jsp");
            }else{
                session.setAttribute("alertMsg", "Registrazione Fallita");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("alertMsg", "Registrazione Fallita");
            resp.sendRedirect("view/Home.jsp");
        }
    }
}

