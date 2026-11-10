using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient; //for connection
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_doctor_appoitment
{
    public partial class search_doctor : System.Web.UI.Page
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
                fillspec();
                LoadDoctors();
            }
        }


     

        void fillspec()
        {
            getcon();

            drpspec.Items.Clear();
            // First option
            drpspec.Items.Add(new ListItem("All Specializations", ""));

            da = new SqlDataAdapter("SELECT * FROM Doctor_Specialty", con);
            ds = new DataSet();
            da.Fill(ds);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpspec.Items.Add(new ListItem(
                        ds.Tables[0].Rows[i]["Spec_name"].ToString(),ds.Tables[0].Rows[i]["Spec_Id"].ToString()) );
            }
        }


        void LoadDoctors(string doctorName = "", string specId = "")
        {
            getcon();

            string query = "SELECT TOP 6 d.Doc_Id, d.Doc_Img, d.Doc_Name, " +
                           "d.Doc_Hospital, d.Doc_Experience, d.Doc_Fee, s.Spec_name " +
                           "FROM Doctor_tbl d " +
                           "INNER JOIN Doctor_Specialty s ON d.Doc_Spec_Id = s.Spec_Id " +
                           "WHERE 1 = 1";

            // Create the SqlCommand object
            cmd = new SqlCommand();
            cmd.Connection = con;

            // Doctor Name filter
            if (!string.IsNullOrEmpty(doctorName))
            {
                query += " AND d.Doc_Name LIKE @DoctorName";
                cmd.Parameters.AddWithValue(
                    "@DoctorName", "%" + doctorName.Trim() + "%");
            }

            // Specialization filter
            if (!string.IsNullOrEmpty(specId))
            {
                query += " AND d.Doc_Spec_Id = @SpecId";
                cmd.Parameters.AddWithValue("@SpecId", specId);
            }

            query += " ORDER BY d.Doc_Id ASC";

            // Assign SQL query to command
            cmd.CommandText = query;

            // Execute query and get data
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            // Display doctors in DataList
            DataList1.DataSource = ds;
            DataList1.DataBind();

            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string doctorName = txtdcnm.Text.Trim();
            string specId = drpspec.SelectedValue;
            //string fee = txtFeeRange.Text.Trim();

            LoadDoctors(doctorName, specId );

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txtdcnm.Text = "";

            //txtFeeRange.Text = "";

            drpspec.SelectedIndex = 0;

            // Again display first 3 doctors
            LoadDoctors();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_doc_pro")
            {
                int did = Convert.ToInt16(e.CommandArgument);
                ViewState["did"] = did;
                Response.Redirect("Doctor_Profile.aspx?did=" + ViewState["did"]);
            }
        }
    }
}