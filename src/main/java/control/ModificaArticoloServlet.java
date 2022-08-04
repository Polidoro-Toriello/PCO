package control;

import model.bean.ArticoloBean;
import model.bean.UserBean;
import model.dao.ArticoloDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/modificaarticolo")
public class ModificaArticoloServlet extends HttpServlet {

    private ArticoloDao dao =  new ArticoloDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArticoloBean articolo = new ArticoloBean();
        ArticoloBean articolosessione = (ArticoloBean)session.getAttribute("articolo");
        UserBean userBean = (UserBean) session.getAttribute("manager");
        if(userBean != null && userBean.isAdmin()) {
            try {
                articolo.setNome(req.getParameter("Nome"));
                articolo.setDescrizione(req.getParameter("Descrizione"));
                articolo.setIva(Integer.parseInt(req.getParameter("IVA")));
                articolo.setPrezzo(Float.parseFloat(req.getParameter("Prezzo")));
                articolo.setCategoria(req.getParameter("Categoria"));
                articolo.setQtaDisponibile(Integer.parseInt(req.getParameter("Qta")));
                articolo.setIdArticolo(articolosessione.getIdArticolo());
                if(dao.doModifyArticolo(articolo)){
                    session.setAttribute("alertMsg","Articolo modificato!");
                    session.setAttribute("articolo",articolo);
                    resp.sendRedirect("view/ModificaArticolo.jsp");
                }
            }catch (SQLException e) {
                e.printStackTrace();
                session.setAttribute("alertMsg","Errore nella modifica dell'articolo!");
                resp.sendRedirect("view/ModificaArticolo.jsp");
            }
        }else{
            session.setAttribute("alertMsg","Accesso non effettuato");
            resp.sendRedirect("view/Home.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
