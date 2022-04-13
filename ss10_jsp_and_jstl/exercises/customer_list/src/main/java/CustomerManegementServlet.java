import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "CustomerManegementServlet",urlPatterns = "/customer")
public class CustomerManegementServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer(1, "John", "20/11/2010", "Hanoi","https://bloganh.net/wp-content/uploads/2021/03/chup-anh-dep-anh-sang-min.jpg",false,7));
        customerList.add(new Customer(2, "Bill", "20/11/2010", "Danang","https://1.bp.blogspot.com/-1F0txd6CTXk/XyjEn1_2atI/AAAAAAAAiX0/2X1yKYprbxEAPvrNA4VoX_nuv8nawCSuQCNcBGAsYHQ/d/a5a84b393a0778e047f87c79478481e7.jpg",true,8));
        customerList.add(new Customer(3, "Alex", "20/11/2010", "Saigon","http://khoahocphattrien.vn/Images/Uploaded/Share/2016/12/20/Nhung-buc-anh-dep-nhat-2016-chia-se-tren-Flickr_4.jpg",true,6));
        customerList.add(new Customer(4, "Adam", "20/11/2010", "Beijin","https://bloganh.net/wp-content/uploads/2021/03/chup-anh-dep-anh-sang-min.jpg",false,5));
        customerList.add(new Customer(5, "Sophia", "20/11/2010", "Miami","http://khoahocphattrien.vn/Images/Uploaded/Share/2016/12/20/Nhung-buc-anh-dep-nhat-2016-chia-se-tren-Flickr_4.jpg",true,3));
        request.setAttribute("list_customer",customerList);
        request.getRequestDispatcher("/customer_display.jsp").forward(request,response);
    }
}
