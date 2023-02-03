using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


namespace EmployeeReport
{
    public partial class EmployeeReport : System.Web.UI.Page
    {
        string connection = "Server=team4zoodb.mysql.database.azure.com; Port=3306; Database=zoo; Uid=Team4@team4zoodb; Pwd=4thTeamRocks; SslMode=Preferred; Convert Zero Datetime=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
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
                        for (int i = 0; i < numberOfCols; i++)
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
                    reportTable.Text = dynamicTable;

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
            }
        }
        protected string generateString(ref int numberOfCols)
        {
            string query = "SELECT ";
            string where = "";

            if (includefname.Checked)
            {
                numberOfCols++;
                query += "FName,";
            }
            if (includeminitial.Checked)
            {
                numberOfCols++;
                query += "MInitial,";
            }
            if (includelname.Checked)
            {
                numberOfCols++;
                query += "LName,";
            }
            if (includeid.Checked)
            {
                numberOfCols++;
                query += "ID,";
            }
            if (includestartdate.Checked)
            {
                numberOfCols++;
                query += "StartDate,";
            }
            if (includeaddr.Checked)
            {
                numberOfCols++;
                query += "Addr,";
            }
            if (includephone.Checked)
            {
                numberOfCols++;
                query += "Phone,";
            }
            if (includesex.Checked)
            {
                numberOfCols++;
                query += "Sex,";
            }
            if (includedob.Checked)
            {
                numberOfCols++;
                query += "DOB,";
            }


            if (fname.Text != "")
                where += "FName = '" + fname.Text + "' AND ";
            if (minitial.Text != "")
                where += "MInitial = " + minitial.Text + " AND ";
            if (lname.Text != "")
                where += "LName = '" + lname.Text + "' AND ";
            if (id.Text != "")
                where += "ID = '" + id.Text + "' AND ";
            if (startdate.Text != "")
            {
                //have to remove dashes for where clause
                string temp = startdate.Text.Substring(0, 4) + startdate.Text.Substring(5, 2) + startdate.Text.Substring(8, 2);

                if (startdateb.Checked)
                    where += "StartDate < " + temp + " AND ";
                else if (startdatea.Checked)
                    where += "StartDate > " + temp + " AND ";
                else
                    where += "StartDate = " + temp + " AND ";
            }
            if (addr.Text != "")
                where += "Addr = '" + addr.Text + "' AND ";
            if (phone.Text != "")
            {
                //removing dashes in phone number
                string temp = phone.Text.Substring(0, 3) + phone.Text.Substring(4, 3) + phone.Text.Substring(8, 4);
                where += "Phone = '" + temp + "' AND ";
            }
            if (sex.Text != "")
                where += "Sex = '" + sex.Text + "' AND ";
            if (dob.Text != "")
            {
                //have to remove dashes for where clause
                string temp = dob.Text.Substring(0, 4) + dob.Text.Substring(5, 2) + dob.Text.Substring(8, 2);

                if (dobb.Checked)
                    where += "dob < " + temp + " AND ";
                else if (doba.Checked)
                    where += "dob > " + temp + " AND ";
                else
                    where += "dob = " + temp + " AND ";
            }

            query = query.Substring(0, query.Length - 1) + " FROM employee";

            //adds the where clause if at least one field is filled out
            if (where.Length > 0)
            {
                //substring removes final ","
                query += " WHERE " + where.Substring(0, where.Length - 4);    //i do -4 to remove the final "AND "
            }
            else if (numberOfCols == 0)
            {
                numberOfCols = 9;
                query = "SELECT * FROM employee";
            }
            //used for debugging, writes query to console
            System.Diagnostics.Debug.WriteLine(query);
            return query + ";";
        }

        protected string generateHeader()
        {
            string head = "";

            if (includefname.Checked)
            {
                head += "<th  style=\"margin-left:20px\">First Name</th>";
            }
            if (includeminitial.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Middle Initial</th>";
            }
            if (includelname.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Last Name</th>";
            }
            if (includeid.Checked)
            {
                head += "<th  style=\"margin-left:20px\">ID</th>";
            }
            if (includestartdate.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Start Date</th>";
            }
            if (includeaddr.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Address</th>";
            }
            if (includephone.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Phone</th>";
            }
            if (includesex.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Sex</th>";
            }
            if (includedob.Checked)
            {
                head += "<th  style=\"margin-left:20px\">DOB</th>";
            }

            //all checkboxes were left blank
            if (head.Length == 0)
            {
                head += "<th  style=\"margin-left:20px\">First Name</th>";
                head += "<th  style=\"margin-left:20px\">Middle Initial</th>";
                head += "<th  style=\"margin-left:20px\">Last Name</th>";
                head += "<th  style=\"margin-left:20px\">ID</th>";
                head += "<th  style=\"margin-left:20px\">Start Date</th>";
                head += "<th  style=\"margin-left:20px\">Address</th>";
                head += "<th  style=\"margin-left:20px\">Phone</th>";
                head += "<th  style=\"margin-left:20px\">Sex</th>";
                head += "<th  style=\"margin-left:20px\">DOB</th>";

            }

            return head;
        }
    }
}