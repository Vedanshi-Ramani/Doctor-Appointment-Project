using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient; //for connection
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_doctor_appoitment
{
    public partial class book_appoitment : System.Web.UI.Page
    {

        SqlConnection con; //for connection
        SqlCommand cmd; // for insert , update , delete
        SqlDataAdapter da; // container
        DataSet ds; // selecet
        string nm; //for store username 
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                LoadPatient();
                LoadDoctor();

                DropDownList1.Items.Clear();
                DropDownList1.Items.Add(new ListItem("Select appointment date first", ""));
            }
        }

        void LoadPatient()
        {
            getcon();

            da = new SqlDataAdapter("SELECT * FROM user_tbl WHERE Email = '" +
                Session["user"].ToString() + "' ", con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                ViewState["UserId"] = ds.Tables[0].Rows[0]["Id"].ToString();

                txtunm.Text = ds.Tables[0].Rows[0]["FirstName"].ToString() + " " +
                    ds.Tables[0].Rows[0]["LastName"].ToString();

                txtmbl.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }

        void LoadDoctor()
        {
            int doctorId;

            if (!int.TryParse(Request.QueryString["did"], out doctorId))
            {
                lblMessage.Text = "Please select a valid doctor.";
            }

            getcon();

            da = new SqlDataAdapter("SELECT * FROM Doctor_tbl WHERE Doc_Id = " + doctorId, con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                ViewState["DoctorId"] = ds.Tables[0].Rows[0]["Doc_Id"].ToString();

                txtdcnm.Text = ds.Tables[0].Rows[0]["Doc_Name"].ToString();
            }
            else
            {
                lblMessage.Text = "Doctor not found.";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            if (Session["user"] == null || ViewState["UserId"] == null || ViewState["DoctorId"] == null)
            {
                Response.Redirect("login.aspx");
            }

            DateTime appointmentDate;

            if (!DateTime.TryParse(txtAppointmentDate.Text, out appointmentDate))
            {
                lblMessage.Text ="Please select an appointment date.";
                return;
            }

            if (appointmentDate.Date < DateTime.Today)
            {
                lblMessage.Text ="Please select today or a future date.";
                return;
            }

            if (DropDownList1.SelectedValue == "")
            {
                lblMessage.Text ="Please select an available time slot.";
                return;
            }

            int userId = Convert.ToInt32(ViewState["UserId"]);
            int doctorId = Convert.ToInt32(ViewState["DoctorId"]);

            string patientName = txtunm.Text;
            string mobile = txtmbl.Text;
            string timeSlot =DropDownList1.SelectedValue;

            getcon();

            // Check whether the slot is already booked
            string checkQuery ="SELECT COUNT(*) FROM Appointment_tbl WHERE Doc_Id = " + doctorId +
                " AND Appointment_Date = '" + appointmentDate.ToString("yyyy-MM-dd") + "'" +
                " AND Time_Slot = '" + timeSlot + "'" + " AND Booking_Status <> 'Cancelled'";

            cmd = new SqlCommand(checkQuery, con);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            if (count > 0)
            {
                con.Close();

                lblMessage.Text ="This slot is already booked. Please select another slot.";

                LoadAvailableSlots();
                return;
            }

            // Insert appointment details
            string insertQuery ="INSERT INTO Appointment_tbl (User_Id, Doc_Id, Patient_Name, Mobile, " +
     "Appointment_Date, Time_Slot, Booking_Status, Booking_Date) " +
     "VALUES (" + userId + " , " + doctorId + ", '" + patientName + "', '" + mobile + "', '" +
     appointmentDate.ToString("yyyy-MM-dd") + "', '" + timeSlot + "', 'Pending Payment', GETDATE()); " +
     "SELECT CAST(SCOPE_IDENTITY() AS INT)";

            cmd = new SqlCommand(insertQuery, con);

            int appointmentId = Convert.ToInt32(cmd.ExecuteScalar());
            Response.Redirect("payment.aspx?aid=" + appointmentId);
        }

        protected void txtAppointmentDate_TextChanged(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            LoadAvailableSlots();
        }
        void LoadAvailableSlots()
        {
            DropDownList1.Items.Clear();

            DateTime appointmentDate;

            if (!DateTime.TryParse(txtAppointmentDate.Text, out appointmentDate))
            {
                DropDownList1.Items.Add(new ListItem("Select appointment date first", ""));
                return;
            }

            if (appointmentDate.Date < DateTime.Today)
            {
                lblMessage.Text ="Please select today or a future date.";

                DropDownList1.Items.Add(new ListItem("No available slots", ""));
                return;
            }

            if (ViewState["DoctorId"] == null)
            {
                lblMessage.Text = "Please select a valid doctor.";
                return;
            }

            getcon();

            string query =
                "SELECT SlotName FROM (" +
                "SELECT '10:00 AM - 10:45 AM' AS SlotName, 1 AS SlotOrder " +
                "UNION ALL SELECT '11:00 AM - 11:45 AM', 2 " +
                "UNION ALL SELECT '01:00 PM - 01:45 PM', 3 " +
                "UNION ALL SELECT '02:00 PM - 02:45 PM', 4 " +
                "UNION ALL SELECT '04:00 PM - 05:00 PM', 5 " +
                "UNION ALL SELECT '05:30 PM - 06:30 PM', 6 " +
                "UNION ALL SELECT '07:00 PM - 08:00 PM', 7" +
                ") AS Slots " +
                "WHERE NOT EXISTS (" +
                "SELECT * FROM Appointment_tbl " +
                "WHERE Doc_Id = " + Convert.ToInt32(ViewState["DoctorId"]) +
                " AND Appointment_Date = '" + appointmentDate.ToString("yyyy-MM-dd") + "'" +
                " AND Time_Slot = Slots.SlotName" +
                " AND Booking_Status <> 'Cancelled') " +
                "ORDER BY SlotOrder";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            DropDownList1.DataSource = ds.Tables[0];
            DropDownList1.DataTextField = "SlotName";
            DropDownList1.DataValueField = "SlotName";
            DropDownList1.DataBind();

            if (DropDownList1.Items.Count == 0)
            {
                DropDownList1.Items.Add(new ListItem("No slots available", ""));
            }
            else
            {
                DropDownList1.Items.Insert(0, new ListItem("Select Time Slot", ""));
            }
        }


    }
}