<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="appointments_dc-panel.aspx.cs" Inherits="project_doctor_appoitment.Doctor_panel.appointments_dc_panel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <%--<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Doctor Appointment System</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://unpkg.com/aos@2.3.7/dist/aos.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/responsive.css">
    </head>
    <body>
        <div id="loader" class="loader-overlay">
            <div class="spinner-border text-primary" role="status">
            </div>
        </div>
        <header class="sticky-top">
            <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
                <div class="container">
                    <a class="navbar-brand fw-bold text-primary" href="../index.html"><i class="bi bi-hospital me-2"></i>CareConnect</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto align-items-lg-center">
                            <li class="nav-item"><a class="nav-link active" href="../index.aspx">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="../about.aspx">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="../search_doctor.aspx">Search Doctor</a></li>
                            <li class="nav-item"><a class="nav-link" href="../contact.aspx">Contact</a></li>
                            <li class="nav-item"><a class="btn btn-primary rounded-pill ms-lg-3" href="../login.aspx">Login</a></li>
                            <li class="nav-item"><a class="btn btn-outline-primary rounded-pill ms-2" href="../registration.aspx">Register</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>--%>


    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Doctor Appointments | CareConnect</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/responsive.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 bg-dark text-white min-vh-100 p-4">
                    <h4 class="fw-bold mb-4">Doctor Panel</h4>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2"><a class="nav-link text-white active" href="dashboard_dc_panel.aspx">Dashboard</a></li>
                        <li class="nav-item mb-2"><a class="nav-link text-white" href="appointments_dc-panel.aspx">Appointments</a></li>
                        <li class="nav-item mb-2"><a class="nav-link text-white" href="login_dc_panel.aspx">Logout</a></li>
                    </ul>
                </div>
                <div class="col-lg-10 p-4">
                    <h2 class="fw-bold mb-4">Appointments</h2>
                    <asp:Label ID="lblMessage" runat="server"
                        CssClass="d-block mb-3"></asp:Label>

                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server"
                            AutoGenerateColumns="False"
                            DataKeyNames="Appointment_Id"
                            CssClass="table table-bordered table-hover align-middle"
                            HeaderStyle-CssClass="table-dark"
                            OnRowCommand="GridView1_RowCommand"
                            EmptyDataText="No appointments found.">

                            <Columns>

                                <asp:BoundField DataField="Patient_Name"
                                    HeaderText="Patient Name" />

                                <asp:BoundField DataField="Mobile"
                                    HeaderText="Mobile" />

                                <asp:BoundField DataField="Appointment_Date"
                                    HeaderText="Date"
                                    DataFormatString="{0:dd-MM-yyyy}" />

                                <asp:BoundField DataField="Time_Slot"
                                    HeaderText="Time" />

                                <asp:BoundField DataField="Booking_Status"
                                    HeaderText="Status" />


                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>

                                        <asp:Button ID="btnApprove" runat="server"
                                            Text="Approve"
                                            CommandName="ApproveAppointment"
                                            CommandArgument='<%# Eval("Appointment_Id") %>'
                                            CssClass="btn btn-success btn-sm me-1"
                                            CausesValidation="false" Visible='<%# Eval("Booking_Status").ToString() == "Confirmed" %>'/>

                                        <asp:Button ID="btnReject" runat="server"
                                            Text="Reject"
                                            CommandName="RejectAppointment"
                                            CommandArgument='<%# Eval("Appointment_Id") %>'
                                            CssClass="btn btn-danger btn-sm"
                                            CausesValidation="false" />

                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="../js/main.js"></script>
    </body>
    </html>

    </div>

</asp:Content>

