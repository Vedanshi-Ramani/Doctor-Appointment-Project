<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="remove_doctor.aspx.cs" Inherits="project_doctor_appoitment.Admin.remove_doctor" %>
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
    <title>Delete Doctor | CareConnect</title>
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
                <h2 class="fw-bold mb-4">Delete Doctor</h2>
                <div class="card border-0 shadow rounded-4 p-4">
                    <div class="table-responsive">
                        <%--<table class="table align-middle">
                            <thead>
                                <tr><th>Doctor</th><th>Specialization</th><th>Action</th></tr>
                            </thead>
                            <tbody>
                                <tr><td>Dr. Ayesha Noor</td><td>Neurology</td><td><button class="btn btn-sm btn-danger rounded-pill" data-bs-toggle="modal" data-bs-target="#deleteDoctorModal">Delete</button></td></tr>
                            </tbody>
                        </table>--%>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="Doctor_Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Doc_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Specility">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Spec_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Doc_Id") %>' CommandName="cmddel">Remove</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteDoctorModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content rounded-4">
                <div class="modal-body text-center p-4">
                    <h5 class="fw-bold">Confirm Delete</h5>
                    <p class="text-muted">Are you sure you want to delete this doctor?</p>
                    <button class="btn btn-secondary me-2" data-bs-dismiss="modal">Cancel</button>
                    <button class="btn btn-danger">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/main.js"></script>
</body>
</html>

</asp:Content>

