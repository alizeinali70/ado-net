using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ado_net.Models
{
    public class Public
    {
        public bool Is_Exist(string username, string password)
        {
            //{
            //    SqlCommand cmd = new SqlCommand("is_exist", con);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddWithValue("@uname", username);
            //    cmd.Parameters.AddWithValue("@pass", password);
            //    con.Open();
            //    cmd.ExecuteNonQuery();

            //    SqlDataReader dr = cmd.ExecuteReader();

            //    if (dr.Read())
            //    {
            //        return RedirectToAction("Index", "Dashboard");
            //        con.Close();
            //    }
            //    else
                    return true;
            //    con.Close();
            //}
        }
    }
}