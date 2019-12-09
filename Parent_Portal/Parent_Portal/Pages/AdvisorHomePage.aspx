<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorHomePage.aspx.cs" Inherits="Parent_Portal.Pages.AdvisorHomePage" %>


<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Advisor</title>
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


    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                    <div class="breadcrumb_iner text-center">
                        <div class="breadcrumb_iner_item">
                            <h2>WellCome Sir</h2>
                            <p>Home<span>-<span>Advisor Panel</p>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <!-- breadcrumb start-->


        <section class="contact-section section_padding">
    <div class="container">
      <div class="row">
<form id="form1" runat="server">
        <br />
        <div class="takeId">
            <asp:TextBox ID="idTextBox" style="width:210px; height:38px;" placeholder="Your Id" runat="server"></asp:TextBox>
            <asp:Button ID="IdButton1" CssClass="btn" style="background-color: #ff663b; color:white;" runat="server" Text="Click" OnClick="IdButton1_Click" />
        </div>
        <br />
        <div class="main">

            <div class ="studentList">
                <asp:Label ID="StudentListLabel" runat="server" Visible="false">Your students List</asp:Label>
                <br />
                <asp:GridView ID="studentListGridView" CssClass="col-lg-8 col-md-8 col-sm-12 col-xs-8" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    
                    <AlternatingRowStyle BackColor="White" />
                    
                    <Columns>

                        <asp:TemplateField HeaderText="Students Id">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox" runat="server" Text='<%# Eval("[S_Id]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="S_IdLabel" runat="server" Text='<%# Eval("[S_Id]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Students Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("[S_Name]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="S_NameLabel" runat="server" Text='<%# Eval("[S_Name]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Semester No">
                            <EditItemTemplate>
                                <asp:TextBox ID="S_Sem_NoTextBox" runat="server" Text='<%# Eval("[S_Sem_No]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="S_Sem_NoLabel" runat="server" Text='<%# Eval("[S_Sem_No]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
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


            <%--- Course Register Grid View ---%>
            <div class="CourseRegisters">
                    <asp:Label ID="CourseRegistersLabel" runat="server" Visible="false">Course Registration:</asp:Label>
                <br />
                <asp:TextBox ID="CourseRegistersTextBox" style="width:210px;height:38px;" placeholder="Student Id" runat="server" Visible="false"></asp:TextBox>
                <asp:Button ID="CourseRegistersButton" CssClass="btn" style="background-color: #ff663b;color:white;" runat="server" Visible="false" Text="Click" OnClick="CourseRegistersButton_Click" />
                <br />
                <br />
                
                <asp:GridView ID="CourseRegistrationGridView" CssClass="col-lg-8 col-md-8 col-sm-10 col-xs-8" runat="server" AutoGenerateColumns="False" OnRowCommand="CourseRegistrationGridView_RowCommand"
                    OnRowUpdating="CourseRegistrationGridView_RowUpdating" OnRowDeleting="CourseRegistrationGridView_RowDeleting"
                     OnRowEditing="CourseRegistrationGridView_RowEditing" OnRowCancelingEdit="CourseRegistrationGridView_RowCancelingEdit"
                      DataKeyNames="Cr_Id" ShowHeaderWhenEmpty="True" ShowFooter ="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Course Registers Id">
                            
                            <ItemTemplate>
                                <asp:Label ID="Cr_IdLabel1" runat="server" Text='<%# Eval("Cr_Id") %>'></asp:Label>
                            </ItemTemplate>

                            
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Student Id">
                            <EditItemTemplate>
                                <asp:TextBox ID="S_IdTextBox2" runat="server" Text='<%# Eval("S_Id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("S_Id") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="S_IdTextBox2Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Student Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="S_NameTextBox2" runat="server" Text='<%# Eval("S_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("S_Name") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="S_NameTextBox2Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Course Code">
                            <EditItemTemplate>
                                <asp:TextBox ID="C_CodeTextBox3" runat="server" Text='<%# Eval("C_Code") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("C_Code") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="C_CodeTextBox3Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Course Title">
                            <EditItemTemplate>
                                <asp:TextBox ID="C_TitleTextBox4" runat="server" Text='<%# Eval("C_Title") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("C_Title") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="C_TitleTextBox4Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Credit">
                            <EditItemTemplate>
                                <asp:TextBox ID="CreditTextBox5" runat="server" Text='<%# Eval("Credit") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Credit") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="CreditTextBox5Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Section">
                            <EditItemTemplate>
                                <asp:TextBox ID="SectionTextBox6" runat="server" Text='<%# Eval("Section") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="SectionTextBox6Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Teacher">
                            <EditItemTemplate>
                                <asp:TextBox ID="TeacherTextBox7" runat="server" Text='<%# Eval("Teacher") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Teacher") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="TeacherTextBox7Footer" runat="server" />
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

               <asp:Label ID="crSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
                        <br />
               <asp:Label ID="crErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>
            </div>

            <br />
            <br />
            <br />
            <br />


            <%--- Live Result Grid View ---%>

            <div class="LiveResult col col-lg-6 col-md-6 col-sm-8 col-xs-6">
                <asp:Label ID="ImportResultsLabel" runat="server" Visible="false">Import Results</asp:Label>
                <br />
                <asp:TextBox ID="ImportResultsTextBox" style="width:210px;height:38px;" placeholder="Student Id" runat="server" Visible="false"></asp:TextBox>
                <asp:Button ID="ImportResultsButton" CssClass="btn" style="background-color: #ff663b;color:white;" runat="server" Visible="false" Text="Click" OnClick="ImportResultsButton1_Click" />
                <br />
                <br />

                <asp:GridView ID="LiveResultGridView" CssClass="col-lg-8 col-md-8 col-sm-10 col-xs-8" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCommand="LiveResultGridView_RowCommand"
                    OnRowUpdating="LiveResultGridView_RowUpdating" OnRowDeleting="LiveResultGridView_RowDeleting"
                     OnRowEditing="LiveResultGridView_RowEditing" OnRowCancelingEdit="LiveResultGridView_RowCancelingEdit"
                     ShowFooter="True" CellPadding="4" ForeColor="#333333" GridLines="None"  >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>

                        <asp:TemplateField HeaderText="LR Id">
                            
                            <ItemTemplate>
                                <asp:Label ID="LR_Id_Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>

                            
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Student Id">
                            <EditItemTemplate>
                                <asp:TextBox ID="S_IdTextBox" runat="server" Text='<%# Eval("S_Id") %>'></asp:TextBox>
                            </EditItemTemplate>

                            
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("S_Id") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="S_IdTextBox1Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Student Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("S_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("S_Name") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Courser Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="C_NameTextBox3" runat="server" Text='<%# Eval("C_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("C_Name") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="C_NameTextBox3Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quize Avg">
                            <EditItemTemplate>
                                <asp:TextBox ID="Quize_AvgTextBox4" runat="server" Text='<%# Eval("Quize_Avg") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("Quize_Avg") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="Quize_AvgTextBox4Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Attendance">
                            <EditItemTemplate>
                                <asp:TextBox ID="AttendanceTextBox5" runat="server" Text='<%# Eval("Attendance") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("Attendance") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="AttendanceTextBox5Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Assignment">
                            <EditItemTemplate>
                                <asp:TextBox ID="AssignmentTextBox6" runat="server" Text='<%# Eval("Assignment") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("Assignment") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="AssignmentTextBox6Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Midterm">
                            <EditItemTemplate>
                                <asp:TextBox ID="MidtermTextBox7" runat="server" Text='<%# Eval("Midterm") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("Midterm") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="MidtermTextBox7Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Final">
                            <EditItemTemplate>
                                <asp:TextBox ID="FinalTextBox8" runat="server" Text='<%# Eval("Final") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("Final") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="FinalTextBox8Footer" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Total">
                            <EditItemTemplate>
                                <asp:TextBox ID="TotalTextBox9" runat="server" Text='<%# Eval("Total") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("Total") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="TotalTextBox9Footer" runat="server" />
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
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

                <br />

   <asp:Label ID="lrSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
   <asp:Label ID="lrErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>

            </div>
        </div>
    </form>
          <br />
          <br />

          </div>
    </div>

  </section>

        <br />
        <br />
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