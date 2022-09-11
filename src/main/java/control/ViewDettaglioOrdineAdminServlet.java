package control;

import model.bean.ComposizioneOrdine;
import model.dao.ComposizioneDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/dettaglioordineadmin")
public class ViewDettaglioOrdineAdminServlet extends HttpServlet {

    private ComposizioneDao dao = new ComposizioneDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int idordine = Integer.parseInt(req.getParameter("idordine"));
        ArrayList<ComposizioneOrdine> articoli = new ArrayList<>();
        try {
            articoli = (ArrayList<ComposizioneOrdine>) dao.doRetrieveByIdOrdine(idordine);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        session.setAttribute("dettaglioordinead",articoli);
        resp.sendRedirect("view/DettaglioOrdineAdmin.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
