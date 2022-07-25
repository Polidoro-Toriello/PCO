<%@ page import="java.util.Collection" %>
<%@ page import="model.bean.ArticoloBean" %>
<%@ page import="model.dao.ArticoloDao" %><%--
  Created by IntelliJ IDEA.
  User: G.TORIELLO
  Date: 06/03/2022
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/igorlino/elevatezoom-plus@1.2.3/src/jquery.ez-plus.js"></script>
    <link rel="stylesheet" href="../style.css">
    <script src="${pageContext.request.contextPath}/js/jquery.zoom.js"></script>
    <title>Title</title>
</head>
<body>
    <img src="../immagini/RTX_3090_TI1.jpg" class="photo" id="zoom_04" width="500px" height="500px">
<script>
    $("#zoom_04").ezPlus();

</script>
</body>
</html>
