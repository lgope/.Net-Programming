<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="UpdateDoctorInfo.aspx.cs" Inherits="Hospital_Management.UpdateData.UpdateDoctorInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    <form id="form1" runat="server">
       <div>
           <asp:Label ID="doctorInfo" runat="server" Text=""></asp:Label>
    <asp:GridView ID="DoctorGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="DoctorGridView_RowCommand" 
        OnRowEditing="DoctorGridView_RowEditing" OnRowCancelingEdit="DoctorGridView_RowCancelingEdit" OnRowUpdating="DoctorGridView_RowUpdating" 
        OnRowDeleting="DoctorGridView_RowDeleting"
         BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ShowFooter="true" 
                          DataKeyNames="Doctor_ID" ShowHeaderWhenEmpty="true" >
        <Columns>
            <asp:TemplateField HeaderText="Doctor ID">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDoctorID" runat="server" Text='<%# Eval("Doctor_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L1" runat="server" Text='<%# Eval("Doctor_ID") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtDoctorIDFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Doctor Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDoctorName" runat="server" Text='<%# Eval("Doctor_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="DoctorName" runat="server" Text='<%# Eval("Doctor_Name") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtDoctorNameFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Doctor Specialist">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDoctorSpecialist" runat="server" Text='<%# Eval("Doctor_Specialist") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L2" runat="server" Text='<%# Eval("Doctor_Specialist") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtDoctorSpecialistFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Patient ID">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPatientID" runat="server" Text='<%# Eval("Patient_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L3" runat="server" Text='<%# Eval("Patient_ID") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtPatientIDFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

             <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/Images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>

        </Columns>

                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />

    </asp:GridView>


           <br />

   <asp:Label ID="DoctorSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
   <asp:Label ID="DoctorErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>

            <a href="../UpdateInfo.aspx">Done!</a>

       </div>
    </form>
</body>
</html>