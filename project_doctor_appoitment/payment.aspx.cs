using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data;
using System.Data.SqlClient; //for connection
using System.Web.UI.WebControls;

namespace project_doctor_appoitment
{
    public partial class payment : System.Web.UI.Page
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
                return;
            }

            if (!IsPostBack)
            {
                LoadAppointment();
            }
        }

        void LoadAppointment()
        {
            int appointmentId;

            if (!int.TryParse(Request.QueryString["aid"], out appointmentId))
            {
                lblMessage.Text = "Invalid appointment ID.";
                return;
            }

            getcon();

            string query =
                "SELECT a.Appointment_Id, a.Patient_Name, " +
                "a.Appointment_Date, a.Time_Slot, a.Booking_Status, " +
                "d.Doc_Name, d.Doc_Fee " +
                "FROM Appointment_tbl a " +
                "INNER JOIN Doctor_tbl d ON a.Doc_Id = d.Doc_Id " +
                "INNER JOIN user_tbl u ON a.User_Id = u.Id " +
                "WHERE a.Appointment_Id = " + appointmentId +
                " AND u.Email = '" +Session["user"].ToString()+ "'";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];

                lblDoctorName.Text =dr["Doc_Name"].ToString();

                lblPatientName.Text =dr["Patient_Name"].ToString();

                lblAppointmentDate.Text =Convert.ToDateTime(dr["Appointment_Date"]).ToString("dd-MM-yyyy");

                lblTimeSlot.Text = dr["Time_Slot"].ToString();

                lblAmount.Text = dr["Doc_Fee"].ToString();

                if (dr["Booking_Status"].ToString() != "Pending Payment")
                {
                    lblMessage.Text ="This appointment is not awaiting payment.";
                    btnPay.Enabled = false;
                }
            }
            else
            {
                lblMessage.Text = "Appointment not found.";
                btnPay.Enabled = false;
            }
        }
        protected void btnPay_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            int appointmentId;

            if (!int.TryParse(Request.QueryString["aid"], out appointmentId))
            {
                lblMessage.Text = "Invalid appointment ID.";
                return;
            }

            if (rblPaymentMethod.SelectedValue == "")
            {
                lblMessage.Text = "Please select a payment method.";
                return;
            }

            getcon();

            string checkQuery =
                "SELECT COUNT(*) FROM Appointment_tbl a " +
                "INNER JOIN user_tbl u ON a.User_Id = u.Id " +
                "WHERE a.Appointment_Id = " + appointmentId +
                " AND u.Email = '" +
                Session["user"].ToString()+ "'" +
                " AND a.Booking_Status = 'Pending Payment'";

            cmd = new SqlCommand(checkQuery, con);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            if (count == 0)
            {
                con.Close();

                lblMessage.Text ="Appointment not found or payment has already been processed.";

                btnPay.Enabled = false;
                return;
            }

            // Get consultation fee from Doctor_tbl
            string amountQuery =
                "SELECT d.Doc_Fee FROM Appointment_tbl a " +
                "INNER JOIN Doctor_tbl d ON a.Doc_Id = d.Doc_Id " +
                "INNER JOIN user_tbl u ON a.User_Id = u.Id " +
                "WHERE a.Appointment_Id = " + appointmentId +
                " AND u.Email = '" +
                Session["user"].ToString()+ "'";

            cmd = new SqlCommand(amountQuery, con);

            object feeResult = cmd.ExecuteScalar();

            if (feeResult == null || feeResult == DBNull.Value)
            {
                con.Close();
                lblMessage.Text = "Consultation fee not found.";
                return;
            }

            string amount = feeResult.ToString();

            string method =rblPaymentMethod.SelectedValue.Replace("'", "''");

            string insertQuery = "INSERT INTO Payment_tbl (Appointment_Id, Payment_Method, Amount, Payment_Status, Payment_Date) " +
      "VALUES (" + appointmentId + ", '" + method + "', '" + amount.Replace("'", "''") + "', " +
      "'Success', GETDATE()); SELECT CAST(SCOPE_IDENTITY() AS INT)";

            cmd = new SqlCommand(insertQuery, con);

            int paymentId = Convert.ToInt32(cmd.ExecuteScalar());

            // Confirm the appointment after demo payment
            string updateQuery ="UPDATE Appointment_tbl SET Booking_Status = 'Confirmed' " +
                "WHERE Appointment_Id = " + appointmentId;

            cmd = new SqlCommand(updateQuery, con);
            cmd.ExecuteNonQuery();

            Response.Redirect("payment_success.aspx?pid=" + paymentId);
        }
    }
}