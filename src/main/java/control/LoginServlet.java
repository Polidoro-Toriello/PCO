package control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.bean.UserBean;
import model.dao.UserDao;

import java.io.IOException;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        HttpSession session = request.getSession();
        try {
            UserBean user = new UserBean();
            user.setUsername(request.getParameter("Username"));
            user.setPassword(request.getParameter("Password"));
            user = UserDao.doRetrieveUtente(user);
            if (user.isValid()) {
                if (user.isAdmin())
                    session.setAttribute("manager", user);
                else
                    session.setAttribute("utente", user);
                response.sendRedirect("./Home.jsp");
            } else {
                response.sendRedirect("./LoginPage.jsp");
            }
        } catch (Throwable e) {
            session.setAttribute("alertMsg", "Errore, ritorno alla Homepage");
            response.sendRedirect("./Home.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
