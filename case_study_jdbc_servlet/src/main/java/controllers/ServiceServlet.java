package controllers;

import model.service.RentalType;
import model.service.Service;
import model.service.ServiceType;
import service.iget_type.IRentalTypeService;
import service.IServiceService;
import service.iget_type.IServiceTypeService;
import service.impl.service_impl.RentalTypeService;
import service.impl.service_impl.ServiceService;
import service.impl.service_impl.ServiceTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
    IServiceService iServiceService = new ServiceService();
    IRentalTypeService iRentalTypeService = new RentalTypeService();
    IServiceTypeService iServiceTypeService = new ServiceTypeService();
    IServiceService service = new ServiceService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
            createNewService(request,response);
                break;
            case "edit":

                break;
            case "delete":
                break;
        }
    }

    private void createNewService(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer serviceId = null;
        String name = request.getParameter("name");
        String serviceCode = request.getParameter("serviceCode");
        String roomStandard = request.getParameter("roomStandard");
        String other = request.getParameter("other");
        Double area = -1.0;
        Double cost = -1.0;
        Double swimmingPoolArea = -1.0;
        Integer maxPeople = -1;
        Integer floorNum = -1;
        Integer rentalTypeId = null;
        Integer serviceTypeId = null ;
        try {
            area = Double.valueOf(request.getParameter("area"));
        } catch (NumberFormatException e){
            e.printStackTrace();
        }
        try {
            cost = Double.valueOf(request.getParameter("cost"));
        } catch (NumberFormatException e){
            e.printStackTrace();
        }
        try {
            maxPeople = Integer.valueOf(request.getParameter("maxPeople"));
        } catch (NumberFormatException e){
            e.printStackTrace();
        }
        try {
            swimmingPoolArea = Double.valueOf(request.getParameter("swimmingPoolArea"));
        } catch (NumberFormatException e){
            e.printStackTrace();
        }
        try {
            floorNum = Integer.valueOf(request.getParameter("floorNum"));
        } catch (NumberFormatException e){
            e.printStackTrace();
        }
        try {
            rentalTypeId = Integer.valueOf(request.getParameter("rentalTypeId"));
        } catch (NumberFormatException e){
            e.printStackTrace();
        }
        try {
            serviceTypeId = Integer.valueOf(request.getParameter("serviceTypeId"));
        } catch (NumberFormatException e){
            e.printStackTrace();
        }
        Service service = new Service(serviceId,serviceCode,name,area,cost,maxPeople,roomStandard,other,swimmingPoolArea,floorNum,rentalTypeId,serviceTypeId);
        Map<String, String> mapCreate = iServiceService.createService(service);
        if (mapCreate.isEmpty()) {
            response.sendRedirect("/service");
        } else {
            List<RentalType> rentalTypes = iRentalTypeService.getRentalType();
            List<ServiceType> serviceTypes = iServiceTypeService.getServiceType();
            request.setAttribute("rentalTypes", rentalTypes);
            request.setAttribute("serviceTypes", serviceTypes);
            request.setAttribute("erro", mapCreate);
            request.getRequestDispatcher("view_furama_resort/service/create.jsp").forward(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request,response);
                break;
            case "edit":

                break;
            case "search":

                break;
            default:
                showListService(request,response);
        }

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<RentalType> rentalTypes = iRentalTypeService.getRentalType();
        List<ServiceType> serviceTypes = iServiceTypeService.getServiceType();
        request.setAttribute("rentalTypes", rentalTypes);
        request.setAttribute("serviceTypes", serviceTypes);
        request.getRequestDispatcher("view_furama_resort/service/create.jsp").forward(request, response);
    }
    private void showListService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> services = service.selectAllService();
        List<RentalType> rentalTypes = iRentalTypeService.getRentalType();
        List<ServiceType> serviceTypes = iServiceTypeService.getServiceType();
        request.setAttribute("rentalTypes", rentalTypes);
        request.setAttribute("serviceTypes", serviceTypes);
        request.setAttribute("service", services);
        try {
            request.getRequestDispatcher("view_furama_resort/service/service.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
