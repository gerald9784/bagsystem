<%@ page language="java" contentType="text/html" errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      type="text/css"
      rel="stylesheet"
      href="css/materialize.css"
      media="screen,projection"
    />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <style>
      body{
        overflow: hidden;
      }
      .s12{ position: absolute;}
      .row{margin-bottom: 0;}
    </style>
    <title>BagSystem</title>
  </head>
  <body onload="toggle()">
    <!-- <%-- <nav><nav> --%> -->
      <!-- <header class="blue-grey darken-1 white-text pulse"></header> -->
      <header >
        <div class="row center blue-grey darken-1 white-text" style="padding-bottom: 5px;">
          <div id="login" class="col s6">Login</div>
          <div id="signup" class="col s6">Signup</div>
        </div>
        <!-- Login -->
      </header>

      <div class="row">

    <!-- Login -->
    <div class="col9 "  style="padding-left:30%;padding-top:4%">
      <div id="login_flow" class="col s12 m6">
        <div class="card blue-grey darken-1">
          <div class="card-content white-text">
            <span class="card-title">Login</span>

            <form action="login" method="post">
              <label for="username">Username</label><input type="text" name="username" id="username">
              <label for="password">Password</label><input type="password" name="password" id="password">

      
              <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                <i class="material-icons right">login</i>
              </button>
            </form>

          </div>      
        </div>
      </div>

      <div id="signup_flow" class="col s12 m6">
        <div class="card blue-grey darken-1">
          <div class="card-content white-text">
            <span class="card-title">Signup</span>
    
            <form action="signup" method="post">
              <label for="first">First Name</label><input type="text" name="firstName" id="first">
              <label for="last">Last Name</label><input type="text" name="lastName" id="last">
              <label for="username">Username</label><input type="text" name="username" id="username">
              <label for="password">Password</label><input type="password" name="password" id="password">
              <label for="confirm">Confirm Password</label><input type="password" name="confirm" id="confirm">
    
              <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                <i class="material-icons right">signup</i>
              </button>
            </form>
          </div>
        </div>
      </div>

    </div>

  </div>

    <%
      if(request.getParameter("message")!= null){
        out.println(request.getParameter("message"));
      }
    %>
    <script type="text/javascript" src="js/auth.js"></script>
    <script type="text/javascript" src="js/materialize.js"></script>
  </body>
</html>
