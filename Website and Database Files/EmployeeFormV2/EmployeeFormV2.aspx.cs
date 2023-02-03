using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


namespace EmployeeFormV2
{
    public partial class EmployeeFormV2 : System.Web.UI.Page
    {
        string connection = "Server=team4zoodb.mysql.database.azure.com; Port=3306; Database=zoo; Uid=Team4@team4zoodb; Pwd=4thTeamRocks; SslMode=Preferred;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //Specify and connect to the DB
            using (MySqlConnection sqlConnection = new MySqlConnection(connection))
            {
                sqlConnection.Open();
                // Call the stored routine submitemployee (I custom created it inside mySQL) which will insert all the info from the webform. The parameter are in the comment below
                MySqlCommand sqlCmd = new MySqlCommand("submitemployee", sqlConnection);//(@s_ID, @s_FName, @s_MInitial, @s_LName, @s_StartDate, @s_Addr, @s_Phone, @s_Sex, @s_DOB)
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure; // specify the command "submit employee" above, which is a Stored Procedure/Routine
                sqlCmd.Parameters.AddWithValue("s_ID", id.Text); // Get values entered from the textboxes into the respective variable
                sqlCmd.Parameters.AddWithValue("s_FName", fname.Text);
                sqlCmd.Parameters.AddWithValue("s_MInitial", minitial.Text);
                sqlCmd.Parameters.AddWithValue("s_LName", lname.Text);
                sqlCmd.Parameters.AddWithValue("s_StartDate", startdate.Text);
                sqlCmd.Parameters.AddWithValue("s_Addr", address.Text);
                sqlCmd.Parameters.AddWithValue("s_Phone", phone.Text);
                sqlCmd.Parameters.AddWithValue("s_Sex", sex.Text);
                sqlCmd.Parameters.AddWithValue("s_DOB", dob.Text);
                sqlCmd.Parameters.AddWithValue("s_Email", email.Text);
                sqlCmd.Parameters.AddWithValue("s_Username", username.Text);
                sqlCmd.Parameters.AddWithValue("s_Password", password.Text);
                sqlCmd.Parameters.AddWithValue("s_Role", role.SelectedValue);



                sqlCmd.ExecuteNonQuery(); // execute query
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Form Submitted" + "');", true); // pop up message when it is done submitting
                sqlConnection.Close();
            }
        }
    }
}