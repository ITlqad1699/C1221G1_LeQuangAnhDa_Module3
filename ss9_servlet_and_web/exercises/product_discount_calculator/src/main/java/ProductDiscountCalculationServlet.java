import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculationServlet", urlPatterns = "/change")
public class ProductDiscountCalculationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double amount = price*discount*0.01;
        double finalPrice = price-amount;
        request.setAttribute("product_description", description);
        request.setAttribute("amount", amount);
        request.setAttribute("final_price", finalPrice);
        request.getRequestDispatcher("/result_final.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
