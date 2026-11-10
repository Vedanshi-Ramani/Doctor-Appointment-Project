<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="project_doctor_appoitment.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <%-- <div id="loader" class="loader-overlay">
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
</asp:Content>

<%--****************** main content ********************--%>



<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">


    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard | CareConnect</title>
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
                    <h4 class="fw-bold mb-4">Admin Panel</h4>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2"><a class="nav-link text-white active" href="dashboard.aspx">Dashboard</a></li>
                        <li class="nav-item mb-2"><a class="nav-link text-white" href="add_doctor.aspx">Add Doctors</a></li>
                        <li class="nav-item mb-2"><a class="nav-link text-white" href="add_specialty.aspx">Add Specialty</a></li>
                        <li class="nav-item mb-2"><a class="nav-link text-white" href="remove_doctor.aspx">Remove Doctors</a></li>
                        <%--                    <li class="nav-item mb-2"><a class="nav-link text-white" href="appointments.aspx">Appointments</a></li>
                    <li class="nav-item mb-2"><a class="nav-link text-white" href="patients.aspx">Patients</a></li>--%>
                        <li class="nav-item mb-2"><a class="nav-link text-white" href="admin_login.aspx">Logout</a></li>
                    </ul>
                </div>
                <div class="col-lg-10 p-4">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <h2 class="fw-bold mb-4">Dashboard</h2>
                    <div class="row g-4">
                        <div class="col-md-3">
                            <div class="card border-0 shadow rounded-4 p-4">
                                <h6>Total Doctors</h6>
                                <h2 class="fw-bold">120</h2>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card border-0 shadow rounded-4 p-4">
                                <h6>Total Patients</h6>
                                <h2 class="fw-bold">1500</h2>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card border-0 shadow rounded-4 p-4">
                                <h6>Today's Appointments</h6>
                                <h2 class="fw-bold">48</h2>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card border-0 shadow rounded-4 p-4">
                                <h6>Revenue</h6>
                                <h2 class="fw-bold">$12k</h2>
                            </div>
                        </div>
                    </div>
                    <div class="card border-0 shadow rounded-4 p-4 mt-4">
                        <h5>Charts Placeholder</h5>
                        <div class="bg-light rounded-4 p-5 text-center text-muted">Analytics chart will appear here later.</div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../js/main.js"></script>
    </body>
    </html>

</asp:Content>




