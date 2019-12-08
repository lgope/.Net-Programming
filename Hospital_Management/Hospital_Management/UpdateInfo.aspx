<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateInfo.aspx.cs" Inherits="Hospital_Management.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <asp:LinkButton ID="UserLinkButton" runat="server" href="./UpdateData/UpdateUserInfo" CssClass="btn btn-primary btn-sm">User</asp:LinkButton>
    <asp:LinkButton ID="DoctorLinkButton" runat="server" href="./UpdateData/UpdateDoctorInfo" CssClass="btn btn-primary btn-sm">Doctor</asp:LinkButton>
    <asp:LinkButton ID="MedicineLinkButton" runat="server" href="./UpdateData/UpdateMedicineInfo" CssClass="btn btn-primary btn-sm">Medicine</asp:LinkButton>
    <asp:LinkButton ID="PrescribtionLinkButton" runat="server" href="./UpdateData/UpdatePrescribInfo" CssClass="btn btn-primary btn-sm">Prescribtion</asp:LinkButton>
    <br />
    <br />
    <asp:LinkButton ID="HomeLinkButton1" runat="server" href="./Pages/HomePage" CssClass="btn btn-primary btn-sm">Done</asp:LinkButton>
</asp:Content>
