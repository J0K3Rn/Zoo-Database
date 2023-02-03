using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Text;
using MySql.Data.MySqlClient;


namespace Zoo2
{
    public partial class AnimalReport : System.Web.UI.Page
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
                    string noDashesDate = updatedeath.Text.Substring(0, 4) + updatedeath.Text.Substring(5, 2) + updatedeath.Text.Substring(8, 2);
                    string sql = "UPDATE animal SET DeceasedDate = " + noDashesDate + " WHERE ID = " + updateid.Text + ";";

                    MySqlCommand sqlCmd = new MySqlCommand(sql, sqlConnection);//UPDATE animal SET DeceasedDate = newDate WHERE ID = animalId;
                    sqlCmd.ExecuteNonQuery(); // execute query

                    string message = "Updated Decease Date for animal with id: " + updateid.Text;

                    reportTable.Text = "<p>Updated Deceased Date for animal with id " + updateid.Text + ".</p>";
                    sqlConnection.Close();

                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.ToString());
                }
            }
        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //Specify and connect to the DB
            using (MySqlConnection sqlConnection = new MySqlConnection(connection))
            {
                try {
                    sqlConnection.Open();
                    // Call the stored routine submitemployee (I custom created it inside mySQL) which will insert all the info from the webform. The parameter are in the comment below
                    int numberOfCols = 0;

                    // generateString generates the sql statement for the query. numberOfCols being passedbyreference
                    string sql = generateString(ref numberOfCols);

                    MySqlCommand sqlCmd = new MySqlCommand(sql, sqlConnection);//(@s_ID, @s_FName, @s_MInitial, @s_LName, @s_StartDate, @s_Addr, @s_Phone, @s_Sex, @s_DOB)
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
                        for(int i = 0; i < numberOfCols; i++)
                        {
                            //adding the data value for the column
                            System.Diagnostics.Debug.WriteLine("gets here" + i);
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
                catch(Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
            }
        }
        protected string generateString(ref int numberOfCols)
        {
            string query = "SELECT ";
            string where = "";

            if (includename.Checked)
            {
                numberOfCols++;
                query += "Name,";
            }
            if (includeanimalid.Checked)
            {
                numberOfCols++;
                query += "ID,";
            }
            if (includebreed.Checked)
            {
                numberOfCols++;
                query += "Breed,";
            }
            if (includearrivaldate.Checked)
            {
                numberOfCols++;
                query += "ArrivalDate,";
            }
            if (includespecies.Checked)
            {
                numberOfCols++;
                query += "Species,";
            }
            if (includediet.Checked)
            {
                numberOfCols++;
                query += "Diet,";
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
            if (includecarerid.Checked)
            {
                numberOfCols++;
                query += "Employee_ID,";
            }
            if (includeattractionname.Checked)
            {
                numberOfCols++;
                query += "Attraction_Name,";
            }
            if (includedeathdate.Checked)
            {
                numberOfCols++;
                query += "DeceasedDate,";
            }


            if (Name.Text != "")
                where += "Name = '" + Name.Text + "' AND ";
            if (AnimalID.Text != "")
                where += "ID = " + AnimalID.Text + " AND ";
            if (Breed.Text != "")
                where += "Breed = '" + Breed.Text + "' AND ";
            if (ArrivalDate.Text != "") {
                //have to remove dashes for where clause
                string temp = ArrivalDate.Text.Substring(0, 4) + ArrivalDate.Text.Substring(5, 2) + ArrivalDate.Text.Substring(8, 2);

                if(arrivalb.Checked)
                    where += "ArrivalDate < " + temp + " AND ";
                else if (arrivala.Checked)
                    where += "ArrivalDate > " + temp + " AND ";
                else
                    where += "ArrivalDate = " + temp + " AND ";
            }
            if (Species.Text != "")
                where += "Species = '" + Species.Text + "' AND ";
            if (Diet.Text != "")
                where += "Diet = '" + Diet.Text + "' AND ";
            if (Sex.Text != "")
                where += "Sex = '" + Sex.Text + "' AND ";
            if (DOB.Text != "") {
                //have to remove dashes for where clause
                string temp = DOB.Text.Substring(0, 4) + DOB.Text.Substring(5, 2) + DOB.Text.Substring(8, 2);

                if (dobb.Checked)
                    where += "DOB < " + temp + " AND ";
                else if (doba.Checked)
                    where += "DOB > " + temp + " AND ";
                else
                    where += "DOB = " + temp + " AND ";
            }
            if (CarerID.Text != "")
                where += "Employee_ID = " + CarerID.Text + " AND ";
            if (AttractionName.Text != "")
                where += "Attraction_Name = '" + AttractionName.Text + "' AND ";
            if (DeathDate.Text != "") {
                //have to remove dashes for where clause
                string temp = DeathDate.Text.Substring(0,4) + DeathDate.Text.Substring(5,2) + DeathDate.Text.Substring(8,2);

                if (deathb.Checked)
                    where += "DeceasedDate < " + temp + " AND ";
                else if (deatha.Checked)
                    where += "DeceasedDate > " + temp + " AND ";
                else
                    where += "DeceasedDate = " + temp + " AND ";
            }

            query = query.Substring(0, query.Length - 1) + " FROM animal";

            //adds the where clause if at least one field is filled out
            if (where.Length > 0)
            {
                //substring removes final ","
                query += " WHERE " + where.Substring(0, where.Length - 4);    //i do -4 to remove the final "AND "
            }
            else if(numberOfCols == 0)
            {
                numberOfCols = 11;
                query = "SELECT * FROM animal";
            }
            //used for debugging, writes query to console
            System.Diagnostics.Debug.WriteLine(query);
            return query + ";";
        }

        protected string generateHeader()
        {
            string head = "";

            if (includename.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Name</th>";
            }
            if (includeanimalid.Checked)
            {
                head += "<th  style=\"margin-left:20px\">AnimalID</th>";
            }
            if (includebreed.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Breed</th>";
            }
            if (includearrivaldate.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Arrival Date</th>";
            }
            if (includespecies.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Species</th>";
            }
            if (includediet.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Diet</th>";
            }
            if (includesex.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Sex</th>";
            }
            if (includedob.Checked)
            {
                head += "<th  style=\"margin-left:20px\">DOB</th>";
            }
            if (includecarerid.Checked)
            {
                head += "<th  style=\"margin-left:20px\">CarerID</th>";
            }
            if (includeattractionname.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Attraction Name</th>";
            }
            if (includedeathdate.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Deceased Date</th>";
            }

            if (head.Length == 0)
                return "<th  style=\"margin-left:20px\">Name</th><th style=\"margin-left:20px\">AnimalID</th><th style=\"margin-left:20px\">Breed</th><th style=\"margin-left:20px\">Arrival Date</th><th style=\"margin-left:20px\">Species</th><th style=\"margin-left:20px\">Diet</th><th style=\"margin-left:20px\">Sex</th><th style=\"margin-left:20px\">DOB</th><th style=\"margin-left:20px\">CarerID</th><th style=\"margin-left:20px\">Attraction Name</th><th  style=\"margin-left:20px\">Deceased Date</th>";

            return head;
        }
    }
}