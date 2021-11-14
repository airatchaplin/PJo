<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Главная</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/main.css">
    <style>
        .cssSlider {
            display: block;
            position: relative;
            width: 100%;
            overflow: hidden;
        }

        .cssSlider .slides {
            overflow: hidden;
            overflow: hidden;
            width: 100%;
            height: 45vmin;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .cssSlider .slides > li {
            width: 100%;
            height: 45vmin;
            position: absolute;
            z-index: 1;
            overflow: hidden;
        }

        .cssSlider .slides > li > img {
            width: 100%;
            height: auto;
        }

        /*
        .cssSlider .slides > li:first-child:not(:target) {
            z-index: 1;
            -webkit-transform: translateY(0%);
                    transform: translateY(0%);
        }
        */
        .cssSlider .thumbnails {
            display: block;
            position: relative;
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .cssSlider .thumbnails > li {
            float: left;
            width: 20%;
        }

        .cssSlider .thumbnails > li > a {
            display: block;
        }

        .cssSlider .thumbnails > li > a > img {
            width: 100%;
            height: auto;
        }

        .cssSlider .slides li:target {
            z-index: 3;
            -webkit-animation: slide 1s 1;
        }

        .cssSlider .slides li:not(:target) {
            -webkit-animation: hidden 1s 1;
        }

        @-webkit-keyframes slide {
            0% {
                -webkit-transform: translateX(-100%);
                transform: translateX(-100%);
            }
            100% {
                -webkit-transform: translateX(0%);
                transform: translateX(0%);
            }
        }

        @keyframes slide {
            0% {
                -webkit-transform: translateX(-100%);
                transform: translateX(-100%);
            }
            100% {
                -webkit-transform: translateX(0%);
                transform: translateX(0%);
            }
        }

        @-webkit-keyframes hidden {
            0% {
                z-index: 2;
                -webkit-transform: translateX(0%);
                transform: translateX(0%);
            }
            100% {
                z-index: 2;
                -webkit-transform: translateX(100%);
                transform: translateX(100%);
            }
        }

        @keyframes hidden {
            0% {
                z-index: 2;
                -webkit-transform: translateX(0%);
                transform: translateX(0%);
            }
            100% {
                z-index: 2;
                -webkit-transform: translateX(100%);
                transform: translateX(100%);
            }
        }
    </style>
</head>
<body style="margin: 1px">
<jsp:include page="../nav/nav_first.jsp"></jsp:include>

<h1 style="text-align: center;
    margin-left: 20%;
    margin-right: 20%;">PROFIST</h1>
<p style="text-align: center;
    margin-left: 20%;
    margin-right: 20%;">это система управления взаимоотношениями с клиентами компании, которая
    позволяет автоматизировать все рутинные процессы, упорядочить и систематизировать обработку информации о клиентах,
    улучшить качество обслуживания, использовать маркетинговые инструменты более эффективно.</p>
<div style="
    margin-left: 20%;
    margin-right: 20%;">
    <h3>Приемущества</h3>
    <ul>
        <li>Качество продукта</li>
        <li>Поддержка программного продукта</li>
        <li>Простой и удобный интерфейс</li>
    </ul>
</div>

<h3 style="margin-left: 20%;
    margin-right: 20%;">Изображения</h3>
<div class="image" style="width: 59%;
    margin-left: 20%;padding: 10px;
    box-shadow: 0 0 5px;    margin-top: 30px;">

    <div class="cssSlider">
        <ul class="slides">
            <li id="slide1"><img src="../../resources/icon/1.png" alt=""/></li>
            <li id="slide2"><img src="../../resources/icon/2.png" alt=""/></li>
            <li id="slide3"><img src="../../resources/icon/3.png" alt=""/></li>
            <li id="slide5"><img src="../../resources/icon/5.png" alt=""/></li>
            <li id="slide6"><img src="../../resources/icon/6.png" alt=""/></li>
        </ul>
        <ul class="thumbnails">
            <li><a href="#slide1"><img src="../../resources/icon/1.png"/></a></li>
            <li><a href="#slide2"><img src="../../resources/icon/2.png"/></a></li>
            <li><a href="#slide3"><img src="../../resources/icon/3.png"/></a></li>
            <li><a href="#slide5"><img src="../../resources/icon/5.png"/></a></li>
            <li><a href="#slide6"><img src="../../resources/icon/6.png"/></a></li>
        </ul>
    </div>
</div>


<div style="
    margin-left: 20%;
    margin-right: 20%;">
    <h3>Видео</h3>
    <video style="
    width: 100%;
    height: 100%;
    box-shadow: 0 0 5px;" controls width="400" height="300">
        <source src="../../resources/icon/PROFIST.mp4" type="video/mp4"><!-- MP4 для Safari, IE9, iPhone, iPad, Android, и Windows Phone 7 -->
    </video>
</div>
<div class="formObr" style="text-align: center;
    margin-left: 20%;
    margin-right: 20%;
    margin-top: 30px;    margin-bottom: 30px;
    box-shadow: 0 0 5px;">
    <h4>Форма обратной связи</h4>
    <div class="user-box">
        <input style="margin: 10px;width: 90%;" class="input-login" type="text" name="username"
               placeholder="Введите имя" required="">
    </div>
    <div class="user-box">
        <input style="margin: 10px;width: 90%;" class="input-login" type="email" name="password"
               placeholder="Введите email" required="">
    </div>
    <div class="user-box">
        <input style="margin: 10px;width: 90%;" class="input-login" type="text" name="password"
               placeholder="Введите сообщение" required="">
    </div>
    <button style="width: 120px;margin-bottom: 10px;background: #83a4c1;" class="button-login">Отправить</button>

</div>

</body>
</html>