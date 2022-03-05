package control;

import model.bean.UserBean;
import model.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserBean newUser = new UserBean();
        if (session.getAttribute("utente")!=null && session.getAttribute("manager")!=null) {
            try {
                newUser.setNome(req.getParameter("Nome"));
                newUser.setCognome(req.getParameter("Cognome"));
                newUser.setUsername(req.getParameter("Username"));
                newUser.setEmail(req.getParameter("Email"));
                newUser.setPassword(req.getParameter("Password"));
                if (UserDao.doInsertUser(newUser)) {
                    newUser.setValid(true);
                    session.setAttribute("utente", newUser);
                    resp.sendRedirect("view/Home.jsp");
                } else if (!UserDao.doInsertUser(newUser)) {
                    session.setAttribute("alertMsg", "Registrazione Fallita");
                    resp.sendRedirect("view/Home.jsp");
                }
            } catch (Throwable e) {
                System.out.println("Ciao");
                e.printStackTrace();
                session.setAttribute("alertMsg", "Registrazione Fallita");
                resp.sendRedirect("view/Home.jsp");
            }
        }else{
            session.setAttribute("alertMsg","Utente già registrato");
            resp.sendRedirect("view/Home.jsp");
        }
    }
}

