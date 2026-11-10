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
    public partial class Doctor_profile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string filenm; // store the image path
        int i; //fro store existing user means how many user are avilable in databse
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                getcon();
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                LoadDoctorProfile();
            }

        }

        void LoadDoctorProfile()
        {
            // Check QueryString
            if (Request.QueryString["did"] == null)
            {
                Response.Redirect("search_doctor.aspx");
            }

            int doctorId = Convert.ToInt32(Request.QueryString["did"]);

            getcon();


            string query = "SELECT d.Doc_Id, d.Doc_Img, d.Doc_Name, d.Doc_Experience, d.Doc_Hospital, " +
    "d.Doc_Address, d.Doc_Language, d.Doc_Degree, d.Doc_Fee, d.Doc_Certificate, d.Doc_Achivment, s.Spec_name " +
    "FROM Doctor_tbl d INNER JOIN Doctor_Specialty s ON d.Doc_Spec_Id = s.Spec_Id " +
    "WHERE d.Doc_Id = " + doctorId;

            cmd = new SqlCommand(query, con);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);


            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
            else
            {
                Response.Redirect("search_doctor.aspx");
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_doc_id")
            {
                int doctorId =Convert.ToInt32(e.CommandArgument);
                Response.Redirect("book_appoitment.aspx?did=" + doctorId);
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}