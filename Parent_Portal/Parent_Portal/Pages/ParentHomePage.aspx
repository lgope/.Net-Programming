<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParentHomePage.aspx.cs" Inherits="Parent_Portal.Pages.ParentHomePage" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Etrain</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <!--::header part start::-->
    <header class="main_menu single_page_menu">
      <div class="container">
          <div class="row align-items-center">
              <div class="col-lg-12">
                  <nav class="navbar navbar-expand-lg navbar-light">
                      
                      <button class="navbar-toggler" type="button" data-toggle="collapse"
                          data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                          aria-expanded="false" aria-label="Toggle navigation">
                          <span class="navbar-toggler-icon"></span>
                      </button>

                      <div class="collapse navbar-collapse main-menu-item justify-content-end"
                          id="navbarSupportedContent">
                          <ul class="navbar-nav align-items-center">
                              <li class="nav-item active">
                                  <a class="nav-link" style="color:white" href="HomePage.aspx">Home</a>
                              </li>
                              <li class="nav-item">
                                  <a class="nav-link" href="about.html">About</a>
                              </li>                              
                              
                              <li class="nav-item dropdown">
                                  <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                      Pages
                                  </a>
                                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                      <a class="dropdown-item" href="ParentHomePage.aspx">Portal</a>
                                      <a class="dropdown-item" href="#">Elements</a>
                                  </div>
                              </li>
                              <li class="nav-item">
                                  <a class="nav-link" href="contact.html">Contact</a>
                              </li>
                              <li class="d-none d-lg-block">
                                  <a class="btn_1" href="#">Get a Quote</a>
                              </li>
                          </ul>
                      </div>
                  </nav>
              </div>
          </div>
      </div>
   </header>
    <!-- Header part end-->

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                    <div class="breadcrumb_iner text-center">
                        <div class="breadcrumb_iner_item">
                            <h2>Parent Portal</h2>
                            <p>Home<span>-</span>Portal</p>
                        </div>
                    </div>
                </div>
        </div>
    </section>
    <!-- breadcrumb start-->
   <!--================Blog Area =================-->
   <section class="blog_area single-post-area section_padding">
      <div class="container">
              
              
              
               <form id="form1" runat="server">
        <div class="mainDiv">

            <%-- Registered Course List --%>
            <div class="RegisterCourseList">

                
                <br />
                <asp:TextBox ID="RegisterCourseListTextBox" style="width:210px;height:38px;" placeholder="Student Id" runat="server"></asp:TextBox>
                <asp:Button ID="RegisterCourseListButton" CssClass="btn" style="background-color: #ff663b;color:white; " runat="server" Text="Click" OnClick="RegisterCourseListButton_Click"/>
                <br />
                <br />

                <asp:Label ID="crLabel" runat="server" Visible="false" Text="Register Course List"></asp:Label>
                <asp:GridView ID="RegisterCourseListGridView1" CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Student Id">
                            
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("S_Id") %>'></asp:Label>
                            </ItemTemplate>                           
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Student Name">
                            
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("S_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Course Code">
                            
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("C_Code") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Course Title">
                            
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("C_Title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Credit">
                           
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Credit") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Section">
                           
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Section") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Teacher">
                           
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Teacher") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#ff663b" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>

            <br />
            <br />
            <div class="LiveResult">

                <asp:Label ID="LiveResultLabel" runat="server" Visible="false" Text="Live Results"></asp:Label>

                <asp:GridView ID="LiveResultGridView1" CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                    <Columns>
                        <asp:TemplateField HeaderText="Student Id">                            
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("S_Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Student Name">                            
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("S_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Courser Name">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("C_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quize Avg">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Quize_Avg") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Attendance">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Attendance") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Assignment">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Assignment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Midterm">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Midterm") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Final">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Final") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Total">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#ff663b" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>

            </div>

        </div>
    </form>
                              
               
               
            </div>
            <div class="col-lg-4">
               <div class="blog_right_sidebar">
                     
               </div>
            </div>
   </section>
   <!--================Blog Area end =================-->

   <!-- footer part start-->
   <footer class="footer-area">
         <div class="container">
             <div class="row justify-content-between">
             
                 <div class="col-xl-3 col-sm-6 col-md-4">
                     <div class="single-footer-widget footer_2">
                         <h4>Contact us</h4>
                         <div class="contact_info">
                            <p><span> Address :</span> Shukrabad, Dhanmondi 32, Dhaka </p>
                            <p><span> Phone :</span> +2 36 265 (8060)</p>
                            <p><span> Email : </span>admin@diu.com </p>
                         </div>
                     </div>
                 </div>
             </div>
 
         </div>
         <div class="container-fluid">
             <div class="row">
                 <div class="col-lg-12">
                     <div class="copyright_part_text text-center">
                         <div class="row">
                             <div class="col-lg-12">
                                 <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </footer>
     <!-- footer part end-->
 
     <!-- jquery plugins here-->
     <!-- jquery -->
     <script src="js/jquery-1.12.1.min.js"></script>
     <!-- popper js -->
     <script src="js/popper.min.js"></script>
     <!-- bootstrap js -->
     <script src="js/bootstrap.min.js"></script>
     <!-- easing js -->
     <script src="js/jquery.magnific-popup.js"></script>
     <!-- swiper js -->
     <script src="js/swiper.min.js"></script>
     <!-- swiper js -->
     <script src="js/masonry.pkgd.js"></script>
     <!-- particles js -->
     <script src="js/owl.carousel.min.js"></script>
     <script src="js/jquery.nice-select.min.js"></script>
     <!-- swiper js -->
     <script src="js/slick.min.js"></script>
     <script src="js/jquery.counterup.min.js"></script>
     <script src="js/waypoints.min.js"></script>
     <!-- custom js -->
     <script src="js/custom.js"></script>
 </body>
 
 </html>



