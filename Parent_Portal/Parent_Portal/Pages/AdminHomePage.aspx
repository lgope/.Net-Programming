<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="Parent_Portal.Pages.AdminHomePage1" %>



<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin</title>
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
                                  <a class="navlink" style="color: white" href="HomePage.aspx">Home</a>
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
                                      <a class="dropdown-item" href="AdminHomePage.aspx">Admin Panel</a>
                                  </div>
                              </li>
                              <li class="nav-item">
                                  <a class="nav-link" href="contact.html">Contact</a>
                              </li>
                              <li class="d-none d-lg-block">
                                  <a class="btn_1" href="../SignPage.aspx">Sign Out</a>
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
                            <h2>WellCome Admin</h2>
                            <p>Home<span>/<span>Admin Panel</p>
                        </div>
                    </div>
                </div>
        </div>
    </section>
    <!-- breadcrumb start-->

  <!-- ================ contact section start ================= -->
  <section class="contact-section section_padding">
    <div class="container">
      <div class="row">       
       
          <form id="form1" runat="server">

       <div class="main">
       <div class="Parent_Grid">

           <asp:Label ID="parentInfo" runat="server" Text="Parent & Student Table:"></asp:Label>
    <asp:GridView ID="ParentStudentGridView" CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server"
        AutoGenerateColumns="False" OnRowDeleting="ParentStudentGridView_RowDeleting" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:TemplateField HeaderText="Parent Id">

                <EditItemTemplate>
                    <asp:TextBox ID="P_IdTextBox1" runat="server" Text='<%# Bind("P_Id") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="P_Idlbl" runat="server" Text='<%# Bind("P_Id") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="Parent Name">

                <EditItemTemplate>
                    <asp:TextBox ID="P_NameTextBox2" runat="server" Text='<%# Bind("P_Name") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("P_Name") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="Parent Email">

                <EditItemTemplate>
                    <asp:TextBox ID="P_EmailTextBox3" runat="server" Text='<%# Bind("P_Email") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("P_Email") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Student Id">

                <EditItemTemplate>
                    <asp:TextBox ID="S_IdTextBox4" runat="server" Text='<%# Bind("S_Id") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("S_Id") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="Student Name">
                <EditItemTemplate>
                    <asp:TextBox ID="S_NameTextBox4" runat="server" Text='<%# Bind("S_Name") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Lbl4" runat="server" Text='<%# Bind("S_Name") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="S_Sem_No">

                <EditItemTemplate>
                    <asp:TextBox ID="S_Sem_NoTextBox5" runat="server" Text='<%# Bind("S_Sem_No") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("S_Sem_No") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>

            
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>

        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>


           <br />

   <asp:Label ID="ParentSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
   <asp:Label ID="ParentErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>
       </div>

    <br />
    <br />

            <div class="AdvisorGrid">                
    <asp:Label ID="Label6" runat="server" Text="Advisor List:"></asp:Label>
                <asp:GridView ID="AdvisorGridView"  CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                OnRowCommand="AdvisorGridView_RowCommand" OnRowEditing="AdvisorGridView_RowEditing" OnRowCancelingEdit="AdvisorGridView_RowCancelingEdit"
                    OnRowUpdating="AdvisorGridView_RowUpdating" OnRowDeleting="AdvisorGridView_RowDeleting" DataKeyNames="Id" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Advisor Id">
                <EditItemTemplate>
                    <asp:TextBox ID="A_IdTextBox2" runat="server" Text='<%# Eval("A_Id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="AdvisorLabel" runat="server" Text='<%# Eval("A_Id") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtA_IdFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Advisor Pass">
                <EditItemTemplate>
                    <asp:TextBox ID="A_PassTextBox1" runat="server" Text='<%# Eval("A_Pass") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("A_Pass") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtA_PassFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Advisor Name">
                <EditItemTemplate>
                    <asp:TextBox ID="A_NameTextBox3" runat="server" Text='<%# Eval("A_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("A_Name") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtA_NameFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Advisor Dept">
                <EditItemTemplate>
                    <asp:TextBox ID="A_DeptTextBox4" runat="server" Text='<%# Eval("A_Dept") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("A_Dept") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtA_DeptFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="CRUDImages/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="CRUDImages/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="CRUDImages/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="CRUDImages/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="CRUDImages/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
            </asp:TemplateField>

        </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>

                 <br />
            
   <asp:Label ID="AdvisorSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
   <asp:Label ID="AdvisorErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>
       </div>
            <br />
            <br />

            <div class="AdvisorStudentGrid">
                <asp:Label ID="Label7" runat="server" Text="Assign Student Under a Teacher:"></asp:Label>
                <asp:GridView ID="AdvisorStudentGridView"  CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="Id"
                    OnRowCommand="AdvisorStudentGridView_RowCommand" OnRowEditing="AdvisorStudentGridView_RowEditing"
                     OnRowCancelingEdit="AdvisorStudentGridView_RowCancelingEdit" OnRowDeleting="AdvisorStudentGridView_RowDeleting"
                     OnRowUpdating="AdvisorStudentGridView_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>

                            
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="A_Id">
                            <EditItemTemplate>
                                <asp:TextBox ID="A_IdTextBox" runat="server" Text='<%# Eval("A_Id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("A_Id") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="txtAS_IdFooter" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Student Id">
                            <EditItemTemplate>
                                <asp:TextBox ID="S_IdTextBox" runat="server" Text='<%# Eval("S_Id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("S_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtS_IdFooter" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                  <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="CRUDImages/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="CRUDImages/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="CRUDImages/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="CRUDImages/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="CRUDImages/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
               </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <br />
            
               <asp:Label ID="asSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
                        <br />
               <asp:Label ID="asErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>
             </div>
     </div>
   </form>

        
      </div>
    </div>
  </section>
  <!-- ================ contact section end ================= -->

<!-- footer part start-->
<footer class="footer-area">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-sm-6 col-md-4 col-xl-4">
                <div class="single-footer-widget footer_2">
                    <h4>Newsletter</h4>
                    <p>Stay updated with the latest result of your child.
                    </p>
                    <form action="#">
                        <div class="form-group">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder='Enter email address'
                                    onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Enter email address'">
                                <div class="input-group-append">
                                    <button class="btn btn_1" type="button"><i class="ti-angle-right"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
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
<script src="js/jquery.nice-select.min.js"></script>
<!-- swiper js -->
<script src="js/masonry.pkgd.js"></script>
<!-- particles js -->
<script src="js/owl.carousel.min.js"></script>
<!-- contact js -->
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<script src="js/contact.js"></script>

<!-- slick js -->
<script src="js/slick.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/waypoints.min.js"></script>
<!-- custom js -->
<script src="js/custom.js"></script>
</body>

</html>












<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    
</body>
</html>

