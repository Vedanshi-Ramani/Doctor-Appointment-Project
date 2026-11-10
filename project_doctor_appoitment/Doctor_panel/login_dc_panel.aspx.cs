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
    public partial class login_dc_panel : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int i; //fro store existing user means how many user are avilable in databse
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            if (!(string.IsNullOrEmpty(txtdcnm.Text)) && !(string.IsNullOrEmpty(txtpass.Text)))
            {
                cmd = new SqlCommand("select count(*) from Doctor_tbl where Doc_User_Name= '" + txtdcnm.Text + "' and Doc_Pass = '" + txtpass.Text + "'", con);
                i = Convert.ToInt16(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Session["Doctor"] = txtdcnm.Text;
                    Response.Redirect("dashboard_dc_panel.aspx");
                }
                else
                {
                    Response.Write("Wrong username or password");
                }
            }
        }
    }
}