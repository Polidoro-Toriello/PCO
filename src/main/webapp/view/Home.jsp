<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.bean.UserBean" %>

<% UserBean utente = (UserBean) session.getAttribute("utente"); %>
<% UserBean manager = (UserBean) session.getAttribute("manager"); %>


<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@100;500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>
<%@include file="./fragment/navbar.jsp" %>
<div class="hero">
    <div class="hero_content">
        <div class="row">
            <div class="col-2">
                <h1>Benvenuti su PCO</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto rerum eos iste aliquam, aliquid
                    odio quae?</p>
            </div>
            <div class="col-2">
                <img src="../images/top_img.png">
            </div>
        </div>
    </div>
</div>
<div class="small-container">
    <div class="categories">
        <div class="row">
            <div class="col-3">
                <img src="../images/GPU.jpg">
            </div>
            <div class="col-3">
                <img src="../images/Intel.jpg">
            </div>
            <div class="col-3">
                <img src="../images/PC.jpg">
            </div>
        </div>
    </div>
</div>
<section class="articoliHome" id="articoliHome">

    <h2 class="title">Ultimi Arrivi</h2>

    <div class="box-container">
        <div class="box">
            <div class="image">
                <img src="../images/NvidiaGpu.jpg" alt="gpu">
            </div>
            <div class="info">
                <h3>Nvidia Rtx 3080</h3>
                <div class="subInfo">
                    <strong class="price">$750.00</strong>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="image">
                <img src="../images/NvidiaGpu.jpg" alt="gpu">
            </div>
            <div class="info">
                <h3>Nvidia Rtx 3080</h3>
                <div class="subInfo">
                    <strong class="price">$750.00</strong>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="image">
                <img src="../images/NvidiaGpu.jpg" alt="gpu">
            </div>
            <div class="info">
                <h3>Nvidia Rtx 3080</h3>
                <div class="subInfo">
                    <strong class="price">$750.00</strong>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="../images/NvidiaGpu.jpg" alt="gpu">
            </div>
            <div class="info">
                <h3>Nvidia Rtx 3080</h3>
                <div class="subInfo">
                    <strong class="price">$750.00</strong>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="image">
                <img src="../images/NvidiaGpu.jpg" alt="gpu">
            </div>
            <div class="info">
                <h3>Nvidia Rtx 3080</h3>
                <div class="subInfo">
                    <strong class="price">$750.00</strong>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="image">
                <img src="../images/PcGaming.jpg" alt="">
            </div>
            <div class="info">
                <h3>Pc da Gaming</h3>
                <div class="subInfo">
                    <strong class="price">$750.00</strong>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="../images/PcGaming.jpg" alt="">
            </div>
            <div class="info">
                <h3>Pc da Gaming</h3>
                <div class="subInfo">
                    <strong class="price">$750.00</strong>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="../images/PcGaming.jpg" alt="">
            </div>
            <div class="info">
                <h3>Pc da Gaming</h3>
                <div class="subInfo">
                    <strong class="price">$750.00</strong>
                </div>
            </div>
        </div>

    </div>
</section>
<div class="offer">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <img class="offer-img" src="../images/NicePng_gaming-computer-png_2167532.png" alt="">
            </div>
            <div class="col-2">
                <p>Exclusively Available on PCO</p>
                <h1>Hp Pavillion Gaming 15</h1>
                <small>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloremque nostrum perspiciatis neque velit beatae maiores saepe ex quia rerum voluptate nihil, quisquam dolor minus voluptatibus, molestiae quis necessitatibus vero.</small>
                <a href="#" class="btn">Acquista</a>
            </div>
        </div>
    </div>
</div>
<div class="brands">
    <div class="small-container">
        <div class="row">
            <div class="col-5">
                <img src="../images/amazonPay.png">
            </div>
            <div class="col-5">
                <img src="../images/paypal.png">
            </div>
            <div class="col-5">
                <img src="../images/maestro.png">
            </div>
            <div class="col-5">
                <img src="../images/applePay.png">
            </div>
        </div>
    </div>
</div>
<small>Copyright@2022 Polidoro-Toriello</small>
</body>
</html>
