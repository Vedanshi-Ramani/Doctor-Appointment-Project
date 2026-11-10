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
    public partial class add_specialty : System.Web.UI.Page
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

        void imgupload()
        {
            filenm = "specility_images/" + flpimg.FileName;
            flpimg.SaveAs(Server.MapPath(filenm));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                getcon();
            }
            else
            {
                Response.Redirect("admin_login.aspx");
            }
        }
        void clear()
        {
            txtDescription.Text = "";
            txtSpecialty.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            imgupload();
            cmd = new SqlCommand("insert into Doctor_Specialty (Spec_Image , Spec_name , Spec_desc) values( '" + filenm + "' , '"+txtSpecialty.Text+"' , '"+txtDescription.Text+"' )", con);
            cmd.ExecuteNonQuery();
            clear();
        }
    }
}