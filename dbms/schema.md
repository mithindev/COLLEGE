`CREATE TABLE Users (     user_id SERIAL PRIMARY KEY,     username VARCHAR(100) UNIQUE NOT NULL,     password VARCHAR(255) NOT NULL,     role VARCHAR(50) CHECK (role IN ('Admin', 'Doctor', 'Receptionist', 'Patient')),     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ); `

`CREATE TABLE Patients (     patient_id SERIAL PRIMARY KEY,     user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,     name VARCHAR(100) NOT NULL,     age INT,     gender VARCHAR(10),     contact_info VARCHAR(100),     medical_history TEXT,     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ); `

`CREATE TABLE Doctors (     doctor_id SERIAL PRIMARY KEY,     user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,     name VARCHAR(100) NOT NULL,     specialization VARCHAR(100),     contact_info VARCHAR(100),     availability_schedule TEXT,  -- You can store available days and times as JSON or Text     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ); `

`CREATE TABLE MedicalRecords (     record_id SERIAL PRIMARY KEY,     patient_id INT REFERENCES Patients(patient_id) ON DELETE CASCADE,     doctor_id INT REFERENCES Doctors(doctor_id) ON DELETE CASCADE,     diagnosis TEXT,     prescription TEXT,     visit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ); `

## ROUTES

### **1. Authentication Routes**

* **POST `/api/auth/register`** : Register a new user.
* **POST `/api/auth/login`** : Login a user.

### **2. Patient Routes**

* **GET `/api/patients`** : Get all patients.
* **POST `/api/patients`** : Add a new patient.
* **GET `/api/patients/get-patient-by-id/:id`** : Get a specific patient by ID.
* **PUT `/api/patients/update-patient-by-id/:id`** : Update a patient by ID.
* **DELETE `/api/patients/delete-patient-by-id/:id`** : Delete a patient by ID.

### **3. Doctor Routes**

* **POST `/api/doctors`** : Add a new doctor.
* **GET `/api/doctors/get-all-doctors`** : Get all doctors.
* **GET `/api/doctors/get-doctor-by-id/:id`** : Get a specific doctor by ID.
* **PUT `/api/doctors/update-doctor-by-id/:id`** : Update doctor details by ID.
* **DELETE `/api/doctors/delete-doctor-by-id/:id`** : Delete a doctor by ID.

### **4. Appointment Routes**

* **POST `/api/appointments/create-appointment`** : Schedule an appointment.
* **GET `/api/appointments/get-all-appointments`** : Get all appointments.
* **PUT `/api/appointments/update-appointment-by-id/:id`** : Update an appointment by ID.
* **DELETE `/api/appointments/delete-appointment-by-id/:id`** : Cancel an appointment by ID.

### 1. **User Roles and Authentication**

* **Admin** : Manages hospital resources such as doctors, patients, and appointments.
* **Doctor** : Views and manages appointments, checks patient history, and updates patient records.
* **Receptionist/Staff** : Schedules appointments, registers patients, and manages basic records.
* **Patient** : Can view their appointment history, schedule appointments, and view reports (optional if we allow a patient portal).

### 2. **Core Features**

#### a. **Patient Management**

* **Add/Edit Patient Details** : Admin or staff can add a new patient, edit their details (name, age, gender, contact information).
* **View Patient Records** : Doctors and Admin can view patient medical history and details.
* **Medical History** : Store diagnosis, prescriptions, and treatments.

#### b. **Doctor Management**

* **Add/Edit Doctor Details** : Manage doctors’ details such as name, specialization, contact information.
* **Doctor Availability** : Admin can set the availability of doctors for appointments.

#### c. **Appointment Management**

* **Schedule Appointments** : Receptionist/staff can schedule an appointment with available doctors.
* **View Appointments** : Doctors can view their upcoming and past appointments.
* **Update Appointment Status** : Doctors or Admin can mark appointments as "Completed", "Cancelled", etc.

#### d. **Billing and Payment (Optional)**

* **Generate Bills** : Generate bills for completed appointments.
* **View Payment History** : View payment details related to patients' treatments or consultations.

#### e. **Medical Records**

* **Prescriptions and Reports** : Allow doctors to generate prescriptions for patients.
* **Lab Reports (Optional)** : Store patients' medical reports (like blood tests, X-rays, etc.).

### 3. **Additional Features**

#### a. **Search Functionality**

* Search for patients by name, ID, or contact information.
* Search for doctors by name or specialization.

#### b. **Dashboard**

* An admin or doctor dashboard displaying relevant metrics:
  * Total patients, doctors, appointments for the day, etc.
  * Visual charts (optional) like patient statistics, treatment trends, etc.

#### c. **Notifications and Reminders (Optional)**

* Email/SMS reminders for upcoming appointments for patients and doctors.
* Notifications for admin when appointments are scheduled or cancelled.

#### d. **Role-based Access Control**

* Different functionalities accessible to different roles (e.g., doctors, admins, receptionists).

### 4. **Technology Stack**

* **Frontend** : HTML, TailwindCSS, and JavaScript for the user interface.
* TailwindCSS will help with styling the components quickly and efficiently.
* **Backend** : Node.js and Express (or similar) to handle API requests.
* **Database** : PostgreSQL for managing all the hospital-related data (patients, doctors, appointments).
* **Authentication** : Use something like JWT (JSON Web Tokens) for secure role-based access control.
* **API** : RESTful API that connects the frontend to the backend.

### 5. **High-Level User Flow**

#### a. **Admin Flow**

* Log in as Admin.
* View and manage doctors, patients, and appointments.
* Generate reports (appointment history, medical records).
* Manage billing and payments (if applicable).

#### b. **Doctor Flow**

* Log in as a Doctor.
* View appointments for the day.
* View patient details and history.
* Update appointments (mark completed/cancelled) and add notes.

#### c. **Receptionist Flow**

* Log in as Staff/Receptionist.
* Register a new patient.
* Schedule appointments for patients with doctors.
* View upcoming appointments and update statuses.

#### d. **Patient Flow (Optional)**

* Log in as Patient (if patient portal is enabled).
* View personal medical records.
* Schedule or reschedule appointments.

### 6. **Database Schema**

Here’s an idea of how the database could be structured:

* **Users Table** : Store information about users (patients, doctors, admin, staff), including role-based access.
* **Patients Table** : Store patient-specific information (name, age, contact details, etc.).
* **Doctors Table** : Store doctor-specific information (name, specialization, availability).
* **Appointments Table** : Manage scheduling of appointments.
* **Medical Records Table** : Store patient diagnosis, prescriptions, and treatment history.
* **Payments Table** (optional): Track billing and payments related to patient services.

---

### Next Steps:

1. **Frontend Design** :

* Sketch out the different pages (login, dashboard, appointment scheduling, patient management, etc.).
* Use TailwindCSS to quickly style these components.

1. **Backend API** :

* Build out REST API routes for handling CRUD operations (Create, Read, Update, Delete) for patients, doctors, and appointments.

1. **Database Schema** :

* Finalize the database schema and connect the PostgreSQL database to the backend.
