<%-- 
    Document   : game
    Created on : Mar 25, 2016, 9:24:51 PM
    Author     : Yu Qiu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game</title>
        <link rel="shortcut icon" href="">
        <link href="assets/css/main.css" rel="stylesheet" type="text/css"/>   
        <link rel="stylesheet" href="assets/css/main.css" rel="stylesheet" type="text/css"/> 
        <script src="assets/js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script>
            
            var TOP_MARGIN = 15;
            var LEFT_MARGIN = 15;
            $bullet = null;
            $alien = null;
            $ship = null;
            var bulletInterval = null;
            var BULLET_WIDTH = 23;
            var BULLET_HEIGHT = 33;
            var curBulletID = 1;
            var fireBullets = [];
            var screenWidth = 0;
            var screenHeight = 0;
            
            $(document).ready(function(){
                screenWidth = $(document).width();
                screenHeight = $ (document).height();
                $ship = $('#ship');
                $ship.css('top',(screenHeight - $ship.height() - 30) + "px");
                $ship.css('left',(screenWidth/2 - $ship.width()/2) + "px"); 
                $bullet = $("#bullet");
                $alien = $("#alien");
                
                $(window).resize(function(){
                    screenWidth = $(document).width();
                    screenHeight = $ (document).height();
                    initElement();
                });
                
                initElement();
                // $bulletInterval = setInterval(moveBullet, 1000);
                $(document).keydown(function(e){
                    createBullet();
                    moveShip(e);
                    if(e.keyCode == 32){
                        moveAlien(e);
                        e.preventDefault;
                        bulletInterval = setInterval(moveBullet, 500);
                    }
                
                
                });
                
                
            });
            
            
            
            fuction initElement(){
                $alien = $('#alien');
                $ship = $('#ship');
                
                $alien.css("top", TOP_MARGIN + "px");
                $alien.css("left", (screenWidth / 2 + $alien.width()/2) + "px");
                
                $ship.css("top", (screenHeight - $ship.height() - TOP_MARGIN) + "px");
                $ship.css("left", (screenWidth / 2 + $ship.width()/2) + "px");
            }
            function moveShip(e){
                switch (e.which){
                    case 32:
                        createBullet();
                        break;
                    case 37:
                        var pos = $ship.position();
                        $ship.css('left',(pos.left - 10) + 'px');
                        break;
                    case 39:
                        var pos = $ship.position();
                        $ship.css('left',(pos.left + 10) + 'px');
                        break;
                    default:
                        return;
                }
            }
            
            function createBullet(){
                $bulletObj = $('<img>');
                $bulletObjc.attr({
                    "id" : "bullet_" + curBulletID,
                    "src" : "assets/images/bullet.jpg"
                });
                                
                var initBulletX = $ship.position().left + $ship.width()/2 - BULLET_WIDTH/2;
                var initBulletY = $ship.position().top - BULLET_HEIGHT;
                $bulletObj.css({
                    "position" : "absolute",
                    "width" : BULLET_WIDTH + "px",
                    "height" : BULLET_HEIGHT + "px",
                    "top" : initBulletY + "px",
                    "left" : initBulletX + "px"
                });
                
                $('body').append($bulletObj);
                
                var bullet = {
                    "bulletID" : curBulletID,
                    "intervalID" : 0,
                    "bulletObj" : $bulletObj
                };
                
                curBulletID++;
                firedBullets.push(bullet);
                bullet.intervalID = setInterval(moveBullet, 100, bullet);
            }
            
            fuction moveBullet(bullet){
                $fireBullet = $('#bullet_' + bullet.bulletID);
                var posY = $firedBullet.position().top;
                var newPosY = posY - 10;
                if(newPosY > 5){
                    $firedBullet.css("top", newPosY + "px");
                    
                }else{
                    clearInterval(bullet.intervalID);
                    $firedBullet.remove();
                    firedBullets.shift();
                    
                }
            }
            
            function saveAllienPosition(pos){
                var url = "ws/wsalienwrite";
                
                var coords = {
                    "x": pos.left;
                    "y" : pos.top;
                }
                $.post(url, coords, funtion(data){
                    
                });
            }
            
            
            function saveScore(gameID, score){
                var url = "ws/ws_savescore?gameID=" + gameID + "&score=" + score;
                var par = {
                    "gameID" : gameID;
                    "score" : score
                };
                $.post(url, par, funcion(data){
                    
                })
            }
            
            
            function moveAlien(e){
                swich(e.which){
                    case 37:
                        var pos = $alien.position();
                        $alien.css("left",(pos.left - 10) + 'px');
                    break;
                    
                    case 38:
                        console.log("Up");
                    break;
                    
                    case 39:
                        var pos = $alien.position();
                        $alien.css("right",(pos.left + 10) + 'px');
                        
                    break;
                    
                    case 40:
                        console.log("Down");
                    break;
                        
                }
                saveAlienPosition($alient.position());
            }
            
            function moveBullet(){
                var pos = $bullet.position();
                $bullet.css("top", (pos.top - 10) + "px");
                if(pos.top < 0){
                    clearInterval(bulletInterval);
                }
            }
            
            $(window).upload(function(){
                return "goodbye";
            })
        </script>
        
    </head>
    <body>
       
        <img src="assets.images/alien.png" id="alien" alt=""/>
        <img src="assets.images/bullet.jpg" id="bullet" alt=""/>
        <img src="assets.images/ship.jpg" id="ship" alt=""/>
    </body>
</html>
