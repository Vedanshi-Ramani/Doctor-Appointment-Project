<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="project_doctor_appoitment.Admin.admin_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
                

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | CareConnect</title>
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
                    <h2 class="fw-bold text-center mb-4">Admin Login</h2>
                    <form>
                        <div class="mb-3">
                            <label for="txtAdminUsername" class="form-label">Username</label>
<%--                            <input type="text" id="txtAdminUsername" name="AdminUsername" class="form-control" placeholder="Enter username" required>--%>
                            <asp:TextBox ID="txt_admin_unm"  runat="server"  name="AdminUsername" class="form-control" placeholder="Enter username" ></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtAdminPassword" class="form-label">Password</label>
<%--                            <input type="password" id="txtAdminPassword" name="AdminPassword" class="form-control" placeholder="Enter password" required>--%>
                            <asp:TextBox ID="txt_admin_pass" runat="server" name="AdminPassword" class="form-control" placeholder="Enter password"></asp:TextBox>
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
    <script src="../js/validation.js"></script>
</body>
</html>

</asp:Content>

