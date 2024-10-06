<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="gulwade_voting_system.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>login</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
    body{
/*    background: radial-gradient(circle, rgba(238,174,202,1) 7%, rgba(26,190,242,1) 73%);*/

background-image: linear-gradient(
  55deg,
  hsl(240deg 100% 34%) 0%,
  hsl(225deg 100% 41%) 6%,
  hsl(220deg 100% 46%) 10%,
  hsl(216deg 100% 50%) 14%,
  hsl(212deg 100% 50%) 17%,
  hsl(208deg 100% 50%) 20%,
  hsl(204deg 100% 50%) 24%,
  hsl(198deg 100% 47%) 29%,
  hsl(189deg 100% 42%) 36%,
  hsl(177deg 100% 39%) 44%,
  hsl(164deg 100% 41%) 54%,
  hsl(152deg 100% 44%) 67%,
  hsl(141deg 100% 46%) 82%,
  hsl(127deg 95% 49%) 100%
);
}

</style>
</head>
<body>
    <form id="form1" runat="server">
<section class="vh-100 gradient-custom" style="background: linear-gradient(to right, #0066ff, #33cc33);">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card text-white" style="border-radius: 1rem; background-color: #0056b3; box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.3);">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <!-- Title -->
              <h2 class="fw-bold mb-4 text-uppercase" style="letter-spacing: 1px;">Student Voting Login</h2>
              
              <!-- Logo with white background and border -->
              <div class="mb-4" style="background-color: white; padding: 5px; border-radius: 35px; display: inline-block;">
                <img src="images/LOOGO_-_Copy-removebg-preview.png" alt="School Logo" class="img-fluid" style="background-color: white; max-width: 150px; border-radius: 8px;">
              </div>

              <!-- ID Input -->
              <div class="form-outline form-white mb-4">
                <asp:TextBox class="form-control form-control-lg" ID="TextBox2" runat="server" placeholder="Enter your Student ID"></asp:TextBox>
                <label class="form-label" for="typeEmailX" style="color: #ccc;">Student ID</label>
              </div>

              <!-- Password Input -->
              <div class="form-outline form-white mb-4">
                <asp:TextBox type="password" class="form-control form-control-lg" ID="TextBox3" runat="server" placeholder="Enter your Password"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="Password" class="form-label" style="color: #ccc;"></asp:Label>
              </div>

              <!-- Login Button -->
              <asp:Button class="btn btn-lg px-5" type="submit" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" 
                style="background-color: #33cc33; border: none; border-radius: 5px; font-weight: bold; letter-spacing: 1px;"/>

              <!-- Social Media Links -->
              <div class="d-flex justify-content-center text-center mt-4 pt-1">
                <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                <a href="#!" class="text-white mx-4"><i class="fab fa-twitter fa-lg"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
              </div>

              <!-- Forgot Password Link -->
              <p class="mt-3">
                <a href="seeresults.aspx" class=" btn btn-lg btn-info text-black" style="text-decoration: none;">Fiiri Codadka</a>
              </p>

            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>



    </form>


    
        <script>

            document.getElementById("forgotPassword").onclick = function () {
                // Redirect to the desired page, for example, "reset-password.html"
                window.location.href = "seeresults.aspx";
            };

            window.history.forward();
            function noBack() {
                window.history.forward();
            }

        </script>
</body>
</html>
