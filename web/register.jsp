<%-- 
    Document   : register
    Created on : Mar 25, 2016, 9:24:40 PM
    Author     : Yu Qiu
--%>

<%@page import="edu.pitt.is1017.spaceinvaders.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <%  
        String userName = "";
        String password = "";
        String firstName = "";
        String lastName = "";
        User user;
        
        if(request.getParameter("btnSubmit") != null){
            if(request.getParameter("txtFirstName") != null){
                if(request.getParameter("txtFirstName") != ""){
                    userName = request.getParameter("txtFirstName");
                }
            }
            
            if(request.getParameter("txtLastName") != null){
                if(request.getParameter("txtLastName") != ""){
                    userName = request.getParameter("txtLastName");
                }
            }
            
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
                user = new User(lastName, firstName, userName, password);
                out.println("<script>alert('Register successfully!');</script>");
                        
                }else{
                    out.println("<script>alert('You must enter your first name, last name, user name and password!');</script>");
                }
        }
        
            
    
    %>
    
    <body>
        <form id=""frmRegister" action="register.jsp" method="post">
              <label for="txtFirstNmae"> First name: </label>&nbsp;<input type="text" id="txtFirstName" name="txtFirstName" value="">      
              <br />
              <label for="txtLastNmae"> Last name: </label>&nbsp;<input type="text" id="txtLastName" name="txtLastName" value="">      
              <br />
              <label for="txtUserNmae"> User name: </label>&nbsp;<input type="text" id="txtUserName" name="txtUserName" value="">      
              <br />
              <label for="txtPassword"> Password: </label>&nbsp;<input type="password" id="txtPassword" name="txtPassword" value="">
              <br />
              <input type="submit" id="btnSubmit" name="btnSubmit" value="Sign up">
              
        </form>
    </body>
</html>
