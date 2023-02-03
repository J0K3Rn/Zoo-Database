using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace ItemForm
{
    public partial class ItemForm : System.Web.UI.Page
    {

        string connection = "Server=team4zoodb.mysql.database.azure.com; Port=3306; Database=zoo; Uid=Team4@team4zoodb; Pwd=4thTeamRocks; SslMode=Preferred;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlConnection = new MySqlConnection(connection))
            {
                try
                {
                    sqlConnection.Open();

                    //have to remove dashes for sql statements on dates
                    string sql = "UPDATE itemtype SET InStock = InStock + " + updatestock.Text + " WHERE ID = " + updateid.Text + ";";

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
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlConnection = new MySqlConnection(connection))
            {

                string sql = "INSERT INTO itemtype (ID, InStock, Name, GiftShop_ShopID) VALUES (" + ItemID.Text + ", " + InitialStock.Text +", '" + ItemName.Text + "', " + GiftshopID.Text + ");";

                sqlConnection.Open();
                // Call the stored routine submitemployee (I custom created it inside mySQL) which will insert all the info from the webform. The parameter are in the comment below
                MySqlCommand sqlCmd = new MySqlCommand(sql, sqlConnection);//(@s_ID, @s_FName, @s_MInitial, @s_LName, @s_StartDate, @s_Addr, @s_Phone, @s_Sex, @s_DOB)

                sqlCmd.ExecuteNonQuery(); // execute query
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Form Submitted" + "');", true); // pop up message when it is done submitting
                sqlConnection.Close();
            }
        }

        protected void ReportButton_Click(object sender, EventArgs e)
        {
            //Specify and connect to the DB
            using (MySqlConnection sqlConnection = new MySqlConnection(connection))
            {
                try
                {
                    sqlConnection.Open();

                    //number of columns in report
                    int numberOfCols = 0;

                    // generateString generates the sql statement for the query. numberOfCols being passedbyreference
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

            if (includeid.Checked)
            {
                numberOfCols++;
                query += "ID,";
            }
            if (includestock.Checked)
            {
                numberOfCols++;
                query += "InStock,";
            }
            if (includename.Checked)
            {
                numberOfCols++;
                query += "Name,";
            }
            if (includegiftshopid.Checked)
            {
                numberOfCols++;
                query += "GiftShop_ShopID,";
            }


            if (reportItemID.Text != "")
                where += "ID = " + reportItemID.Text + " AND ";
            if (reportInStock.Text != "")
            {
                //have to remove dashes for where clause
                if (stockb.Checked)
                    where += "InStock < " + reportInStock.Text + " AND ";
                else if (stocka.Checked)
                    where += "InStock > " + reportInStock.Text + " AND ";
                else
                    where += "InStock = " + reportInStock + " AND ";
            }
            if (reportItemName.Text != "")
            { 
                where += "Name = '" + reportItemName.Text + "' AND ";
            }
            if (reportGiftshopID.Text != "")
                where += "GiftShop_ShopID = " + reportGiftshopID.Text + " AND ";
            
            //substring removes final ","
            query = query.Substring(0, query.Length - 1) + " FROM itemtype";

            //adds the where clause if at least one field is filled out
            if (where.Length > 0)
            {
                query += " WHERE " + where.Substring(0, where.Length - 4);    //i do -4 to remove the final "AND "
            }
            else if (numberOfCols == 0)
            {
                numberOfCols = 4;
                query = "SELECT * FROM itemtype";
            }
            //used for debugging, writes query to console
            System.Diagnostics.Debug.WriteLine(query);
            return query + ";";
        }

        protected string generateHeader()
        {
            string head = "";

            if (includeid.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Item ID</th>";
            }
            if (includestock.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Current Stock</th>";
            }
            if (includename.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Item Name</th>";
            }
            if (includegiftshopid.Checked)
            {
                head += "<th  style=\"margin-left:20px\">Giftshop ID</th>";
            }
            // all checkboxes were left blank
            if (head.Length == 0) {
                head += "<th  style=\"margin-left:20px\">Item ID</th>";
                head += "<th style=\"margin-left:20px\">Current Stock</th>";
                head += "<th style=\"margin-left:20px\">Item Name</th>";
                head += "<th style=\"margin-left:20px\">GiftShopID</th>";
            }
            return head;
        }
    }
}