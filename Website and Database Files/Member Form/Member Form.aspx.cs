using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Member_Form
{

    public partial class Member_Form : System.Web.UI.Page
    {
        string connection = "Server=team4zoodb.mysql.database.azure.com; Port=3306; Database=zoo; Uid=Team4@team4zoodb; Pwd=4thTeamRocks; SslMode=Preferred;";
        // TODO: Create task to create a new member
        // TODO: Create task to get list of all members
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void SubmitMember_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlConnection = new MySqlConnection(connection))
            {

                string sql = "INSERT INTO member (Email, FName, MInitial, LName) VALUES ('" + AddMEmail.Text + "', '" + AddMFname.Text + "', '" + AddMMInit.Text + "', '" + AddMLName.Text + "');";

                sqlConnection.Open();
                // Call the stored routine submitemployee (I custom created it inside mySQL) which will insert all the info from the webform. The parameter are in the comment below
                MySqlCommand sqlCmd = new MySqlCommand(sql, sqlConnection);//(@s_ID, @s_FName, @s_MInitial, @s_LName, @s_StartDate, @s_Addr, @s_Phone, @s_Sex, @s_DOB)

                sqlCmd.ExecuteNonQuery(); // execute query
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Form Submitted" + "');", true); // pop up message when it is done submitting
                sqlConnection.Close();
            }
        }

        protected void GetMembers_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlConnection = new MySqlConnection(connection))
            {
                try
                {
                    sqlConnection.Open();

                    string sql = "SELECT * FROM member;";

                    MySqlCommand sqlCmd = new MySqlCommand(sql, sqlConnection);//(@s_ID, @s_FName, @s_MInitial, @s_LName, @s_StartDate, @s_Addr, @s_Phone, @s_Sex, @s_DOB)
                    MySqlDataReader rdr = sqlCmd.ExecuteReader();

                    //starts table element and adds header row 
                    string dynamicTable = "<table cellpadding='5' cellspacing='0' style='border: 1px solid #ccc;font-size: 9pt;'><tr>";
                    //adding header row of table

                    dynamicTable += "<th  style=\"margin-left:20px\">Email</th><th style=\"margin-left:20px\">FName</th><th style=\"margin-left:20px\">MInitial</th><th style=\"margin-left:20px\"LName</th><th style=\"margin-left:20px\">StartDate</th>";

                    while (rdr.Read())
                    {
                        //adding row to table
                        dynamicTable += "<tr>";
                        for (int i = 0; i < 5; i++)
                        {
                            //adding the data value for the column
                            System.Diagnostics.Debug.WriteLine(rdr[i].ToString());

                            dynamicTable += "<td style=\"margin-left:20px\">" + rdr[i].ToString() + "</td>";
                        }
                        dynamicTable += "</tr>";

                    }


                    dynamicTable += "</table>";

                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Form Submitted" + "');", true); // pop up message when it is done submitting
                    sqlConnection.Close();

                    //adding the table to the webpage
                    reportTable.Text = dynamicTable;

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
            }
        }

        protected void DeleteMember_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlConnection = new MySqlConnection(connection))
            {

                string sql = "DELETE FROM member WHERE Email = '" + Del_MEmail.Text + "';";

                sqlConnection.Open();
                // Call the stored routine submitemployee (I custom created it inside mySQL) which will insert all the info from the webform. The parameter are in the comment below
                MySqlCommand sqlCmd = new MySqlCommand(sql, sqlConnection);//(@s_ID, @s_FName, @s_MInitial, @s_LName, @s_StartDate, @s_Addr, @s_Phone, @s_Sex, @s_DOB)

                sqlCmd.ExecuteNonQuery(); // execute query
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Account Banished" + "');", true); // pop up message when it is done submitting
                sqlConnection.Close();
            }
        }

        protected void ReportMember_Click(object sender, EventArgs e)
        {
            //Specify and connect to the DB
            using (MySqlConnection sqlConnection = new MySqlConnection(connection))
            {
                try
                {
                    sqlConnection.Open();

                    //number of columns in report
                    int numberOfCols = 0;

                    // generateString generates the sql statement for the query. numberOfCals being passedbyreference
                    string sql = generateString(ref numberOfCols);

                    MySqlCommand sqlCmd = new MySqlCommand(sql, sqlConnection);// SELECT (list of attributes checked off) FROM animal WHERE (list of attributes filled out);
                    MySqlDataReader rdr = sqlCmd.ExecuteReader();

                    //starts table element and adds header row 
                    string dynamicTable = "<table cellpadding='5' cellspacing='0' style='border: 1px solid #ccc;font-size: 9pt;'><tr>";
                    //generate header makes the header row for the table
                    dynamicTable += generateHeader() + "</tr>";

                    System.Diagnostics.Debug.WriteLine(numberOfCols);


                    while (rdr.Read())
                    {
                        //adding row to table
                        dynamicTable += "<tr>";
                        for (int i = 0; i < 5; i++)
                        {
                            //adding the data value for the column
                            System.Diagnostics.Debug.WriteLine(rdr[i].ToString());

                            dynamicTable += "<td style=\"margin-left:20px\">" + rdr[i].ToString() + "</td>";
                        }
                        dynamicTable += "</tr>";

                    }


                    dynamicTable += "</table>";

                    sqlConnection.Close();

                    //adding the table to the webpage
                    MEMreport.Text = dynamicTable;

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
            }
        }
        protected string generateString(ref int numberOfCols)
        {
            string query = "SELECT * FROM member";
            string where = "";

           // if (includestartdate.Checked)
           // {
                if (MemStartDate.Text != "")
                {
                    if (beforedate.Checked)
                        where += "StartDate < '" + MemStartDate.Text + "'";
                    else if (afterdate.Checked)
                        where += "StartDate > '" + MemStartDate.Text + "'";
                    else
                        where += "StartDate = '" + MemStartDate.Text + "'";
                }

           // }
           
            //adds the where clause if at least one field is filled out
            if (where.Length > 0)
            {
                //substring removes final ","
                numberOfCols = 5;
                query += " WHERE " + where.Substring(0, where.Length);
            }
            else if (numberOfCols == 0)
            {
                numberOfCols = 5;
                //query = "SELECT * FROM member";
            }
            
            //used for debugging, writes query to console
            query += ";";
            System.Diagnostics.Debug.WriteLine(query);
            return query;
        }

        protected string generateHeader()
        {
            string head = "";

         /*   if (beforedate.Checked)
            {
                head += "<th  style=\"margin-left:20px\">StartDate</th>";
            }
            if (afterdate.Checked)
            {
                head += "<th  style=\"margin-left:20px\">StartDate</th>";
            }
            */
            if (head.Length == 0)
                return "<th  style=\"margin-left:20px\">Email</th><th style=\"margin-left:20px\">FName</th><th style=\"margin-left:20px\">MInitial</th><th style=\"margin-left:20px\"LName</th><th style=\"margin-left:20px\">StartDate</th";

            return head;
        }

    }
}