using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //for connection
using System.Data;
using System.Configuration;

namespace project_doctor_appoitment.Doctor_panel
{
    public partial class dashboard_dc_panel : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Doctor"] == null)
            {
                Response.Redirect("login_dc_panel.aspx");
            }

            if (!IsPostBack)
            {
                getDashboardData();
            }
        }
        void getDashboardData()
        {
            getcon();

            string doctor = Session["Doctor"].ToString().Replace("'", "''");

            string condition =
                "Doc_Id IN (SELECT Doc_Id FROM Doctor_tbl " +
                "WHERE Doc_User_Name = '" + doctor + "')";

            // Today's Appointments
            cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Appointment_tbl WHERE " +
                condition +
                " AND CONVERT(date, Appointment_Date) = CONVERT(date, GETDATE())",
                con);

            lblToday.Text = cmd.ExecuteScalar().ToString();

            // Pending Appointments
            cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Appointment_tbl WHERE " +
                condition +
                " AND Booking_Status = 'Pending'",
                con);

            lblPending.Text = cmd.ExecuteScalar().ToString();

            // Approved Appointments
            cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Appointment_tbl WHERE " +
                condition +
                " AND Booking_Status = 'Approved'",
                con);

            lblApproved.Text = cmd.ExecuteScalar().ToString();

            // Rejected Appointments
            cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Appointment_tbl WHERE " +
                condition +
                " AND Booking_Status = 'Rejected'",
                con);

            lblRejected.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }
    }
}