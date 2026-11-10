<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="add_doctor.aspx.cs" Inherits="project_doctor_appoitment.Admin.add_doctor" %>

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
        Add Doctor | CareConnect</title>
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
                    <h4 class="fw-bold mb-4">Admin Paneldmin Panel</h4>
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
                                <div class="col-md-6">
                                    <label for="txtDoctorImage" class="form-label">Doctor Image</label>
                                    <%--                                <input type="file" id="txtDoctorImage" name="DoctorImage" class="form-control" required>--%>
                                    <asp:FileUpload ID="flpimg" runat="server" class="form-control" />
                                </div>

                                <div class="col-md-6">
                                    <label for="txtDoctorName" class="form-label">Doctor Name</label>
                                    <%--                                <input type="text" id="txtDoctorName" name="DoctorName" class="form-control" placeholder="Enter doctor name" required>--%>
                                    <asp:TextBox ID="txtdcnm" class="form-control" placeholder="Enter doctor name" runat="server"></asp:TextBox>

                                </div>

                                <div class="col-md-6">
                                    <label for="txtUsername" class="form-label">Username</label>
                                    <%--                                <input type="text" id="txtUsername" name="Username" class="form-control" placeholder="Enter username" required>--%>
                                    <asp:TextBox ID="txtdcunm" runat="server" class="form-control" placeholder="Enter username"></asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <label for="txtPassword" class="form-label">Password</label>
                                    <%--                                <input type="password" id="txtPassword" name="Password" class="form-control" placeholder="Enter password" required>--%>
                                    <asp:TextBox ID="txtdcpass" runat="server" class="form-control" placeholder="Enter password"></asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <label for="ddlSpecialization" class="form-label">Specialization</label>
                                    <%--                                <select id="ddlSpecialization" name="Specialization" class="form-select" required><option value="">Select</option><option>Cardiology</option><option>Dermatology</option><option>Neurology</option></select>--%>
                                    <asp:DropDownList ID="drpsepc" runat="server" class="form-select" required></asp:DropDownList>
                                </div>

                                <div class="col-md-6">
                                    <label for="txtExperience" class="form-label">Experience</label>
                                    <%--                                    <input type="number" id="txtExperience" name="Experience" class="form-control" placeholder="Enter years" required>--%>
                                    <asp:TextBox ID="txtexp" runat="server" class="form-control" placeholder="Enter years"></asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <label for="txtHospital" class="form-label">Hospital</label>
                                    <%--                                    <input type="text" id="txtHospital" name="Hospital" class="form-control" placeholder="Enter hospital" required>--%>
                                    <asp:TextBox ID="txthos" runat="server" class="form-control" placeholder="Enter hospital"></asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <label for="txtAddress" class="form-label">Address</label>
                                    <%--                                    <input type="text" id="txtAddress" name="Degree" class="form-control" placeholder="Enter Address" required>--%>
                                    <asp:TextBox ID="txtadd" runat="server" class="form-control" placeholder="Enter Address"></asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <label for="txtLanguage" class="form-label">Language</label>
                                    <%--                                    <input type="text" id="txtLanguage" name="Degree" class="form-control" placeholder="Enter degree" required>--%>
                                    <asp:TextBox ID="txtlang" runat="server" class="form-control" placeholder="Enter Language"></asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <label for="txtDegree" class="form-label">Degree</label>
                                    <%--                                    <input type="text" id="txtDegree" name="Degree" class="form-control" placeholder="Enter degree" required>--%>
                                    <asp:TextBox ID="txtdegree" runat="server" class="form-control" placeholder="Enter degree"></asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <label for="txtFee" class="form-label">Fee</label>
                                    <%--                                    <input type="number" id="txtFee" name="Fee" class="form-control" placeholder="Enter fee" required>--%>
                                    <asp:TextBox ID="txtfee" runat="server" class="form-control" placeholder="Enter fee"></asp:TextBox>
                                </div>

                                <%-- <div class="col-md-6">
                                    <label for="txtTimeSlots" class="form-label">Available Time Slots</label>                               <input type="text" id="txtTimeSlots" name="TimeSlots" class="form-control" placeholder="e.g. 10:00 AM, 02:00 PM" required>
                                    <asp:DropDownList ID="drptime" runat="server" class="form-control" placeholder="e.g. 10:00 AM"></asp:DropDownList>
                                </div>--%>

                                <div class="col-12">
                                    <label for="txtCertificate" class="form-label">Certificate</label>
                                    <%--                                    <textarea id="txtDescription" name="Description" class="form-control" rows="4" placeholder="Enter description" required></textarea>--%>
                                    <asp:TextBox ID="txtcerti" class="form-control" Rows="4" placeholder="Enter description" runat="server"></asp:TextBox>
                                </div>

                                <div class="col-12">
                                    <label for="txtDescription" class="form-label">achivment</label>
                                    <%--                                    <textarea id="txtDescription" name="Description" class="form-control" rows="4" placeholder="Enter description" required></textarea>--%>
                                    <asp:TextBox ID="txtachivement" class="form-control" Rows="4" placeholder="Enter description" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-12">
                                    <%--                                    <button type="submit" class="btn btn-primary rounded-pill px-4">Submit</button>--%>
                                    <asp:Button ID="Button1" runat="server" Text="submit" class="btn btn-primary rounded-pill px-4" OnClick="Button1_Click" />
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

