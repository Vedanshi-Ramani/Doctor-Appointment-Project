<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login_dc_panel.aspx.cs" Inherits="project_doctor_appoitment.Doctor_panel.login_dc_panel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
                
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
    <title>Doctor Login | CareConnect</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/responsive.css">
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-5">
                <div class="card border-0 shadow rounded-4 p-4">
                    <h2 class="fw-bold text-center mb-4">Doctor Login</h2>

                    <form>
                        <div class="mb-3">
                            <label for="txtDoctorLoginUsername" class="form-label">Username</label>
<%--                            <input type="text" id="txtDoctorLoginUsername" name="DoctorUsername" class="form-control" placeholder="Enter username" required>--%>
                            <asp:TextBox ID="txtdcnm" runat="server" name="DoctorUsername" class="form-control" placeholder="Enter username"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="txtDoctorLoginPassword" class="form-label">Password</label>
<%--                            <input type="password" id="txtDoctorLoginPassword" name="DoctorPassword" class="form-control" placeholder="Enter password" required>--%>
                            <asp:TextBox ID="txtpass" runat="server" name="DoctorPassword" class="form-control" placeholder="Enter password"></asp:TextBox>
                        </div>

<%--                        <button type="button" class="btn btn-primary w-100 rounded-pill">Login</button>--%>
                        <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-primary w-100 rounded-pill" OnClick="Button1_Click"/>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/main.js"></script>
</body>
</html>

</asp:Content>

