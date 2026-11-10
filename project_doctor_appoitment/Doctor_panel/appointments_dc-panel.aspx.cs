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
    public partial class appointments_dc_panel : System.Web.UI.Page
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
                return;
            }

            if (!IsPostBack)
            {
                filldata();
            }
        }

        void filldata()
        {
            getcon();

            string doctor = Session["Doctor"].ToString().Replace("'", "''");

            string query =
                "SELECT Appointment_Id, Patient_Name, Mobile, " +
                "Appointment_Date, Time_Slot, Booking_Status " +
                "FROM Appointment_tbl " +
                "WHERE Doc_Id IN " +
                "(SELECT Doc_Id FROM Doctor_tbl " +
                "WHERE Doc_User_Name = '" + doctor + "') " +
                "ORDER BY Appointment_Date DESC";

            cmd = new SqlCommand(query, con);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            con.Close();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "ApproveAppointment" ||
       e.CommandName == "RejectAppointment")
            {
                if (Session["Doctor"] == null)
                {
                    Response.Redirect("login_dc_panel.aspx");
                    return;
                }

                int appointmentId = Convert.ToInt32(e.CommandArgument);

                string status = "";

                if (e.CommandName == "ApproveAppointment")
                {
                    status = "Approved";
                }
                else if (e.CommandName == "RejectAppointment")
                {
                    status = "Rejected";
                }

                string doctor = Session["Doctor"].ToString().Replace("'", "''");

                getcon();


                string query =
                    "UPDATE Appointment_tbl SET Booking_Status = '" + status + "' " +
                    "WHERE Appointment_Id = " + appointmentId +
                    " AND Booking_Status = 'Confirmed' " +
                    "AND Doc_Id IN (SELECT Doc_Id FROM Doctor_tbl " +
                    "WHERE Doc_User_Name = '" + doctor + "')";


                cmd = new SqlCommand(query, con);

                int i = cmd.ExecuteNonQuery();

                con.Close();

                if (i > 0)
                {
                    lblMessage.Text = "Appointment " + status + " successfully.";
                    lblMessage.CssClass = "text-success d-block mb-3";
                }
                else
                {
                    lblMessage.Text =
                        "Appointment not updated. Check its status and doctor ID.";
                    lblMessage.CssClass = "text-danger d-block mb-3";
                }

                filldata();
            }
        }
    }
}