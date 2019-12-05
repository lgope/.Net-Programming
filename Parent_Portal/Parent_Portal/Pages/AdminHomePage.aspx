<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="Parent_Portal.Pages.AdminHomePage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    <form id="form1" runat="server">
        <div class="main">
       <div class="Parent_Grid">
           <asp:Label ID="parentInfo" runat="server" Text="Parent & Student Table:"></asp:Label>
    <asp:GridView ID="ParentStudentGridView" runat="server" AutoGenerateColumns="False" OnRowDeleting="ParentStudentGridView_RowDeleting"
         >
        <Columns>
            <asp:TemplateField HeaderText="Parent Id">
                <EditItemTemplate>
                    <asp:TextBox ID="P_IdTextBox1" runat="server" Text='<%# Bind("P_Id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="P_IdLabel" runat="server" Text='<%# Bind("P_Id") %>'></asp:Label>
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
            <asp:TemplateField HeaderText="Student Name">
                <EditItemTemplate>
                    <asp:TextBox ID="S_NameTextBox4" runat="server" Text='<%# Bind("S_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("S_Name") %>'></asp:Label>
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
                <asp:GridView ID="AdvisorGridView" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                OnRowCommand="AdvisorGridView_RowCommand" OnRowEditing="AdvisorGridView_RowEditing" OnRowCancelingEdit="AdvisorGridView_RowCancelingEdit"
                    OnRowUpdating="AdvisorGridView_RowUpdating" OnRowDeleting="AdvisorGridView_RowDeleting" DataKeyNames="Id">
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
    </asp:GridView>

                 <br />

   <asp:Label ID="AdvisorSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
   <asp:Label ID="AdvisorErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>
       </div>

            </div>

            <br />
            <br />

            <div class="AdvisorStudentGrid">
                <asp:Label ID="Label7" runat="server" Text="Assign Student Under a Teacher:"></asp:Label>
                <asp:GridView ID="AdvisorStudentGridView" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="Id">
                    <Columns>
                        <asp:TemplateField HeaderText="Id">
                            <EditItemTemplate>
                                <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Eval("Id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="txtIdFooter" runat="server" />
                            </FooterTemplate>
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

                        <asp:TemplateField HeaderText="P_Id">
                            <EditItemTemplate>
                                <asp:TextBox ID="P_IdTextBox" runat="server" Text='<%# Eval("P_Id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("P_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtP_IdFooter" runat="server" />
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
            </div>


     </div>
    </form>
</body>
</html>

