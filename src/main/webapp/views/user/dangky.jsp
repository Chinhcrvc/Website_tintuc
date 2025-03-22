<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
    <link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/registers.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    />
  </head>
  <body>
    <div class="register-container">
      <h3>Register</h3>
      <form action="/Assignment_NVC/sendmail/Assignment" method="post">
        <div class="input-group">
          <i class="fa-sharp fa-regular fa-envelope"></i>
          <input type="text"  name="email" placeholder="Email" class="form-control" />
        </div>
        <br />
        <div>
          <input type="submit" value="Register" class="form-control-register" />
        </div>
      </form>
    </div>
  </body>
</html>
