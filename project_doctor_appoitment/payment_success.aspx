<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="payment_success.aspx.cs" Inherits="project_doctor_appoitment.payment_success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">

<%--                *********       home page       ***************--%>
<%--                <main>--%>
        <!-- Hero Section -->
       <%-- <section class="hero-section py-5">
            <div class="container">
                <div class="row align-items-center g-5">
                    <div class="col-lg-7" data-aos="fade-right">
                        <span class="badge rounded-pill bg-primary-subtle text-primary px-3 py-2 mb-3">Trusted Online Doctor Booking</span>
                        <h1 class="display-5 fw-bold mb-3">Book appointments with top doctors in minutes.</h1>
                        <p class="lead text-muted mb-4">
                            Modern, secure, and simple digital healthcare booking for patients, doctors, and administrators.</p>
                        <div class="d-flex flex-wrap gap-3">
                            <a href="doctor-search.html" class="btn btn-primary btn-lg rounded-pill px-4">Search Doctor</a> <a href="about.html" class="btn btn-outline-primary btn-lg rounded-pill px-4">Learn More</a>
                        </div>
                    </div>
                    <div class="col-lg-5" data-aos="fade-left">
                        <div class="hero-card p-4 rounded-4 shadow-lg">
                            <img src="https://images.unsplash.com/photo-1576091160550-2173dba999ef?auto=format&fit=crop&w=900&q=80" class="img-fluid rounded-4" alt="Doctor Consultation">
                        </div>
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- About Section -->
        <%--<section class="py-5 bg-white">
            <div class="container">
                <div class="row align-items-center g-5">
                    <div class="col-lg-6" data-aos="fade-up">
                        <img src="https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=crop&w=900&q=80" class="img-fluid rounded-4 shadow" alt="Medical Team">
                    </div>
                    <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
                        <h2 class="fw-bold mb-3">Why patients choose CareConnect</h2>
                        <p class="text-muted">
                            We provide a fast and elegant online platform for scheduling consultations with experienced doctors across multiple specialties.</p>
                        <ul class="list-unstyled mt-4">
                            <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i>Verified doctors and hospitals</li>
                            <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i>Easy appointment booking</li>
                            <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i>Fast response and digital records</li>
                        </ul>
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- Top Doctors -->
        
    <%--<div class="col-sm-6 col-lg-3" data-aos="fade-up">
                        <div class="card text-center border-0 shadow-sm rounded-4 h-100">
                            <div class="card-body">
                                <i class="bi bi-heart-pulse display-5 text-primary"></i>
                                <h5 class="mt-3">Cardiology</h5>
                                <p class="text-muted small">
                                    Heart and vascular care</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3" data-aos="fade-up" data-aos-delay="100">
                        <div class="card text-center border-0 shadow-sm rounded-4 h-100">
                            <div class="card-body">
                                <i class="bi bi-lungs display-5 text-primary"></i>
                                <h5 class="mt-3">Pulmonology</h5>
                                <p class="text-muted small">
                                    Respiratory expert care</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
                        <div class="card text-center border-0 shadow-sm rounded-4 h-100">
                            <div class="card-body">
                                <i class="bi bi-bandaid display-5 text-primary"></i>
                                <h5 class="mt-3">Dermatology</h5>
                                <p class="text-muted small">
                                    Skin and hair treatment</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                        <div class="card text-center border-0 shadow-sm rounded-4 h-100">
                            <div class="card-body">
                                <i class="bi bi-brain display-5 text-primary"></i>
                                <h5 class="mt-3">Neurology</h5>
                                <p class="text-muted small">
                                    Brain and nervous system</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- How It Works -->
        <%--<section class="py-5 bg-light">
            <div class="container">
                <div class="section-heading text-center mb-5" data-aos="fade-up">
                    <h2 class="fw-bold">How it Works</h2>
                    <p class="text-muted">
                        A simple three-step process to get care.</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4" data-aos="fade-up">
                        <div class="card border-0 shadow-sm rounded-4 h-100 text-center p-4">
                            <div class="icon-box bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3">
                                1</div>
                            <h5>Search Doctor</h5>
                            <p class="text-muted">
                                Find doctors by specialization, city, fee, and experience.</p>
                        </div>
                    </div>
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                        <div class="card border-0 shadow-sm rounded-4 h-100 text-center p-4">
                            <div class="icon-box bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3">
                                2</div>
                            <h5>Book Appointment</h5>
                            <p class="text-muted">
                                Select a convenient slot and provide patient details.</p>
                        </div>
                    </div>
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                        <div class="card border-0 shadow-sm rounded-4 h-100 text-center p-4">
                            <div class="icon-box bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3">
                                3</div>
                            <h5>Make Payment</h5>
                            <p class="text-muted">
                                Complete the secure payment and receive your confirmation.</p>
                        </div>
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- Testimonials -->
        <%--<section class="py-5">
            <div class="container">
                <div class="section-heading text-center mb-5" data-aos="fade-up">
                    <h2 class="fw-bold">Patient Testimonials</h2>
                    <p class="text-muted">
                        What patients say about us.</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4" data-aos="fade-up">
                        <div class="card border-0 shadow-sm rounded-4 h-100">
                            <div class="card-body">
                                <p class="text-muted">
                                    “The booking experience was smooth and professional. I booked my consultation in minutes.”</p>
                                <div class="d-flex align-items-center mt-3">
                                    <i class="bi bi-person-circle fs-3 text-primary me-2"></i>
                                    <div>
                                        <h6 class="mb-0">Rimsha Q.</h6>
                                        <small class="text-muted">Patient</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                        <div class="card border-0 shadow-sm rounded-4 h-100">
                            <div class="card-body">
                                <p class="text-muted">
                                    “Very clean interface and easy navigation. I loved the doctor profiles.”</p>
                                <div class="d-flex align-items-center mt-3">
                                    <i class="bi bi-person-circle fs-3 text-primary me-2"></i>
                                    <div>
                                        <h6 class="mb-0">Hammad S.</h6>
                                        <small class="text-muted">Patient</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                        <div class="card border-0 shadow-sm rounded-4 h-100">
                            <div class="card-body">
                                <p class="text-muted">
                                    “The platform helps our clinic manage appointments professionally.”</p>
                                <div class="d-flex align-items-center mt-3">
                                    <i class="bi bi-person-circle fs-3 text-primary me-2"></i>
                                    <div>
                                        <h6 class="mb-0">Dr. Mehwish A.</h6>
                                        <small class="text-muted">Doctor</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- Counters -->
        <%--<section class="py-5 bg-primary text-white">
            <div class="container">
                <div class="row text-center g-4">
                    <div class="col-md-3" data-aos="zoom-in">
                        <h2 class="fw-bold">250+</h2>
                        <p>
                            Doctors</p>
                    </div>
                    <div class="col-md-3" data-aos="zoom-in" data-aos-delay="100">
                        <h2 class="fw-bold">12k+</h2>
                        <p>
                            Patients</p>
                    </div>
                    <div class="col-md-3" data-aos="zoom-in" data-aos-delay="200">
                        <h2 class="fw-bold">96%</h2>
                        <p>
                            Satisfaction</p>
                    </div>
                    <div class="col-md-3" data-aos="zoom-in" data-aos-delay="300">
                        <h2 class="fw-bold">24/7</h2>
                        <p>
                            Support</p>
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- FAQ -->
        <%--<section class="py-5">
            <div class="container">
                <div class="section-heading text-center mb-5" data-aos="fade-up">
                    <h2 class="fw-bold">Frequently Asked Questions</h2>
                    <p class="text-muted">
                        Need help? Here are answers to common questions.</p>
                </div>
                <div class="accordion" id="faqAccordion">
                    <div class="accordion-item rounded-4 overflow-hidden mb-3" data-aos="fade-up">
                        <h2 class="accordion-header">
                            <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#faqOne">
                                How do I book an appointment?
                            </button>
                        </h2>
                        <div id="faqOne" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Search for a doctor, open their profile, and choose a time slot on the booking page.</div>
                        </div>
                    </div>
                    <div class="accordion-item rounded-4 overflow-hidden mb-3" data-aos="fade-up" data-aos-delay="100">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#faqTwo">
                                Can I cancel or reschedule?
                            </button>
                        </h2>
                        <div id="faqTwo" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Yes, you can manage upcoming appointments from the history page.</div>
                        </div>
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- Newsletter -->
        <%--<section class="py-5 bg-light">
            <div class="container">
                <div class="row align-items-center g-4" data-aos="fade-up">
                    <div class="col-lg-8">
                        <h3 class="fw-bold mb-2">Get the latest health tips directly in your inbox.</h3>
                        <p class="text-muted mb-0">
                            Subscribe for wellness updates and appointment reminders.</p>
                    </div>
                    <div class="col-lg-4">
                        <form class="d-flex gap-2">
                            <input type="email" id="txtNewsletterEmail" name="NewsletterEmail" class="form-control" placeholder="Enter your email" required>
                            <button type="button" class="btn btn-primary">
                                Join
                            </button>
                        </form>
                    </div>
                </div>
            </div>
    </section>
    </main>--%>
<%--                ***********          about us            *************--%>
<%--                <main>--%>
        <!-- About Hero -->
        <%--<section class="page-hero py-5 bg-light">
            <div class="container">
                <div class="row align-items-center g-4">
                    <div class="col-lg-7" data-aos="fade-right">
                        <h1 class="fw-bold">About CareConnect</h1>
                        <p class="text-muted">
                            A premium online booking experience linking patients, doctors, and healthcare providers.</p>
                    </div>
                    <div class="col-lg-5" data-aos="fade-left">
                        <img src="https://images.unsplash.com/photo-1579684385127-1ef15d508118?auto=format&fit=crop&w=900&q=80" class="img-fluid rounded-4 shadow" alt="Hospital Information">
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- Mission & Vision -->
        <%--<section class="py-5">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-6" data-aos="fade-up">
                        <div class="card border-0 shadow-sm rounded-4 h-100 p-4">
                            <h3 class="fw-bold">Our Mission</h3>
                            <p class="text-muted">
                                To make healthcare accessible, efficient, and transparent through an intuitive online platform.</p>
                        </div>
                    </div>
                    <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
                        <div class="card border-0 shadow-sm rounded-4 h-100 p-4">
                            <h3 class="fw-bold">Our Vision</h3>
                            <p class="text-muted">
                                To build a digital health ecosystem that empowers patients to book timely care with confidence.</p>
                        </div>
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- Our Team -->
        <%--<section class="py-5 bg-light">
            <div class="container">
                <div class="section-heading text-center mb-5" data-aos="fade-up">
                    <h2 class="fw-bold">Our Team</h2>
                    <p class="text-muted">
                        Dedicated professionals behind the platform.</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4" data-aos="fade-up">
                        <div class="card border-0 shadow-sm rounded-4 h-100 text-center p-4">
                            <i class="bi bi-person-circle display-4 text-primary"></i>
                            <h5 class="mt-3">Dr. Bilal Ahmed</h5>
                            <p class="text-muted">
                                Medical Director</p>
                        </div>
                    </div>
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                        <div class="card border-0 shadow-sm rounded-4 h-100 text-center p-4">
                            <i class="bi bi-person-circle display-4 text-primary"></i>
                            <h5 class="mt-3">Nadia Khan</h5>
                            <p class="text-muted">
                                Operations Lead</p>
                        </div>
                    </div>
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                        <div class="card border-0 shadow-sm rounded-4 h-100 text-center p-4">
                            <i class="bi bi-person-circle display-4 text-primary"></i>
                            <h5 class="mt-3">Saad Malik</h5>
                            <p class="text-muted">
                                Product Designer</p>
                        </div>
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- Why Choose Us -->
        <%--<section class="py-5">
            <div class="container">
                <div class="row g-4 align-items-center">
                    <div class="col-lg-6" data-aos="fade-right">
                        <h2 class="fw-bold">Why Choose Us</h2>
                        <p class="text-muted">
                            We bring medical convenience to your fingertips with secure and elegant booking workflows.</p>
                        <ul class="list-unstyled mt-4">
                            <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i>Fast scheduling and reminders</li>
                            <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i>Trusted specialist profiles</li>
                            <li class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i>Secure payment and booking flow</li>
                        </ul>
                    </div>
                    <div class="col-lg-6" data-aos="fade-left">
                        <img src="https://images.unsplash.com/photo-1538108149393-fbbd81895907?auto=format&fit=crop&w=900&q=80" class="img-fluid rounded-4 shadow" alt="Clinic Team">
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- Timeline -->
        <%--<section class="py-5 bg-light">
            <div class="container">
                <div class="section-heading text-center mb-5" data-aos="fade-up">
                    <h2 class="fw-bold">Our Journey</h2>
                    <p class="text-muted">
                        Milestones in our growth.</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4" data-aos="fade-up">
                        <div class="card border-0 shadow-sm rounded-4 h-100 p-4">
                            <h5>2022</h5>
                            <p class="text-muted">
                                Platform launched with 50 partner doctors.</p>
                        </div>
                    </div>
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                        <div class="card border-0 shadow-sm rounded-4 h-100 p-4">
                            <h5>2024</h5>
                            <p class="text-muted">
                                Expanded to multi-hospital booking capabilities.</p>
                        </div>
                    </div>
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                        <div class="card border-0 shadow-sm rounded-4 h-100 p-4">
                            <h5>2026</h5>
                            <p class="text-muted">
                                Preparing for ASP.NET Web Forms and SQL Server integration.</p>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    </main>--%>
                <%--********           contact us          **********--%>

<%--                <main>--%>
        <!-- Contact Section -->
        <%--<section class="py-5 bg-light">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-5" data-aos="fade-right">
                        <h1 class="fw-bold mb-3">Get in Touch</h1>
                        <p class="text-muted">
                            We are ready to help with appointments, support, and general inquiries.</p>
                        <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
                            <h5><i class="bi bi-geo-alt-fill text-primary me-2"></i>Office Address</h5>
                            <p class="text-muted mb-0">
                                12-A, Gulberg Avenue, Lahore</p>
                        </div>
                        <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
                            <h5><i class="bi bi-telephone-fill text-primary me-2"></i>Emergency Number</h5>
                            <p class="text-muted mb-0">
                                +92 300 1234567</p>
                        </div>
                        <div class="card border-0 shadow-sm rounded-4 p-4">
                            <h5><i class="bi bi-envelope-fill text-primary me-2"></i>Email</h5>
                            <p class="text-muted mb-0">
                                contact@careconnect.com</p>
                        </div>
                    </div>
                    <div class="col-lg-7" data-aos="fade-left">
                        <div class="card border-0 shadow rounded-4 p-4">
                            <h3 class="fw-bold mb-4">Send us a Message</h3>
                            <form id="contactForm" novalidate>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="txtContactName" class="form-label">
                                        Name</label>
                                        <input type="text" id="txtContactName" name="ContactName" class="form-control" placeholder="Enter your name" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtContactEmail" class="form-label">
                                        Email</label>
                                        <input type="email" id="txtContactEmail" name="ContactEmail" class="form-control" placeholder="Enter your email" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtContactMobile" class="form-label">
                                        Mobile</label>
                                        <input type="tel" id="txtContactMobile" name="ContactMobile" class="form-control" placeholder="Enter mobile number" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtContactSubject" class="form-label">
                                        Subject</label>
                                        <input type="text" id="txtContactSubject" name="ContactSubject" class="form-control" placeholder="Enter subject" required>
                                    </div>
                                    <div class="col-12">
                                        <label for="txtContactMessage" class="form-label">
                                        Message</label>
                                        <textarea id="txtContactMessage" name="ContactMessage" class="form-control" rows="5" placeholder="Write your message" required></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button type="button" id="btnContactSubmit" class="btn btn-primary rounded-pill px-4" onclick="contactSubmit()">
                                            Submit
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </section>--%>

        <!-- Map Placeholder -->
        <%--<section class="py-5">
            <div class="container">
                <div class="card border-0 shadow-sm rounded-4 p-5 text-center" data-aos="fade-up">
                    <h3 class="fw-bold">Google Map Placeholder</h3>
                    <p class="text-muted">
                        Interactive map will be connected here later.</p>
                    <div class="map-placeholder rounded-4 py-5">
                        <i class="bi bi-geo-alt-fill display-1 text-primary"></i>
                    </div>
                </div>
            </div>
    </section>
    </main>
    ********            login         *******
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-5" data-aos="fade-up">
                <div class="card border-0 shadow rounded-4 p-4">
                    <div class="text-center mb-4">
                        <h2 class="fw-bold">Patient Login</h2>
                        <p class="text-muted">
                            Access your appointments and history.</p>
                    </div>
                    <form id="loginForm" novalidate>
                        <div class="mb-3">
                            <label for="txtUsername" class="form-label">
                            Username</label>
                            <input type="text" id="txtUsername" name="Username" class="form-control" placeholder="Enter your username" required>
                        </div>
                        <div class="mb-3">
                            <label for="txtPassword" class="form-label">
                            Password</label>
                            <input type="password" id="txtPassword" name="Password" class="form-control" placeholder="Enter your password" required>
                        </div>
                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" id="chkRememberMe" name="RememberMe">
                            <label class="form-check-label" for="chkRememberMe">
                            Remember me</label>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <a href="#" class="text-decoration-none">Forgot Password?</a>
                        </div>
                        <button type="button" id="btnLogin" class="btn btn-primary w-100 rounded-pill" onclick="loginUser()">
                            Login
                        </button>
                    </form>
                    <div class="text-center mt-4">
                        <p class="mb-0">
                            Don’t have an account? <a href="register.html" class="text-decoration-none">Register here</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>

                <%--********       registration            ****************--%>

               <%-- <div class="container py-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-8" data-aos="fade-up">
                            <div class="card border-0 shadow rounded-4 p-4">
                                <div class="text-center mb-4">
                                    <h2 class="fw-bold">Create Account</h2>
                                    <p class="text-muted">
                                        Register to book appointments and manage your profile.</p>
                                </div>
                                <form id="registerForm" novalidate>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <label for="txtFirstName" class="form-label">
                                            First Name</label>
                                            <input type="text" id="txtFirstName" name="FirstName" class="form-control" placeholder="Enter first name" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="txtLastName" class="form-label">
                                            Last Name</label>
                                            <input type="text" id="txtLastName" name="LastName" class="form-control" placeholder="Enter last name" required>
                                        </div>
                                        <div class="col-md-2">
                                            <label for="txtAge" class="form-label">
                                            Age</label>
                                            <input type="number" id="txtAge" name="Age" class="form-control" placeholder="Age" required>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="ddlGender" class="form-label">
                                            Gender</label>
                                            <select id="ddlGender" name="Gender" class="form-select" required>
                                                <option value="">Select Gender</option>
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                                <option value="Other">Other</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="txtMobile" class="form-label">
                                            Mobile Number</label>
                                            <input type="tel" id="txtMobile" name="MobileNumber" class="form-control" placeholder="Enter mobile number" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="txtEmail" class="form-label">
                                            Email</label>
                                            <input type="email" id="txtEmail" name="Email" class="form-control" placeholder="Enter email address" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="txtPassword" class="form-label">
                                            Password</label>
                                            <input type="password" id="txtPassword" name="Password" class="form-control" placeholder="Create password" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="txtConfirmPassword" class="form-label">
                                            Confirm Password</label>
                                            <input type="password" id="txtConfirmPassword" name="ConfirmPassword" class="form-control" placeholder="Confirm password" required>
                                        </div>
                                        <div class="col-12">
                                            <label for="txtAddress" class="form-label">
                                            Address</label>
                                            <textarea id="txtAddress" name="Address" class="form-control" rows="3" placeholder="Enter your address" required></textarea>
                                        </div>
                                        <div class="col-12">
                                            <label for="fileProfilePhoto" class="form-label">
                                            Profile Photo</label>
                                            <input type="file" id="fileProfilePhoto" name="ProfilePhoto" class="form-control" required>
                                            <img id="imgPreview" class="img-fluid rounded-3 mt-3 d-none" alt="Profile Preview" style="max-height: 180px;">
                                        </div>
                                        <div class="col-12">
                                            <button type="button" id="btnRegister" class="btn btn-primary rounded-pill px-4" onclick="registerUser()">
                                                Register
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
    </div>--%>

                <%--**************     search doctor        ******************--%>

               <%-- <main class="py-5 bg-light">
    <div class="container">
        <div class="card border-0 shadow rounded-4 p-4 mb-4" data-aos="fade-up">
            <h2 class="fw-bold mb-4">Find Your Doctor</h2>
            <form id="searchForm" novalidate>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label for="txtDoctorName" class="form-label">
                        Doctor Name</label>
                        <input type="text" id="txtDoctorName" name="DoctorName" class="form-control" placeholder="Search by doctor name">
                    </div>
                    <div class="col-md-4">
                        <label for="ddlSpecialization" class="form-label">
                        Specialization</label>
                        <select id="ddlSpecialization" name="Specialization" class="form-select">
                            <option value="">All Specializations</option>
                            <option value="Cardiologist">Cardiologist</option>
                            <option value="Dermatologist">Dermatologist</option>
                            <option value="Neurologist">Neurologist</option>
                            <option value="Orthopedic">Orthopedic</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="txtCity" class="form-label">
                        City</label>
                        <input type="text" id="txtCity" name="City" class="form-control" placeholder="e.g. Lahore">
                    </div>
                    <div class="col-md-4">
                        <label for="txtHospital" class="form-label">
                        Hospital</label>
                        <input type="text" id="txtHospital" name="Hospital" class="form-control" placeholder="Hospital name">
                    </div>
                    <div class="col-md-4">
                        <label for="txtExperience" class="form-label">
                        Experience</label>
                        <input type="number" id="txtExperience" name="Experience" class="form-control" placeholder="Years">
                    </div>
                    <div class="col-md-4">
                        <label for="txtFeeRange" class="form-label">
                        Fee Range</label>
                        <input type="number" id="txtFeeRange" name="FeeRange" class="form-control" placeholder="Max fee">
                    </div>
                    <div class="col-md-4">
                        <label for="ddlGender" class="form-label">
                        Gender</label>
                        <select id="ddlGender" name="Gender" class="form-select">
                            <option value="">Any</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                    <div class="col-12 d-flex gap-2">
                        <button type="button" id="btnSearchDoctor" class="btn btn-primary rounded-pill" onclick="searchDoctor()">
                            Search
                        </button>
                        <button type="reset" class="btn btn-outline-secondary rounded-pill">
                            Reset
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div id="doctorResults" class="row g-4">
        </div>
    </div>
    </main>--%>


                <%--**********         doctor profile               ***********--%>

                <%--<main class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4" data-aos="fade-right">
                <div class="card border-0 shadow rounded-4 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&w=900&q=80" class="img-fluid" alt="Doctor">
                </div>
            </div>
            <div class="col-lg-8" data-aos="fade-left">
                <div class="card border-0 shadow rounded-4 p-4">
                    <div class="d-flex justify-content-between align-items-start flex-wrap gap-2">
                        <div>
                            <h2 class="fw-bold mb-1">Dr. Sarah Khan</h2>
                            <p class="text-primary mb-2">
                                Cardiologist | MBBS, FCPS</p>
                        </div>
                        <span class="badge bg-success-subtle text-success">Available Today</span>
                    </div>
                    <div class="row g-3 mt-2">
                        <div class="col-md-6">
                            <p class="mb-2">
                                <strong>Experience:</strong> 15 years</p>
                        </div>
                        <div class="col-md-6">
                            <p class="mb-2">
                                <strong>Specialization:</strong> Cardiology</p>
                        </div>
                        <div class="col-md-6">
                            <p class="mb-2">
                                <strong>Hospital:</strong> Apollo Hospital</p>
                        </div>
                        <div class="col-md-6">
                            <p class="mb-2">
                                <strong>Address:</strong> Karachi</p>
                        </div>
                        <div class="col-md-6">
                            <p class="mb-2">
                                <strong>Languages:</strong> English, Urdu</p>
                        </div>
                        <div class="col-md-6">
                            <p class="mb-2">
                                <strong>Consultation Fee:</strong> $80</p>
                        </div>
                    </div>
                    <h5 class="mt-4">Education</h5>
                    <ul>
                        <li>MBBS – Dow Medical College</li>
                        <li>FCPS – Cardiology</li>
                    </ul>
                    <h5>Certificates</h5>
                    <ul>
                        <li>American College of Cardiology</li>
                        <li>Pakistan Cardiac Society</li>
                    </ul>
                    <h5>Achievements</h5>
                    <ul>
                        <li>Top 10 Cardiologists Award 2024</li>
                        <li>Published 30+ medical papers</li>
                    </ul>
                    <a href="book-appointment.html" class="btn btn-primary rounded-pill mt-3">Book Appointment</a>
                </div>
            </div>
        </div>
        <div class="row g-4 mt-2">
            <div class="col-lg-6" data-aos="fade-up">
                <div class="card border-0 shadow rounded-4 p-4">
                    <h4 class="fw-bold">Available Time Slots</h4>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Monday 10:00 AM</li>
                        <li class="list-group-item">Tuesday 2:00 PM</li>
                        <li class="list-group-item">Wednesday 4:30 PM</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
                <div class="card border-0 shadow rounded-4 p-4">
                    <h4 class="fw-bold">Ratings & Reviews</h4>
                    <p class="text-muted">
                        4.9 ★ from 120 reviews</p>
                    <div class="border rounded-3 p-3 mb-2">
                        <strong>Raza</strong>
                        <p class="text-muted mb-0">
                            Very thoughtful and professional doctor.</p>
                    </div>
                    <div class="border rounded-3 p-3">
                        <strong>Nadia</strong>
                        <p class="text-muted mb-0">
                            Excellent guidance and detailed consultation.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </main>--%>

                <%--***********            book appoitment      **********--%>
               <%-- <main class="py-5 bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8" data-aos="fade-up">
                <div class="card border-0 shadow rounded-4 p-4">
                    <h2 class="fw-bold mb-4">Book Appointment</h2>
                    <form id="appointmentForm" novalidate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="txtDoctorName" class="form-label">
                                Doctor Name</label>
                                <input type="text" id="txtDoctorName" name="DoctorName" class="form-control" value="Dr. Sarah Khan" readonly>
                            </div>
                            <div class="col-md-6">
                                <label for="txtPatientName" class="form-label">
                                Patient Name</label>
                                <input type="text" id="txtPatientName" name="PatientName" class="form-control" placeholder="Enter patient name" required>
                            </div>
                            <div class="col-md-6">
                                <label for="txtMobile" class="form-label">
                                Mobile</label>
                                <input type="tel" id="txtMobile" name="Mobile" class="form-control" placeholder="Enter mobile number" required>
                            </div>
                            <div class="col-md-6">
                                <label for="txtAppointmentDate" class="form-label">
                                Appointment Date</label>
                                <input type="date" id="txtAppointmentDate" name="AppointmentDate" class="form-control" required>
                            </div>
                            <div class="col-12">
                                <label for="ddlTimeSlot" class="form-label">
                                Available Time Slot</label>
                                <select id="ddlTimeSlot" name="TimeSlot" class="form-select" required>
                                    <option value="">Select Slot</option>
                                    <option value="10:00 AM">10:00 AM</option>
                                    <option value="02:00 PM">02:00 PM</option>
                                    <option value="04:30 PM">04:30 PM</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <label for="txtReason" class="form-label">
                                Reason for Visit</label>
                                <textarea id="txtReason" name="Reason" class="form-control" rows="4" placeholder="Describe symptoms or reason" required></textarea>
                            </div>
                            <div class="col-12">
                                <button type="button" id="btnBookAppointment" class="btn btn-primary rounded-pill px-4" onclick="bookAppointment()">
                                    Book Appointment
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </main>--%>

                <%--************       payment       **********--%>
                <%--<main class="py-5 bg-light">
    <div class="container">
        <div class="row g-4 justify-content-center">
            <div class="col-lg-8" data-aos="fade-up">
                <div class="card border-0 shadow rounded-4 p-4">
                    <h2 class="fw-bold mb-4">Payment</h2>
                    <div class="alert alert-info">
                        Appointment booked successfully. Proceed with payment.</div>
                    <div class="row g-3 mb-4">
                        <div class="col-md-6">
                            <p class="mb-2">
                                <strong>Doctor Name:</strong> Dr. Sarah Khan</p>
                        </div>
                        <div class="col-md-6">
                            <p class="mb-2">
                                <strong>Consultation Fee:</strong> $80</p>
                        </div>
                        <div class="col-md-6">
                            <p class="mb-2">
                                <strong>Patient Name:</strong> Ali Ahmed</p>
                        </div>
                    </div>
                    <form id="paymentForm" novalidate>
                        <div class="mb-3">
                            <label class="form-label">
                            Payment Methods</label>
                            <div class="row g-2">
                                <div class="col-md-6">
                                    <div class="form-check border rounded-3 p-3">
                                        <input class="form-check-input" type="radio" name="PaymentMethod" value="Google Pay" id="radGooglePay"><label class="form-check-label" for="radGooglePay">Google Pay</label></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check border rounded-3 p-3">
                                        <input class="form-check-input" type="radio" name="PaymentMethod" value="PhonePe" id="radPhonePe"><label class="form-check-label" for="radPhonePe">PhonePe</label></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check border rounded-3 p-3">
                                        <input class="form-check-input" type="radio" name="PaymentMethod" value="Paytm" id="radPaytm"><label class="form-check-label" for="radPaytm">Paytm</label></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check border rounded-3 p-3">
                                        <input class="form-check-input" type="radio" name="PaymentMethod" value="Credit Card" id="radCreditCard"><label class="form-check-label" for="radCreditCard">Credit Card</label></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check border rounded-3 p-3">
                                        <input class="form-check-input" type="radio" name="PaymentMethod" value="Debit Card" id="radDebitCard"><label class="form-check-label" for="radDebitCard">Debit Card</label></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check border rounded-3 p-3">
                                        <input class="form-check-input" type="radio" name="PaymentMethod" value="Net Banking" id="radNetBanking"><label class="form-check-label" for="radNetBanking">Net Banking</label></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check border rounded-3 p-3">
                                        <input class="form-check-input" type="radio" name="PaymentMethod" value="UPI" id="radUPI"><label class="form-check-label" for="radUPI">UPI</label></div>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="txtAmount" class="form-label">
                            Amount</label>
                            <input type="text" id="txtAmount" name="Amount" class="form-control" value="$80" readonly>
                        </div>
                        <button type="button" id="btnPay" class="btn btn-primary rounded-pill px-4" onclick="makePayment()">
                            Pay
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>--%>

<%--                    ***********     doctro list     ***********--%>
                   <%-- <main class="py-5 bg-light">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4" data-aos="fade-up">
            <div>
                <h2 class="fw-bold mb-1">Available Doctors</h2>
                <p class="text-muted mb-0">
                    Choose a specialist and book your consultation.</p>
            </div>
            <a href="doctor-search.html" class="btn btn-outline-primary rounded-pill">Back to Search</a>
        </div>
        <div class="row g-4">
            <div class="col-lg-4" data-aos="fade-up">
                <div class="card border-0 shadow-sm rounded-4 h-100">
                    <img src="https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Doctor">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <h5 class="card-title mb-1">Dr. Sarah Khan</h5>
                                <p class="text-primary mb-2">
                                    Cardiologist</p>
                            </div>
                            <span class="badge bg-success-subtle text-success">Available Today</span>
                        </div>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-hospital me-1"></i>Apollo Hospital</p>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-clock me-1"></i>15 years experience</p>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-cash me-1"></i>Consultation Fee: $80</p>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-star-fill text-warning me-1"></i>4.9 (120 reviews)</p>
                        <div class="d-flex gap-2 mt-3">
                            <a href="doctor-profile.html" class="btn btn-outline-primary rounded-pill btn-sm">View Profile</a> <a href="book-appointment.html" class="btn btn-primary rounded-pill btn-sm">Book</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                <div class="card border-0 shadow-sm rounded-4 h-100">
                    <img src="https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Doctor">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <h5 class="card-title mb-1">Dr. Ali Hassan</h5>
                                <p class="text-primary mb-2">
                                    Dermatologist</p>
                            </div>
                            <span class="badge bg-success-subtle text-success">Available Today</span>
                        </div>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-hospital me-1"></i>Lifecare Hospital</p>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-clock me-1"></i>12 years experience</p>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-cash me-1"></i>Consultation Fee: $60</p>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-star-fill text-warning me-1"></i>4.8 (95 reviews)</p>
                        <div class="d-flex gap-2 mt-3">
                            <a href="doctor-profile.html" class="btn btn-outline-primary rounded-pill btn-sm">View Profile</a> <a href="book-appointment.html" class="btn btn-primary rounded-pill btn-sm">Book</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
                <div class="card border-0 shadow-sm rounded-4 h-100">
                    <img src="https://images.unsplash.com/photo-1594824476967-48c8b964273f?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Doctor">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <h5 class="card-title mb-1">Dr. Ayesha Noor</h5>
                                <p class="text-primary mb-2">
                                    Neurologist</p>
                            </div>
                            <span class="badge bg-success-subtle text-success">Available Today</span>
                        </div>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-hospital me-1"></i>MediPlus</p>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-clock me-1"></i>18 years experience</p>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-cash me-1"></i>Consultation Fee: $90</p>
                        <p class="small text-muted mb-2">
                            <i class="bi bi-star-fill text-warning me-1"></i>4.7 (85 reviews)</p>
                        <div class="d-flex gap-2 mt-3">
                            <a href="doctor-profile.html" class="btn btn-outline-primary rounded-pill btn-sm">View Profile</a> <a href="book-appointment.html" class="btn btn-primary rounded-pill btn-sm">Book</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <nav class="mt-5" aria-label="Pagination">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </nav>
    </div>
    </main>--%>

                    <%--********       feed back  ********--%>
                    <%--<main class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-5" data-aos="fade-right">
                <div class="card border-0 shadow rounded-4 p-4">
                    <h2 class="fw-bold mb-4">Share Your Feedback</h2>
                    <form id="feedbackForm" novalidate>
                        <div class="mb-3">
                            <label for="ddlDoctorName" class="form-label">
                            Doctor Name</label>
                            <select id="ddlDoctorName" name="DoctorName" class="form-select" required>
                                <option value="">Select Doctor</option>
                                <option value="Dr. Sarah Khan">Dr. Sarah Khan</option>
                                <option value="Dr. Ali Hassan">Dr. Ali Hassan</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">
                            Star Rating</label>
                            <div class="d-flex gap-2 fs-4 text-warning">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star"></i>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="txtReview" class="form-label">
                            Review</label>
                            <textarea id="txtReview" name="Review" class="form-control" rows="5" placeholder="Write your review" required></textarea>
                        </div>
                        <button type="button" id="btnSubmitFeedback" class="btn btn-primary rounded-pill px-4" onclick="submitFeedback()">
                            Submit
                        </button>
                    </form>
                </div>
            </div>
            <div class="col-lg-7" data-aos="fade-left">
                <div class="card border-0 shadow rounded-4 p-4">
                    <h3 class="fw-bold mb-4">Recent Reviews</h3>
                    <div class="border rounded-3 p-3 mb-3">
                        <div class="d-flex justify-content-between">
                            <strong>Ali</strong> <span class="text-warning">★★★★★</span>
                        </div>
                        <p class="text-muted mb-0">
                            Great experience and excellent support.</p>
                    </div>
                    <div class="border rounded-3 p-3">
                        <div class="d-flex justify-content-between">
                            <strong>Nadia</strong> <span class="text-warning">★★★★☆</span>
                        </div>
                        <p class="text-muted mb-0">
                            Very smooth booking process and clean interface.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </main>
    **********   history        ************
    <main class="py-5 bg-light">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4" data-aos="fade-up">
            <div>
                <h2 class="fw-bold mb-1">Appointment History</h2>
                <p class="text-muted mb-0">
                    Manage upcoming and completed visits.</p>
            </div>
            <input type="text" class="form-control w-auto" placeholder="Search appointments" style="max-width: 280px;">
        </div>
        <div class="card border-0 shadow rounded-4 p-3" data-aos="fade-up">
            <div class="table-responsive">
                <table class="table align-middle">
                    <thead>
                        <tr>
                            <th>Doctor Name</th>
                            <th>Hospital</th>
                            <th>Appointment Date</th>
                            <th>Time</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Dr. Sarah Khan</td>
                            <td>Apollo Hospital</td>
                            <td>2026-08-01</td>
                            <td>10:00 AM</td>
                            <td><span class="badge bg-success-subtle text-success">Upcoming</span></td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary rounded-pill">
                                    Update
                                </button>
                                <button class="btn btn-sm btn-outline-danger rounded-pill">
                                    Cancel
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>Dr. Ali Hassan</td>
                            <td>Lifecare Hospital</td>
                            <td>2026-07-10</td>
                            <td>02:00 PM</td>
                            <td><span class="badge bg-secondary-subtle text-secondary">Completed</span></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </main>--%>

                    <%--**********     logout   *********--%>

                    <%--<div class="container py-5">
                        <div class="row justify-content-center">
                            <div class="col-lg-6" data-aos="fade-up">
                                <div class="card border-0 shadow rounded-4 p-5 text-center">
                                    <i class="bi bi-box-arrow-right display-1 text-primary"></i>
                                    <h2 class="fw-bold mt-3">Logout</h2>
                                    <p class="text-muted">
                                        Are you sure you want to logout?</p>
                                    <div class="d-flex justify-content-center gap-3 mt-4">
                                        <button type="button" class="btn btn-danger rounded-pill px-4" onclick="logout()">
                                            Logout
                                        </button>
                                        <a href="index.html" class="btn btn-outline-primary rounded-pill px-4">Stay Logged In</a>
                                    </div>
                                </div>
                            </div>
                        </div>
    </div>
    </main>--%>

     <main class="py-5 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">

                    <div class="card border-0 shadow rounded-4 p-4 text-center">

                        <div class="mb-3">
                            <span class="text-success"
                                style="font-size:65px;">&#10004;</span>
                        </div>

                        <h2 class="fw-bold text-success mb-3">
                            Payment Successful!
                        </h2>

                        <p class="text-muted">
                            Your demo payment has been recorded successfully.
                            Your appointment is confirmed.
                        </p>

                        <hr />

                        <div class="text-start">

                            <p>
                                <strong>Payment ID:</strong>
                                <asp:Label ID="lblPaymentId" runat="server" />
                            </p>

                            <p>
                                <strong>Doctor Name:</strong>
                                <asp:Label ID="lblDoctor" runat="server" />
                            </p>

                            <p>
                                <strong>Patient Name:</strong>
                                <asp:Label ID="lblPatient" runat="server" />
                            </p>

                            <p>
                                <strong>Appointment Date:</strong>
                                <asp:Label ID="lblDate" runat="server" />
                            </p>

                            <p>
                                <strong>Time Slot:</strong>
                                <asp:Label ID="lblTime" runat="server" />
                            </p>

                            <p>
                                <strong>Payment Method:</strong>
                                <asp:Label ID="lblMethod" runat="server" />
                            </p>

                            <p>
                                <strong>Amount:</strong>
                                ₹<asp:Label ID="lblAmount" runat="server" />
                            </p>

                            <p>
                                <strong>Payment Status:</strong>
                                <asp:Label ID="lblStatus" runat="server"
                                    CssClass="text-success fw-bold" />
                            </p>

                            <p>
                                <strong>Payment Date:</strong>
                                <asp:Label ID="lblPaymentDate" runat="server" />
                            </p>

                        </div>

                        <div class="mt-4">
                           <%-- <asp:HyperLink ID="lnkHome" runat="server"
                                NavigateUrl="~/Default.aspx"
                                CssClass="btn btn-primary rounded-pill px-4">
                                Back to Home
                            </asp:HyperLink>--%>

         <asp:Button runat="server" Text="back to home"  CssClass="btn btn-primary rounded-pill px-4" OnClick="Unnamed1_Click" />
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </main>
</asp:Content>

