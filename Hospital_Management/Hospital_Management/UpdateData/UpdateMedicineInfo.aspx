<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="UpdateMedicineInfo.aspx.cs" Inherits="Hospital_Management.UpdateData.UpdateMedicineInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>

    <form id="form1" runat="server">
        <div>

            <asp:Label ID="medicineInfo" runat="server" Text=""></asp:Label>
    <asp:GridView ID="MediceneGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="MediceneGridView_RowCommand" OnRowEditing="MediceneGridView_RowEditing" 
        OnRowCancelingEdit="MediceneGridView_RowCancelingEdit" OnRowUpdating="MediceneGridView_RowUpdating" OnRowDeleting="MediceneGridView_RowDeleting"
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ShowFooter="true" 
                          DataKeyNames="medicine_ID" ShowHeaderWhenEmpty="true">
        <Columns>

            <asp:TemplateField HeaderText="Medicine Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtmedicineName" runat="server" Text='<%# Eval("medicine_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("medicine_Name") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtmedicineNameFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Medicine Price">
                <EditItemTemplate>
                    <asp:TextBox ID="txtmedicinePrice" runat="server" Text='<%# Eval("medicine_Price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("medicine_Price") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtmedicinePriceFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="User ID">
                <EditItemTemplate>
                    <asp:TextBox ID="txtUserID" runat="server" Text='<%# Eval("User_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("User_ID") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtUserIDFooter" runat="server" />
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

   <asp:Label ID="MedicineSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
   <asp:Label ID="MedicineErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>

            <a href="../UpdateInfo.aspx">Done!</a>
            </div>
    </form>
    
</body>
</html>