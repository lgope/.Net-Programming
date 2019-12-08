<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePrescribInfo.aspx.cs" Inherits="Hospital_Management.UpdateData.UpdatePrescribInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        
        <asp:GridView ID="PrescribtionGridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
            ShowFooter="true" DataKeyNames="Pers_ID" OnRowCommand="PrescribtionGridView1_RowCommand1" OnRowEditing="PrescribtionGridView1_RowEditing" 
            OnRowCancelingEdit="PrescribtionGridView1_RowCancelingEdit" OnRowUpdating="PrescribtionGridView1_RowUpdating" OnRowDeleting="PrescribtionGridView1_RowDeleting">

            <Columns>
                <asp:TemplateField HeaderText="Doctor Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDoctorName" runat="server" Text='<%# Eval("Doctor_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L1" runat="server" Text='<%# Eval("Doctor_Name") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtDoctorNameFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Date">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDate" runat="server" Text='<%# Eval("Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L2" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtDateFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Patient Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPatient_Name" runat="server" Text='<%# Eval("Patient_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L3" runat="server" Text='<%# Eval("Patient_Name") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtPatient_NameFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Age">
                <EditItemTemplate>
                    <asp:TextBox ID="txtage" runat="server" Text='<%# Eval("Age") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L4" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtAgeFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Blood Pressure">
                <EditItemTemplate>
                    <asp:TextBox ID="txtBlood_Pressure" runat="server" Text='<%# Eval("Blood_Pressure") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L5" runat="server" Text='<%# Eval("Blood_Pressure") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtBlood_PressureFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Pulse Rate">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPulse_Rate" runat="server" Text='<%# Eval("Pulse_Rate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L6" runat="server" Text='<%# Eval("Pulse_Rate") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtPulse_RateFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>


                <asp:TemplateField HeaderText="Patient Problem">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPatient_Problem" runat="server" Text='<%# Eval("Patient_Problem") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L7" runat="server" Text='<%# Eval("Patient_Problem") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtPatient_ProblemFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Medicines">
                <EditItemTemplate>
                    <asp:TextBox ID="txtMedicines" runat="server" Text='<%# Eval("Medicines") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L8" runat="server" Text='<%# Eval("Medicines") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtMedicinesFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Doctor Advice">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDoctor_Advice" runat="server" Text='<%# Eval("Doctor_Advice") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L9" runat="server" Text='<%# Eval("Doctor_Advice") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txtDoctor_AdviceFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Next Date">
                <EditItemTemplate>
                    <asp:TextBox ID="txtNext_Date" runat="server" Text='<%# Eval("Next_Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="L10" runat="server" Text='<%# Eval("Next_Date") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="txNext_DateFooter" runat="server" />
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

            <%-- Theme Properties --%>
            <AlternatingRowStyle BackColor="White" />
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

            <br />
   <asp:Label ID="PresSuccessMessage" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
   <asp:Label ID="PresErrorMessage" Text="" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <a href="../UpdateInfo.aspx">Done!</a>
            
       </div>
    </form>
</body>
</html>
