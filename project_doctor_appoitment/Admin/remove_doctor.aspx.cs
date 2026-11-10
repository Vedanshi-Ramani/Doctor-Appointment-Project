using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //for connection
using System.Data;
using System.Configuration;

namespace project_doctor_appoitment.Admin
{
    public partial class remove_doctor : System.Web.UI.Page
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
            if (Session["admin"] != null)
            {
                getcon();
                fillgrid();
            }
            else
            {
                Response.Redirect("admin_login.aspx");
            }

        }

        void fillgrid()
        {
            da = new SqlDataAdapter("select  d.Doc_Name ,d.Doc_Id, s.Spec_name from Doctor_Specialty s inner join Doctor_tbl d ON d.Doc_Spec_Id = s.Spec_Id ", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmddel")
            {
                getcon();
                cmd = new SqlCommand("delete from Doctor_tbl where Doc_Id = '" + e.CommandArgument + "' ", con);
                cmd.ExecuteNonQuery();
                fillgrid();
            }

        }
    }
}