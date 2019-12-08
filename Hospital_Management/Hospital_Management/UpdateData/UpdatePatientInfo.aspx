<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="UpdatePatientInfo.aspx.cs" Inherits="Hospital_Management.WebForm1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    
    
    <br />
    
    
    <%-- User Info Update --%>
    <form id="form1" runat="server">
        <div>
    <asp:Label ID="userInfo" runat="server" Text=""></asp:Label>
    <asp:GridView ID="UserGridView" runat="server" OnRowCommand="UserGridView_RowCommand"  OnRowEditing="UserGridView_RowEditing" 
        OnRowCancelingEdit="UserGridView_RowCancelingEdit" OnRowUpdating="UserGridView_RowUpdating" OnRowDeleting="UserGridView_RowDeleting"
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="Patient_ID" ShowHeaderWhenEmpty="true">
        <Columns>
            <asp:TemplateField HeaderText="Patient ID">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPatientID" Text='<%# Eval("Patient_ID") %>' runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Patient_ID") %>' runat="server"></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtPatientIDFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Patient Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPatientName" runat="server" Text='<%# Eval("Patient_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Patient_Name") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtPatientNameFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Patient_Mobile">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPatientMobile" runat="server" Text='<%# Eval("Patient_Mobile") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Patient_Mobile") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtPatientMobileFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Patient Address">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPatientAddress" runat="server" Text='<%# Eval("Patient_Address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Patient_Address") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtPatientAddressFooter" runat="server" />
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

   <asp:Label ID="PatientSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
   <asp:Label ID="PatientErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>

            <a href="../UpdateInfo.aspx">Done!</a>
            </div>
        </form>

    <%-- Doctor Info Update 
   
        
            <asp:Button ID="DoctorBtn" runat="server" Text="Doctor" OnClick="doctorClick"/>
            <div>
    
            </div>
            
        

    <%-- Medicine Info Update --%>
             <%--

                 
    <asp:Label ID="medicineInfo" runat="server" Text=""></asp:Label>
    <asp:GridView ID="MediceneGridView" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="medicine_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="txtmedicineID" runat="server" Text='<%# Eval("medicine_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("medicine_ID") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtmedicineIDFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="medicine_Name">
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

            <asp:TemplateField HeaderText="medicine_Price">
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
    --%>

    

</body>
</html>
<%-- <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     </asp:Content>  --%>