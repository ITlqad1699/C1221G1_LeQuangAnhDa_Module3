<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/17/2022
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <style>
    img {
      width: auto;
      height: 500px;
    }

    body {
      font-family: "Arial Rounded MT Bold";
      background-image: url("https://cdn.pixabay.com/photo/2019/08/08/06/33/pool-4392060_960_720.jpg");
    }
  </style>
</head>
<body>
<div class="container border" style="width: 100%">
  <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4  bg-white border-bottom box-shadow my-0 "
       style="background: #046056;">
    <h5 class="my-0 mr-md-auto font-weight-normal"><img
            src="https://phuongviethcm.com/wp-content/uploads/2019/07/FURAMA.png"
            style="width: 60px; height: 60px"></h5>
    <a class="btn btn-outline-primary" href="#">Sign up</a>
  </div>
  <nav class="navbar navbar-expand-lg p-2 my-0 fixed col " style="background: darkolivegreen;">
    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link text-white" href="index.jsp">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/employee">Employee</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/customer">Customer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/service">Service</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/contract">Contract</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0" method="get">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>
  <div class="body row my-2">
    <div class="left-sidebar col-3 my-2" style="background: darkgray">
      <p class="text-white">KHU NGH??? D?????NG ?????NG C???P TH??? GI???I, FURAMA ???? N???NG, N???I TI???NG L?? KHU NGH??? D?????NG ???M TH???C T???I VI???T NAM.</p>
    </div>
    <div class="main-content col-6 my-2 ">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="d-block w-100"
                 src="https://pix10.agoda.net/hotelImages/109/10953/10953_16030216470040397599.jpg?ca=6&ce=1&s=1024x768"
                 alt="First slide">
          </div>
          <div class="carousel-item">
            <img class="d-block w-100"
                 src="https://storage-dev.atastay.com/Furama-Resort-Dannang-lobby-Luxury-hotel-booking-ATASTAY.jpg-ae581ffd-9e84-47d6-9232-00016c7aee9d"
                 alt="Second slide">
          </div>
          <div class="carousel-item">
            <img class="d-block w-100"
                 src="https://danangfantasticity.com/wp-content/uploads/2021/02/Furama-resort-danang-103-105-vo-nguyen-giap-da-nang-fly-cam.jpg"
                 alt="Third slide">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
    <div class="right-sidebar col-3 my-2" style="background: darkgray">
      <h1 class="text-white">C??C LO???I PH??NG</h1>
      <p class="text-white">
        Khu ngh??? d?????ng c?? 196 ph??ng ???????c thi???t k??? theo phong c??ch truy???n th???ng Vi???t Nam k???t h???p v???i phong c??ch
        Ph??p, 2 t??a nh?? 4 t???ng c?? h?????ng nh??n ra bi???n, nh??n ra h??? b??i trong xanh v?? nh???ng khu v?????n nhi???t ?????i xanh
        t????i m??t. Ngo??i ra, khu ngh??? d?????ng Furama c??n cung c???p ca??c li????u ph??p spa, ph??ng x??ng h??i ??????t, ph??ng
        x??ng h??i kh??, di??ch vu?? ma??t-xa ca??nh h???? b??i, c??c d???ch v??? th??? thao d?????i n?????c v?? ca??c l????p t????p yoga v??
        Tha??i C????c Quy????n tr??n b??i bi???n.</p>
    </div>
  </div>
  <div class="footer row" style="background: #ADDCFF">
    <div class="col " >
      <p class="text-white">KHU NGH??? D?????NG ?????NG C???P TH??? GI???I, FURAMA ???? N???NG, N???I TI???NG L?? KHU NGH??? D?????NG ???M TH???C T???I VI???T NAM.</p>
    </div>
  </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
