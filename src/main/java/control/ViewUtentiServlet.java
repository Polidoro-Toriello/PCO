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
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/visualizzautenti")
public class ViewUtentiServlet extends HttpServlet {

    private UserDao dao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        ArrayList<UserBean> utenti = null;
        try {
            utenti = (ArrayList<UserBean>) dao.doRetrieveNormalUsers();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(utenti == null)
        {
            session.setAttribute("alertMsg","Errore nella ricerca degli utenti");
            resp.sendRedirect("view/HomeAdmin.jsp");
        }

        session.setAttribute("utenti",utenti);
        resp.sendRedirect("view/ViewUtenti.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
