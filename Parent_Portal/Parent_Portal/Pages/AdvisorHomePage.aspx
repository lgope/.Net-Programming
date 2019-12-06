<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorHomePage.aspx.cs" Inherits="Parent_Portal.Pages.AdvisorHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">

            <div class ="studentList">
                <asp:Label ID="Label1" runat="server" Text="Your students List"></asp:Label>
                <asp:GridView ID="studentListGridView" runat="server" AutoGenerateColumns="False">
                    <Columns>

                        <asp:TemplateField HeaderText="Students Id">
                            <EditItemTemplate>
                                <asp:TextBox ID="S_IdTextBox" runat="server" Text='<%# Bind("[S_Id]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="S_IdLabel" runat="server" Text='<%# Bind("[S_Id]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Students Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="S_NameTextBox" runat="server" Text='<%# Bind("[S_Name]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="S_NameLabel" runat="server" Text='<%# Bind("[S_Name]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Semester No">
                            <EditItemTemplate>
                                <asp:TextBox ID="S_Sem_NoTextBox" runat="server" Text='<%# Bind("[S_Sem_No]") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="S_Sem_NoLabel" runat="server" Text='<%# Bind("[S_Sem_No]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>


        </div>
    </form>
</body>
</html>
