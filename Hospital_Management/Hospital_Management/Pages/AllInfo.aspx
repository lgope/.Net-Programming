<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AllInfo.aspx.cs" Inherits="Hospital_Management.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="preslbl" runat="server" Text="Label">Insert Pres Info:</asp:Label>

    <table>
        <tr>
            <td>
                Doctor Name:
            </td>
            <td>
                <asp:TextBox ID="txtPrescitionDoctorName" runat="server"></asp:TextBox>
            </td>
            </tr>
        <tr>

            <td>
                Date:
            </td>
            <td>
                <asp:TextBox ID="txtPrescitionDate" runat="server" Width="121px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Patient Name:
            </td>
            <td>
                <asp:TextBox ID="txtPresPatientName" runat="server"></asp:TextBox>
            </td>

            </tr>
        <tr>

            <td>
                Age:
            </td>
            <td>
                <asp:TextBox ID="txtage" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Blood Pressure::
            </td>
            <td>
                <asp:TextBox ID="TextBloodPressure" runat="server"></asp:TextBox>
            </td>

            </tr>
        <tr>
            <td>
                Pulse Rate:
            </td>
            <td>
                <asp:TextBox ID="TextPulseRate" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Patient Problems:
            </td>
            <td>
                <asp:TextBox ID="TextPatientProblems" columns="30" TextMode="multiline" runat="server" />
            </td>

            </tr>
        <tr>
            <td>
                Medicines:
            </td>
            <td>
                <asp:TextBox ID="TextMedicines" columns="30" TextMode="multiline" runat="server" />
            </td>
        </tr>

        <tr>
            <td>
                Doctor Advice:
            </td>
            <td>
                <asp:TextBox ID="TextDoctorAdvice" columns="30" TextMode="multiline" runat="server" />
            </td>

            </tr>
        <tr>
            <td>
                Next Meet Up:
            </td>
            <td>
                <asp:TextBox ID="TextNextMeetUp" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Button ID="btnPresctibtionSubmit" runat="server" Text="Insert" OnClick="btnPrescribtionSubmit_Click" />
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        
    </table>   


    <br />
    <br />
    <table>
        <tr>
            <td>
                Patient ID:
                <br />
            </td>
            <td>
                <asp:TextBox ID="txtPatientID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Patient Name:
            </td>
            <td>
                <asp:TextBox ID="txtPatientName" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Patient Mobile:
            </td>
            <td>
                <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Patient Address:
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Insert" OnClick="btnSubmit_Click" />
            </td>
        </tr>

    </table>




     <br />
    <asp:Label ID="Label8" runat="server" Text="Label">Prescribtion Information:</asp:Label>
    <br />
    <br />
    <asp:GridView ID="PrescriptionGridView1" runat="server" CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="Doctor Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextDoctor_Name" runat="server" Text='<%# Bind("Doctor_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Doctor_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextDate" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Patient Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextPatient_Name1" runat="server" Text='<%# Bind("Patient_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Patient_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Age">
                <EditItemTemplate>
                    <asp:TextBox ID="TextAge4" runat="server" Text='<%# Bind("Age") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Blood Pressure">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBlood_Pressure" runat="server" Text='<%# Bind("Blood_Pressure") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Blood_Pressure") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pulse_Rate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextPulse_Rate" runat="server" Text='<%# Bind("Pulse_Rate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Pulse_Rate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Patient Problem">
                <EditItemTemplate>
                    <asp:TextBox ID="TextPatient_Problem" runat="server" Text='<%# Bind("Patient_Problem") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Patient_Problem") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Medicines">
                <EditItemTemplate>
                    <asp:TextBox ID="TextMedicines" runat="server" Text='<%# Bind("Medicines") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Medicines") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Doctor Advice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextDoctor_Advice9" runat="server" Text='<%# Bind("Doctor_Advice") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Doctor_Advice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Next Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextNext_Date10" runat="server" Text='<%# Bind("Next_Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Next_Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

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
    <br />
    <br />




    <br />
    <asp:Label ID="Label5" runat="server" Text="Label">Patient Information:</asp:Label>
    <asp:GridView ID="UserGridView" CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" >
        <Columns>
            <asp:TemplateField HeaderText="Patient ID">
                
                <ItemTemplate>
                    <asp:Label ID="Patient_IDLabel1" runat="server" Text='<%# Bind("Patient_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Patient Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPatient_Name" runat="server" Text='<%# Bind("Patient_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Patient_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Patient Mobile">
                <EditItemTemplate>
                    <asp:TextBox ID="TextPatient_Mobile" runat="server" Text='<%# Bind("Patient_Mobile") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Patient_Mobile") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Patient Address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextPatient_Address" runat="server" Text='<%# Bind("Patient_Address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Patient_Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>

                
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



    <br />
    <table>
        <tr>
            <td>
                Doctor ID:
            </td>
            <td>
                <asp:TextBox ID="txtDoctorID" runat="server"></asp:TextBox>
            </td>
        </tr>


        <tr>
            <td>
                Doctor Name:
            </td>
            <td>
                <asp:TextBox ID="txtDoctorName" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Doctor Specialiste:
            </td>
            <td>
                <asp:TextBox ID="txtDoctorSpecialist" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                User ID:
            </td>
            <td>
                <asp:TextBox ID="txtPatientID1" runat="server"></asp:TextBox>
            </td>
        </tr>


        <tr>
            <td>
                <asp:Button ID="btnDoctorSubmit" runat="server" Text="Insert" OnClick="btnDoctorSubmit_Click" />
            </td>
        </tr>

    </table>

    <asp:Label ID="Label6" runat="server" Text="Label">Doctor Information:</asp:Label>
    <asp:GridView ID="DoctorGridView"  runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#000CCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        OnPageIndexChanging="DoctorGridView_PageIndexChanging" OnRowCancelingEdit="DoctorGridView_RowCancelingEdit" OnRowDeleting="DoctorGridView_RowDeleting" OnRowEditing="DoctorGridView_RowEditing" OnRowUpdating="DoctorGridView_RowUpdating" Width="496px">
        <Columns>
            <asp:TemplateField HeaderText="Doctor ID">
                <ItemTemplate>
                    <asp:Label ID="DoctorIDLabel1" runat="server" Text='<%# Bind("Doctor_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Doctor Name">
                <EditItemTemplate>
                    <asp:TextBox ID="DoctorNameTextBox1" runat="server" Text='<%# Bind("Doctor_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Doctor_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Doctor Specialist">
                <EditItemTemplate>
                    <asp:TextBox ID="DoctorSpecialistTextBox2" runat="server" Text='<%# Bind("Doctor_Specialist") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Doctor_Specialist") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Patient ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Patient_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Patient_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>

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

    <br />
    <table>
        
        <tr>
            <td>
                Medicine Name:
            </td>
            <td>
                <asp:TextBox ID="txtmedicine_Name" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Medicine Price:
            </td>
            <td>
                <asp:TextBox ID="txtmedicine_Price" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Patient ID:
            </td>
            <td>
                <asp:TextBox ID="txtMedicinePatientID" runat="server"></asp:TextBox>
            </td>
        </tr>

        

        <tr>
            <td>
                
                <asp:Button ID="btnMedicine" runat="server" Text="Insert" OnClick="btnMedicineSubmit_Click" />
            </td>
        </tr>

    </table>

    <br />

    <asp:Label ID="Label7" runat="server" Text="Label">Medicine Information :</asp:Label>

    <asp:GridView ID="MediceneGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:TemplateField HeaderText="Medicine ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("medicine_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("medicine_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Medicine Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("medicine_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("medicine_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Medicine Price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("medicine_Price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("medicine_Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Patient ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Patient_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Patient_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField />
        </Columns>

                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
 
</asp:Content>
