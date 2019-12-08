<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorHomePage.aspx.cs" Inherits="Parent_Portal.Pages.AdvisorHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <div class="takeId">
            <asp:TextBox ID="idTextBox" placeholder="Your Id" runat="server"></asp:TextBox><asp:Button ID="IdButton1" runat="server" Text="Click" OnClick="IdButton1_Click" />
        </div>
        <br />
        <div class="main">

            <div class ="studentList">
                <asp:Label ID="StudentListLabel" runat="server" Visible="false">Your students List</asp:Label>
                <br />
                <asp:GridView ID="studentListGridView" runat="server" AutoGenerateColumns="False">
                    
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
                </asp:GridView>
            </div>

            <br />
            <br />


            <%--- Course Register Grid View ---%>
            <div class="CourseRegisters">
                    <asp:Label ID="CourseRegistersLabel" runat="server" Visible="false">Course Registration:</asp:Label>
                <br />
                <asp:TextBox ID="CourseRegistersTextBox" placeholder="Student Id" runat="server" Visible="false"></asp:TextBox><asp:Button ID="CourseRegistersButton" runat="server" Visible="false" Text="Click" OnClick="CourseRegistersButton_Click" />
                <br />
                <br />
                
                <asp:GridView ID="CourseRegistrationGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="CourseRegistrationGridView_RowCommand"
                    OnRowUpdating="CourseRegistrationGridView_RowUpdating" OnRowDeleting="CourseRegistrationGridView_RowDeleting"
                     OnRowEditing="CourseRegistrationGridView_RowEditing" OnRowCancelingEdit="CourseRegistrationGridView_RowCancelingEdit"
                      DataKeyNames="Cr_Id" ShowHeaderWhenEmpty="true" ShowFooter ="true">
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

            <div class="LiveResult col col-lg-8 col-md-8 col-sm-8 col-xs-8">
                <asp:Label ID="ImportResultsLabel" runat="server" Visible="false">Import Results</asp:Label>
                <br />
                <asp:TextBox ID="ImportResultsTextBox" placeholder="Student Id" runat="server" Visible="false"></asp:TextBox><asp:Button ID="ImportResultsButton" runat="server" Visible="false" Text="Click" OnClick="ImportResultsButton1_Click" />
                <br />
                <br />

                <asp:GridView ID="LiveResultGridView"  runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCommand="LiveResultGridView_RowCommand"
                    OnRowUpdating="LiveResultGridView_RowUpdating" OnRowDeleting="LiveResultGridView_RowDeleting"
                     OnRowEditing="LiveResultGridView_RowEditing" OnRowCancelingEdit="LiveResultGridView_RowCancelingEdit"
                     ShowFooter="true"  >
                    <Columns>

                        <asp:TemplateField HeaderText="LR Id">
                            
                            <ItemTemplate>
                                <asp:Label ID="LR_Id_Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>

                            
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Student Id">
                        <%--     <EditItemTemplate>
                                <asp:TextBox ID="S_IdTextBox" runat="server" Text='<%# Eval("S_Id") %>'></asp:TextBox>
                            </EditItemTemplate> --%>

                            
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("S_Id") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="S_IdTextBox1Footer" runat="server" />
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


                        <asp:TemplateField HeaderText="Courser Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="C_NameTextBox3" runat="server" Text='<%# Eval("C_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("C_Name") %>'></asp:Label>
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
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Quize_Avg") %>'></asp:Label>
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
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Attendance") %>'></asp:Label>
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
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Assignment") %>'></asp:Label>
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
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Midterm") %>'></asp:Label>
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
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("Final") %>'></asp:Label>
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
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("Total") %>'></asp:Label>
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
                </asp:GridView>

                <br />

   <asp:Label ID="lrSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
   <asp:Label ID="lrErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>

            </div>

        </div>
    </form>
</body>
</html>
