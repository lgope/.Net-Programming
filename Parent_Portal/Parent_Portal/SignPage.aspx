<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignPage.aspx.cs" Inherits="Parent_Portal.SignInUp.index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign In | Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="./SignInUp/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="./SignInUp/css/style.css">
</head>
<body>

    <div class="main">
        <form  runat="server">
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        

                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>                              
                                <asp:TextBox ID="ParentName" name="name" placeholder="Your Name" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <asp:TextBox ID="ParentEmail" type="email" name="email" placeholder="Your Email" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <asp:TextBox ID="ParentPass" type="password" name="pass" placeholder="Password" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <asp:TextBox type="password" name="re_pass" ID="ParenteE_pass" placeholder="Repeat your password" runat="server"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox type="text" name="name" ID="StudentID" placeholder="Student ID" runat="server"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox type="text" name="name" ID="StudentName" placeholder="Student Name" runat="server"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox type="text" name="name" ID="StudentSemNo" placeholder="Semester No" runat="server"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>

                            <div class="form-group form-button">                                
                                <asp:Button ID="signupButton" name="signup" class="form-submit" runat="server" Text="Register" OnClick="signupButton_Click" />
                            </div>
                            
                       
                    </div>
                    <div class="signup-image">
                        <figure><img src="./SignInUp/images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="#" class="signup-image-link">I am already member</a>
                        <a href="./Pages/HomePage.aspx" class="signup-image-link">Not Now</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="./SignInUp/images/signin-image.jpg" alt="sing up image"></figure>
                        <a href="#" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign up</h2>

                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox type="text" name="user_name" ID="user_email" placeholder="Your Email" runat="server"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <asp:TextBox type="password" name="user_pass" ID="user_pass" placeholder="Password" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>

                            <div class="form-group form-button">
                                <asp:Button type="submit" name="signin" ID="signin" class="form-submit" runat="server" Text="Log in" OnClick="signin_Click" />
                            </div>

                        

                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
      </form>

    </div>

    <!-- JS -->
    <script src="./SignInUp/vendor/jquery/jquery.min.js"></script>
    <script src="./SignInUp/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
