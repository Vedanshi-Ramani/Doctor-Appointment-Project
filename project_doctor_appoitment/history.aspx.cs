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
    public partial class history : System.Web.UI.Page
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
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    filldata();
                }
            }
        }

        void filldata()
        {
            getcon();

            string email = Session["user"].ToString();
            string search = "%" + txtSearch.Text.Trim() + "%";

            string query = @"SELECT
                                a.Appointment_Id,
                                d.Doc_Name,
                                '' AS Hospital,
                                a.Booking_Date,
                                a.Appointment_Date,
                                a.Time_Slot,
                                a.Booking_Status
                             FROM Appointment_tbl a
                             INNER JOIN user_tbl u ON a.User_Id = u.Id
                             INNER JOIN Doctor_tbl d ON a.Doc_Id = d.Doc_Id
                             WHERE u.Email = @Email
                             AND (d.Doc_Name LIKE @Search
                                  OR a.Booking_Status LIKE @Search)
                             ORDER BY a.Appointment_Date DESC";

            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Search", search);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();

            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            con.Close();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            filldata();
        }

        // CHECK WHETHER APPOINTMENT CAN BE UPDATED
        int checkAppointment(int aid)
        {
            getcon();

            string email = Session["user"].ToString();

            string query = @"SELECT COUNT(*)
                     FROM Appointment_tbl a
                     INNER JOIN user_tbl u ON a.User_Id = u.Id
                     WHERE a.Appointment_Id = @Aid
                     AND u.Email = @Email
                     AND CAST(a.Appointment_Date AS DATE) >= CAST(GETDATE() AS DATE)
                     AND a.Booking_Status IN
                     ('Pending Payment', 'Pending Approval', 'Approved', 'Confirmed')";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Aid", aid);
            cmd.Parameters.AddWithValue("@Email", email);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            return count;
        }


        // CHECK WHETHER APPOINTMENT CAN BE CANCELLED
        int checkCancel(int aid)
        {
            getcon();

            string email = Session["user"].ToString();

            string query = @"SELECT COUNT(*)
                     FROM Appointment_tbl a
                     INNER JOIN user_tbl u ON a.User_Id = u.Id
                     WHERE a.Appointment_Id = @Aid
                     AND u.Email = @Email
                     AND CAST(a.Appointment_Date AS DATE) >= CAST(GETDATE() AS DATE)
                     AND a.Booking_Status IN
                     ('Pending Payment', 'Pending Approval', 'Approved', 'Confirmed')";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Aid", aid);
            cmd.Parameters.AddWithValue("@Email", email);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            return count;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int aid = Convert.ToInt32(e.CommandArgument);

            // FEEDBACK BUTTON
            if (e.CommandName == "GiveFeedback")
            {
                Response.Redirect("feedback.aspx?Appointment_Id=" + aid);
            }


            // UPDATE BUTTON
            if (e.CommandName == "UpdateAppointment")
            {
                if (checkAppointment(aid) > 0)
                {
                    getcon();

                    string email = Session["user"].ToString();

                    string query = @"SELECT a.Doc_Id,
                                    a.Appointment_Date,
                                    a.Time_Slot
                             FROM Appointment_tbl a
                             INNER JOIN user_tbl u ON a.User_Id = u.Id
                             WHERE a.Appointment_Id = @Aid
                             AND u.Email = @Email";

                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Aid", aid);
                    cmd.Parameters.AddWithValue("@Email", email);

                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();

                    da.Fill(ds);

                    con.Close();

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        hfAppointmentId.Value = aid.ToString();

                        hfDoctorId.Value = ds.Tables[0].Rows[0]["Doc_Id"].ToString();

                        DateTime appointmentDate =
                            Convert.ToDateTime(ds.Tables[0].Rows[0]["Appointment_Date"]);

                        calDate.SelectedDate = appointmentDate;

                        lblSelectedDate.Text = appointmentDate.ToString("dd-MM-yyyy");

                        loadslots();

                        string oldSlot = ds.Tables[0].Rows[0]["Time_Slot"].ToString();

                        if (ddlTimeSlot.Items.FindByValue(oldSlot) != null)
                        {
                            ddlTimeSlot.SelectedValue = oldSlot;
                        }

                        pnlUpdate.Visible = true;
                        pnlCancel.Visible = false;
                    }
                }
                else
                {
                    lblMessage.Text = "This appointment cannot be updated.";
                }
            }


            // CANCEL BUTTON
            if (e.CommandName == "CancelAppointment")
            {
                if (checkCancel(aid) > 0)
                {
                    hfCancelAppointmentId.Value = aid.ToString();

                    pnlCancel.Visible = true;
                    pnlUpdate.Visible = false;
                }
                else
                {
                    lblMessage.Text = "This appointment cannot be cancelled.";
                }
            }

        }

        // LOAD AVAILABLE TIME SLOTS
        void loadslots()
        {
            getcon();

            int doctorId = Convert.ToInt32(hfDoctorId.Value);
            int appointmentId = Convert.ToInt32(hfAppointmentId.Value);

            DateTime selectedDate = calDate.SelectedDate;

            string query = @"SELECT DISTINCT a.Time_Slot
                             FROM Appointment_tbl a
                             WHERE a.Doc_Id = @DoctorId
                             AND NOT EXISTS
                             (
                                 SELECT 1
                                 FROM Appointment_tbl b
                                 WHERE b.Doc_Id = a.Doc_Id
                                 AND CAST(b.Appointment_Date AS DATE) = @Date
                                 AND b.Time_Slot = a.Time_Slot
                                 AND b.Booking_Status IN
                                 ('Pending Payment', 'Pending Approval', 'Confirmed')
                                 AND b.Appointment_Id <> @Aid
                             )
                             ORDER BY a.Time_Slot";

            cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@DoctorId", doctorId);
            cmd.Parameters.AddWithValue("@Date", selectedDate.Date);
            cmd.Parameters.AddWithValue("@Aid", appointmentId);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();

            da.Fill(ds);

            ddlTimeSlot.Items.Clear();

            ddlTimeSlot.Items.Add("-- Select Time Slot --");
            ddlTimeSlot.Items[0].Value = "";

            int i;

            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string slot = ds.Tables[0].Rows[i]["Time_Slot"].ToString();

                ddlTimeSlot.Items.Add(slot);
            }

            con.Close();

            if (ddlTimeSlot.Items.Count == 1)
            {
                lblSlotInfo.Text = "No available slots for this date.";
            }
            else
            {
                lblSlotInfo.Text = "Please select an available time slot.";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlUpdate.Visible = true;

            lblSelectedDate.Text = calDate.SelectedDate.ToString("dd-MM-yyyy");

            if (calDate.SelectedDate.Date < DateTime.Today)
            {
                lblSlotInfo.Text = "Please select today or a future date.";
                ddlTimeSlot.Items.Clear();
            }
            else
            {
                loadslots();
            }
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            pnlUpdate.Visible = true;

            int aid = Convert.ToInt32(hfAppointmentId.Value);
            int doctorId = Convert.ToInt32(hfDoctorId.Value);

            DateTime selectedDate = calDate.SelectedDate;

            string selectedSlot = ddlTimeSlot.SelectedValue;

            if (selectedDate.Date < DateTime.Today)
            {
                lblSlotInfo.Text = "Please select today or a future date.";
                return;
            }

            if (selectedSlot == "")
            {
                lblSlotInfo.Text = "Please select a time slot.";
                return;
            }

            if (checkAppointment(aid) == 0)
            {
                lblMessage.Text = "This appointment cannot be updated.";
                pnlUpdate.Visible = false;
                return;
            }


            // CHECK WHETHER SELECTED SLOT IS ALREADY BOOKED
            getcon();

            string checkQuery = @"SELECT COUNT(*)
                                  FROM Appointment_tbl
                                  WHERE Doc_Id = @DoctorId
                                  AND CAST(Appointment_Date AS DATE) = @Date
                                  AND Time_Slot = @Slot
                                  AND Booking_Status IN
                                  ('Pending Payment', 'Pending Approval', 'Confirmed')
                                  AND Appointment_Id <> @Aid";

            cmd = new SqlCommand(checkQuery, con);

            cmd.Parameters.AddWithValue("@DoctorId", doctorId);
            cmd.Parameters.AddWithValue("@Date", selectedDate.Date);
            cmd.Parameters.AddWithValue("@Slot", selectedSlot);
            cmd.Parameters.AddWithValue("@Aid", aid);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();


            if (count > 0)
            {
                lblSlotInfo.Text = "This time slot is already booked. Please select another slot.";
                loadslots();
                pnlUpdate.Visible = true;
                return;
            }


            // UPDATE APPOINTMENT
            getcon();

            string email = Session["user"].ToString();

            string updateQuery = @"UPDATE Appointment_tbl
                                   SET Appointment_Date = @Date,
                                       Time_Slot = @Slot,
                                       Booking_Status = 'Pending Approval'
                                   WHERE Appointment_Id = @Aid
                                   AND Doc_Id = @DoctorId
                                   AND User_Id =
                                   (SELECT Id FROM user_tbl WHERE Email = @Email)";

            cmd = new SqlCommand(updateQuery, con);

            cmd.Parameters.AddWithValue("@Date", selectedDate.Date);
            cmd.Parameters.AddWithValue("@Slot", selectedSlot);
            cmd.Parameters.AddWithValue("@Aid", aid);
            cmd.Parameters.AddWithValue("@DoctorId", doctorId);
            cmd.Parameters.AddWithValue("@Email", email);

            int result = cmd.ExecuteNonQuery();

            con.Close();

            if (result > 0)
            {
                lblMessage.Text = "Appointment updated successfully. Waiting for doctor approval.";

                pnlUpdate.Visible = false;

                filldata();
            }
            else
            {
                lblMessage.Text = "Appointment could not be updated.";
                pnlUpdate.Visible = true;
            }
        }

        protected void btnCloseUpdate_Click(object sender, EventArgs e)
        {
            pnlUpdate.Visible = false;
        }

        protected void btnYesCancel_Click(object sender, EventArgs e)
        {
            int aid = Convert.ToInt32(hfCancelAppointmentId.Value);

            if (checkCancel(aid) > 0)
            {
                getcon();

                string email = Session["user"].ToString();

                string updateQuery = @"UPDATE Appointment_tbl
                                       SET Booking_Status = 'Cancelled'
                                       WHERE Appointment_Id = @Aid
                                       AND User_Id =
                                       (SELECT Id FROM user_tbl WHERE Email = @Email)";

                cmd = new SqlCommand(updateQuery, con);

                cmd.Parameters.AddWithValue("@Aid", aid);
                cmd.Parameters.AddWithValue("@Email", email);

                int result = cmd.ExecuteNonQuery();


                if (result > 0)
                {
                    // RECORD 50% REFUND AS PENDING
                    string refundQuery = @"UPDATE Payment_tbl
                                           SET Refund_Amount = Amount * 0.50,
                                               Refund_Status = 'Refund Pending'
                                           WHERE Appointment_Id = @Aid
                                           AND Payment_Status = 'Success'";

                    cmd = new SqlCommand(refundQuery, con);

                    cmd.Parameters.AddWithValue("@Aid", aid);

                    cmd.ExecuteNonQuery();

                    lblMessage.Text = "Appointment cancelled successfully. Refund is pending.";
                }

                con.Close();

                pnlCancel.Visible = false;

                filldata();
            }
            else
            {
                lblMessage.Text = "This appointment cannot be cancelled.";
                pnlCancel.Visible = false;
            }
        }

        protected void btnNoCancel_Click(object sender, EventArgs e)
        {
            pnlCancel.Visible = false;

        }

        protected void calDate_SelectionChanged(object sender, EventArgs e)
        {
            pnlUpdate.Visible = true;

            lblSelectedDate.Text = calDate.SelectedDate.ToString("dd-MM-yyyy");

            if (calDate.SelectedDate.Date < DateTime.Today)
            {
                lblSlotInfo.Text = "Please select today or a future date.";
                ddlTimeSlot.Items.Clear();
            }
            else
            {
                loadslots();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                DateTime appointmentDate =
                    Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "Appointment_Date"));

                string timeSlot =
                    DataBinder.Eval(e.Row.DataItem, "Time_Slot").ToString();

                string status =
                    DataBinder.Eval(e.Row.DataItem, "Booking_Status").ToString();

                string startTime = timeSlot.Split('-')[0].Trim();

                DateTime appointmentTime =
                    appointmentDate.Date.Add(Convert.ToDateTime(startTime).TimeOfDay);

                System.Web.UI.WebControls.LinkButton btnFeedback =
                    (System.Web.UI.WebControls.LinkButton)e.Row.FindControl("btnFeedback");

                System.Web.UI.WebControls.LinkButton btnUpdate =
                    (System.Web.UI.WebControls.LinkButton)e.Row.FindControl("btnUpdate");

                System.Web.UI.WebControls.LinkButton btnCancel =
                    (System.Web.UI.WebControls.LinkButton)e.Row.FindControl("btnCancel");


                if (status == "Cancelled")
                {
                    btnFeedback.Visible = false;
                    btnUpdate.Visible = false;
                    btnCancel.Visible = false;
                }
                else if (appointmentTime > DateTime.Now)
                {
                    btnFeedback.Visible = false;
                    btnUpdate.Visible = true;
                    btnCancel.Visible = true;
                }
                else
                {
                    btnFeedback.Visible = true;
                    btnUpdate.Visible = false;
                    btnCancel.Visible = false;
                }
            }
        }
    }
}