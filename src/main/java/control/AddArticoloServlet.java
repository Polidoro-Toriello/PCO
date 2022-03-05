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
@WebServlet("/addArticolo")
public class AddArticoloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArticoloBean articolo = new ArticoloBean();
        UserBean userBean = (UserBean) session.getAttribute("manager");
        if(userBean != null && userBean.isAdmin()) {
            try {
                articolo.setNome(req.getParameter("Nome"));
                articolo.setDescrizione(req.getParameter("Descrizione"));
                articolo.setIva(Integer.parseInt(req.getParameter("IVA")));
                articolo.setPrezzo(Float.parseFloat(req.getParameter("Prezzo")));
                articolo.setCategoria(req.getParameter("Categoria"));
                articolo.setQtaDisponibile(Integer.parseInt(req.getParameter("Qta")));
                if(ArticoloDao.doInsertArticolo(articolo)){
                    session.setAttribute("alertMsg","ProdottoInserito");
                    resp.sendRedirect("view/AddArticolo.jsp");
                }
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
