<%-- 
    Document   : index
    Created on : Mar 25, 2016, 8:49:22 PM
    Author     : Yu Qiu
--%>

<%@page import="edu.pitt.is1017.spaceinvaders.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alien Invasion</title>
    </head>
    <%  
        String userName = "";
        String password = "";
        User user;
        if(request.getParameter("btnSubmit") != null){
            if(request.getParameter("txtUserName") != null){
                if(request.getParameter("txtUserName") != ""){
                    userName = request.getParameter("txtUserName");
                }
            }
        
            if(request.getParameter("txtPassword") != null){
                if(request.getParameter("txtPassword") != ""){
                    password = request.getParameter("txtPassword");
                }
            }
        
        
            if(!userName.equals("") && !password.equals("")){
                user = new User(userName, password);
                response.sendRedirect("game.jsp");
                        
                }else{
                 out.println("<script>alert('You must enter both user name and password!');</script>");
                }
        }
        
            
    
    %>
    <body>
        <form id=""frmLogin" action="index.jsp" method="post">
              <label for="txtUserNmae"> User name: </label>&nbsp;<input type="text" id="txtUserName" name="txtUserName" value="">      
              <br />
              <label for="txtPassword"> Password: </label>&nbsp;<input type="password" id="txtPassword" name="txtPassword" value="">
              <br />
              <input type="submit" id="btnSubmit" name="btnSubmit" value="Login">
              <a href="register.jsp">Register</a>
        </form>
    </body>
</html>
