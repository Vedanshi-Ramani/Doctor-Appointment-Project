<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard_dc_panel.aspx.cs" Inherits="project_doctor_appoitment.Doctor_panel.dashboard_dc_panel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Doctor Dashboard | CareConnect</title>
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

                <h2 class="fw-bold mb-4">Doctor Dashboard</h2>

                <div class="row g-4">

                    <div class="col-md-3">
                        <div class="card border-0 shadow rounded-4 p-4">
                            <h6>Today's Appointments</h6>
                            <h2 class="fw-bold">
                                <asp:Label ID="lblToday" runat="server" Text="0"></asp:Label>
                            </h2>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card border-0 shadow rounded-4 p-4">
                            <h6>Pending</h6>
                            <h2 class="fw-bold">
                                <asp:Label ID="lblPending" runat="server" Text="0"></asp:Label>
                            </h2>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card border-0 shadow rounded-4 p-4">
                            <h6>Approved</h6>
                            <h2 class="fw-bold">
                                <asp:Label ID="lblApproved" runat="server" Text="0"></asp:Label>
                            </h2>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card border-0 shadow rounded-4 p-4">
                            <h6>Rejected</h6>
                            <h2 class="fw-bold">
                                <asp:Label ID="lblRejected" runat="server" Text="0"></asp:Label>
                            </h2>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../js/main.js"></script>
    </body>
    </html>

    </div>

</asp:Content>

