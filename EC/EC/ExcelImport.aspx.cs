using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EC
{
    public partial class ExcelImport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {   
            string date;
            int employeeid;
            string name;
            string workingtype;
            string start;
            string end;
            string storeid;
            string storename;
            if (FileUpload1.PostedFile != null)
            {
                try
                {
                    string path = Path.GetFileName(FileUpload1.FileName);
                    path = path.Replace(" ", "");
                    FileUpload1.SaveAs(Server.MapPath("~/Excel File/") + path);
                    String ExcelPath = Server.MapPath("~/Excel File/") + path;
                    OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");
                    mycon.Open();
                    OleDbCommand cmd = new OleDbCommand("select * from [Sheet 1$]", mycon);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {

                        date = dr[0].ToString();
                        employeeid = Convert.ToInt32(dr[1].ToString());
                        name = dr[2].ToString();
                        workingtype = dr[3].ToString();
                        start = dr[4].ToString();
                        end = dr[5].ToString();
                        storeid = dr[6].ToString();
                        storename = dr[7].ToString();
                        savedata(date, employeeid, name, workingtype, start, end, storeid, storename);


                    }
                    Label1.Text = "Data Has Been Saved Successfully";
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception)
                {
                    Label1.Text = "Your file not uploaded";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
        }


        private void savedata(string date, int employeeid, String name, String workingtype,string start,string end,string storeid,string storename)
        {
           
            String mycon = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand("Sp_InsertUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@employee_id", employeeid);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@working_type", workingtype);
            cmd.Parameters.AddWithValue("@start", start);
            cmd.Parameters.AddWithValue("@end", end);
            cmd.Parameters.AddWithValue("@storeid", storeid);
            cmd.Parameters.AddWithValue("@storename", storename);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

    }
}


