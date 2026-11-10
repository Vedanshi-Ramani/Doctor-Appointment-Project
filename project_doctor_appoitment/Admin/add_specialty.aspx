<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="add_specialty.aspx.cs" Inherits="project_doctor_appoitment.Admin.add_specialty" %>

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
        <title>Add Doctor | CareConnect</title>
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
                    <h2 class="fw-bold mb-4">Add Doctor</h2>
                    <div class="card border-0 shadow rounded-4 p-4">
                        <form>
                            <div class="row g-3">

                                <div class="col-12">
                                    <label for="picture" class="form-label">Image</label>
                                    <%--                                    <textarea id="txtSpecialty" name="Description" class="form-control" rows="4" placeholder="Enter description" required></textarea>--%>
                                    <asp:FileUpload ID="flpimg" runat="server" class="form-control" />
                                </div>

                                <div class="col-12">
                                    <label for="txtSpecialty" class="form-label">Specialty</label>
                                    <%--                                    <textarea id="txtSpecialty" name="Description" class="form-control" rows="4" placeholder="Enter description" required></textarea>--%>
                                    <asp:TextBox ID="txtSpecialty" runat="server" class="form-control" placeholder="Enter Specility"></asp:TextBox>
                                </div>

                                <div class="col-12">
                                    <label for="txtDescription" class="form-label">Description</label>
                                    <%--                                    <textarea id="txtDescription" name="Description" class="form-control" rows="4" placeholder="Enter description" required></textarea>--%>
                                    <asp:TextBox ID="txtDescription" runat="server" class="form-control" Rows="4" placeholder="Enter description"></asp:TextBox>
                                </div>
                                <div class="col-12">
                                    <%--                                    <button type="submit" class="btn btn-primary rounded-pill px-4">Submit</button>--%>
                                    <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary rounded-pill px-4" OnClick="Button1_Click" />
                                </div>
                            </div>
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

