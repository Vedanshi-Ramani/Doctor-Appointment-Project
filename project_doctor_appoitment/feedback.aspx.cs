using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //for connection
using System.Data;
using System.Configuration;

namespace project_doctor_appoitment
{
    public partial class feedback : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string filenm; // store the image path
        string unm; //store the user name and pass it into session
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
            else
            {
                if (!IsPostBack)
                {
                    loadAppointment();
                }
            }
        }

        void loadAppointment()
        {
            if (Request.QueryString["Appointment_Id"] == null)
            {
                lblMessage.Text = "Appointment not found.";
                pnlFeedback.Visible = false;
                return;
            }

            int aid = Convert.ToInt32(Request.QueryString["Appointment_Id"]);

            string email = Session["user"].ToString();

            getcon();

            string query = @"SELECT
                                a.Appointment_Id,
                                a.Appointment_Date,
                                a.Time_Slot,
                                a.Booking_Status,
                                d.Doc_Name,
                                (SELECT COUNT(*)
                                 FROM Feedback_tbl f
                                 WHERE f.Appointment_Id = a.Appointment_Id) AS FeedbackCount
                             FROM Appointment_tbl a
                             INNER JOIN user_tbl u ON a.User_Id = u.Id
                             INNER JOIN Doctor_tbl d ON a.Doc_Id = d.Doc_Id
                             WHERE a.Appointment_Id = @Aid
                             AND u.Email = @Email";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Aid", aid);
            cmd.Parameters.AddWithValue("@Email", email);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();

            da.Fill(ds);

            con.Close();


            if (ds.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "Appointment not found or you are not allowed to give feedback.";
                pnlFeedback.Visible = false;
                return;
            }


            DataRow dr = ds.Tables[0].Rows[0];

            lblDoctorName.Text = dr["Doc_Name"].ToString();

            DateTime appointmentDate =
                Convert.ToDateTime(dr["Appointment_Date"]);

            string timeSlot = dr["Time_Slot"].ToString();

            lblAppointmentDetails.Text =
                appointmentDate.ToString("dd-MM-yyyy") + " | " + timeSlot;


            // CHECK CANCELLED APPOINTMENT
            if (dr["Booking_Status"].ToString() == "Cancelled")
            {
                lblMessage.Text = "You cannot give feedback for a cancelled appointment.";
                pnlFeedback.Visible = false;
                return;
            }


            // CHECK WHETHER APPOINTMENT TIME IS COMPLETED
            string[] slotParts = timeSlot.Split('-');

            DateTime endTime =
                Convert.ToDateTime(slotParts[1].Trim());

            DateTime appointmentEnd =
                appointmentDate.Date.Add(endTime.TimeOfDay);

            if (appointmentEnd >= DateTime.Now)
            {
                lblMessage.Text = "You can submit feedback after your appointment is completed.";
                pnlFeedback.Visible = false;
                return;
            }


            // CHECK WHETHER FEEDBACK IS ALREADY SUBMITTED
            int feedbackCount = Convert.ToInt32(dr["FeedbackCount"]);

            if (feedbackCount > 0)
            {
                lblMessage.Text = "You have already submitted feedback for this appointment.";
                pnlFeedback.Visible = false;
                return;
            }


            pnlFeedback.Visible = true;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            loadAppointment();

            if (pnlFeedback.Visible == false)
            {
                return;
            }


            if (ddlRating.SelectedValue == "")
            {
                lblMessage.Text = "Please select a rating.";
                return;
            }


            if (txtFeedback.Text.Trim() == "")
            {
                lblMessage.Text = "Please write your feedback.";
                return;
            }


            int aid = Convert.ToInt32(Request.QueryString["Appointment_Id"]);

            string email = Session["user"].ToString();

            int rating = Convert.ToInt32(ddlRating.SelectedValue);

            string message = txtFeedback.Text.Trim();


            // INSERT FEEDBACK INTO DATABASE
            getcon();

            string query = @"INSERT INTO Feedback_tbl
                             (Appointment_Id, User_Id, Doc_Id, Rating, Feedback_Message)
                             SELECT
                                a.Appointment_Id,
                                a.User_Id,
                                a.Doc_Id,
                                @Rating,
                                @Message
                             FROM Appointment_tbl a
                             INNER JOIN user_tbl u ON a.User_Id = u.Id
                             WHERE a.Appointment_Id = @Aid
                             AND u.Email = @Email
                             AND NOT EXISTS
                             (
                                 SELECT 1
                                 FROM Feedback_tbl f
                                 WHERE f.Appointment_Id = a.Appointment_Id
                             )";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Rating", rating);
            cmd.Parameters.AddWithValue("@Message", message);
            cmd.Parameters.AddWithValue("@Aid", aid);
            cmd.Parameters.AddWithValue("@Email", email);

            int result = cmd.ExecuteNonQuery();

            con.Close();


            if (result > 0)
            {
                lblMessage.Text = "Thank you! Your feedback has been submitted successfully.";

                pnlFeedback.Visible = false;

                btnGoHistory.Visible = true;
            }
            else
            {
                lblMessage.Text = "Feedback could not be submitted. Please try again.";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("history.aspx");

        }
    }
}