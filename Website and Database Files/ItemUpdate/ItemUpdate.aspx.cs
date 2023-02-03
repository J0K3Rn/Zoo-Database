using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


namespace ItemUpdate
{
    public partial class ItemUpdate : System.Web.UI.Page
    {
        string connection = "Server=team4zoodb.mysql.database.azure.com; Port=3306; Database=zoo; Uid=Team4@team4zoodb; Pwd=4thTeamRocks; SslMode=Preferred; Convert Zero Datetime=True";


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlConnection = new MySqlConnection(connection))
            {
                try
                {
                    sqlConnection.Open();

                    //have to remove dashes for sql statements on dates
                    string sql = "UPDATE itemtype SET InStock = InStock - 1 WHERE ID = " + updateid.Text + ";";

                    MySqlCommand sqlCmd = new MySqlCommand(sql, sqlConnection);//UPDATE animal SET DeceasedDate = newDate WHERE ID = animalId;
                    sqlCmd.ExecuteNonQuery(); // execute query

                    updateMessage.Text = "<p>Updated Stock for item with id " + updateid.Text + ".</p>";
                    sqlConnection.Close();

                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.ToString());
                }
            }
        }
    }
}