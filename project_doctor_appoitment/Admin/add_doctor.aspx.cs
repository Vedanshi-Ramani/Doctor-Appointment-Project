using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace project_doctor_appoitment.Admin
{
    public partial class add_doctor : System.Web.UI.Page
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
            filenm = "Doctor_Images/" + flpimg.FileName;
            flpimg.SaveAs(Server.MapPath(filenm));
        }

        void fillspec()
        {
            getcon();
            da = new SqlDataAdapter("select*from Doctor_Specialty", con);
            ds = new DataSet();
            da.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpsepc.Items.Add(ds.Tables[0].Rows[i][2].ToString());
            }
        }

        void clear()
        {
            txtachivement.Text = "";
            txtadd.Text = "";
            txtcerti.Text = "";
            txtdcnm.Text = "";
            txtdcpass.Text = "";
            txtdcunm.Text = "";
            txtdegree.Text = "";
            txtexp.Text = "";
            txtfee.Text = "";
            txthos.Text = "";
            txtlang.Text = "";
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
            if (!IsPostBack)
            {
                fillspec();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            imgupload();
            da = new SqlDataAdapter("select * from Doctor_Specialty where Spec_name  = '" + drpsepc.SelectedItem + "' ", con);
            ds = new DataSet();
            da.Fill(ds);

            int cid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
            ViewState["cid"] = cid;
            cmd = new SqlCommand("insert into Doctor_tbl(Doc_Spec_id , Doc_Img , Doc_Name , Doc_User_Name , Doc_Pass , Doc_Experience , Doc_Hospital , Doc_Address , Doc_Language , Doc_Degree , Doc_Fee, Doc_Certificate , Doc_Achivment)" +
                "values('" + ViewState["cid"] + "' , '" + filenm + "' , '" + txtdcnm.Text + "' , '" + txtdcunm.Text + "' , '" + txtdcpass.Text + "'" +
                ",'" + txtexp.Text + "' , '" + txthos.Text + "' , '" + txtadd.Text + "' , '" + txtlang.Text + "' , '" + txtdegree.Text + "' , '" + txtfee.Text + "' , '" + txtcerti.Text + "' , '" + txtachivement.Text + "')", con);
            cmd.ExecuteNonQuery();
            clear();
        }
    }
}