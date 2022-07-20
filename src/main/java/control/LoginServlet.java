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
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao dao = new UserDao();
    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
         doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            UserBean user = new UserBean();
            user.setUsername(request.getParameter("Username"));
            user.setPassword(request.getParameter("Password"));
            user = dao.doRetrieveUtente(user);
            if (user!=null) {
                if (user.isAdmin())
                    session.setAttribute("manager", user);
                else
                    session.setAttribute("utente", user);
                response.sendRedirect("view/Home.jsp");
            } else {
                session.setAttribute("alertMsg", "Email o password inserita non è valida");
                response.sendRedirect("view/LoginPage.jsp");
            }
        } catch (Throwable e) {
            session.setAttribute("alertMsg", "Errore inaspettato, ritorno alla Homepage");
            response.sendRedirect("view/Home.jsp");
        }
    }
}
