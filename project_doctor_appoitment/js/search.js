// Search and filter JavaScript for doctors
// Replace with ASP.NET backend later

const doctorData = [
    {
        name: 'Dr. Sarah Khan',
        specialization: 'Cardiologist',
        city: 'Karachi',
        hospital: 'Apollo Hospital',
        experience: 15,
        fee: 80,
        gender: 'Female'
    },
    {
        name: 'Dr. Ali Hassan',
        specialization: 'Dermatologist',
        city: 'Lahore',
        hospital: 'Lifecare Hospital',
        experience: 12,
        fee: 60,
        gender: 'Male'
    },
    {
        name: 'Dr. Ayesha Noor',
        specialization: 'Neurologist',
        city: 'Islamabad',
        hospital: 'MediPlus',
        experience: 18,
        fee: 90,
        gender: 'Female'
    },
    {
        name: 'Dr. Usman Raza',
        specialization: 'Orthopedic',
        city: 'Lahore',
        hospital: 'City Care Hospital',
        experience: 10,
        fee: 70,
        gender: 'Male'
    }
];

function searchDoctor() {
    // Replace with ASP.NET backend later
    const name = document.getElementById('txtDoctorName')?.value.toLowerCase() || '';
    const specialization = document.getElementById('ddlSpecialization')?.value || '';
    const city = document.getElementById('txtCity')?.value.toLowerCase() || '';
    const hospital = document.getElementById('txtHospital')?.value.toLowerCase() || '';
    const experience = document.getElementById('txtExperience')?.value || '';
    const fee = document.getElementById('txtFeeRange')?.value || '';
    const gender = document.getElementById('ddlGender')?.value || '';

    const results = doctorData.filter(function (doctor) {
        const matchesName = doctor.name.toLowerCase().includes(name);
        const matchesSpecialization = specialization ? doctor.specialization === specialization : true;
        const matchesCity = city ? doctor.city.toLowerCase().includes(city) : true;
        const matchesHospital = hospital ? doctor.hospital.toLowerCase().includes(hospital) : true;
        const matchesExperience = experience ? doctor.experience >= Number(experience) : true;
        const matchesFee = fee ? doctor.fee <= Number(fee) : true;
        const matchesGender = gender ? doctor.gender === gender : true;

        return matchesName && matchesSpecialization && matchesCity && matchesHospital && matchesExperience && matchesFee && matchesGender;
    });

    renderDoctors(results);
}

function filterDoctors() {
    // Comment for future ASP.NET integration
    searchDoctor();
}

function renderDoctors(doctors) {
    const container = document.getElementById('doctorResults');
    if (!container) return;

    if (!doctors.length) {
        container.innerHTML = '<div class="col-12"><div class="alert alert-info rounded-4">No doctors found. Try different filters.</div></div>';
        return;
    }

    container.innerHTML = doctors.map(function (doctor) {
        return `
            <div class="col-lg-4">
                <div class="card border-0 shadow-sm rounded-4 h-100">
                    <img src="https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Doctor">
                    <div class="card-body">
                        <h5 class="card-title">${doctor.name}</h5>
                        <p class="text-primary mb-1">${doctor.specialization}</p>
                        <p class="text-muted small mb-2"><i class="bi bi-hospital me-1"></i>${doctor.hospital}</p>
                        <p class="text-muted small mb-2"><i class="bi bi-clock me-1"></i>${doctor.experience} years experience</p>
                        <p class="text-muted small mb-2"><i class="bi bi-cash me-1"></i>Fee: $${doctor.fee}</p>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <span class="badge bg-success-subtle text-success">Available Today</span>
                            <a href="Doctor_profile.aspx" class="btn btn-sm btn-outline-primary rounded-pill">View</a>
                        </div>
                    </div>
                </div>
            </div>
        `;
    }).join('');
}

document.addEventListener('DOMContentLoaded', function () {
    if (document.getElementById('doctorResults')) {
        renderDoctors(doctorData);
    }
});
