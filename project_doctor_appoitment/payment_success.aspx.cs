using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_doctor_appoitment
{
    public partial class payment_success : System.Web.UI.Page
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
                LoadPaymentDetails();
            }
        }

        void LoadPaymentDetails()
        {
            int paymentId;

            if (!int.TryParse(Request.QueryString["pid"], out paymentId))
            {
                lblStatus.Text = "Invalid Payment ID";
                return;
            }

            getcon();

            string query =
                "SELECT p.Payment_Id, p.Payment_Method, p.Amount, " +
                "p.Payment_Status, p.Payment_Date, " +
                "a.Patient_Name, a.Appointment_Date, a.Time_Slot, " +
                "d.Doc_Name " +
                "FROM Payment_tbl p " +
                "INNER JOIN Appointment_tbl a " +
                "ON p.Appointment_Id = a.Appointment_Id " +
                "INNER JOIN Doctor_tbl d " +
                "ON a.Doc_Id = d.Doc_Id " +
                "INNER JOIN user_tbl u ON a.User_Id = u.Id " +
                "WHERE p.Payment_Id = " + paymentId +
                " AND u.Email = '" +
                Session["user"].ToString() + "'" +
                " AND p.Payment_Status = 'Success'";

            da = new SqlDataAdapter(query, con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];

                lblPaymentId.Text =dr["Payment_Id"].ToString();

                lblDoctor.Text = dr["Doc_Name"].ToString();

                lblPatient.Text =dr["Patient_Name"].ToString();

                lblDate.Text =Convert.ToDateTime(dr["Appointment_Date"])
                    .ToString("dd-MM-yyyy");

                lblTime.Text =dr["Time_Slot"].ToString();

                lblMethod.Text =dr["Payment_Method"].ToString();

                lblAmount.Text =dr["Amount"].ToString();

                lblStatus.Text =dr["Payment_Status"].ToString();

                lblPaymentDate.Text =Convert.ToDateTime(dr["Payment_Date"])
                    .ToString("dd-MM-yyyy hh:mm tt");
            }
            else
            {
                lblStatus.Text ="Payment record not found.";
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
    }
}