using ado_net.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;


namespace ado_net.Controllers
{
    public class PersonelController : Controller
    {
        ConnectionString c = new ConnectionString();
        SqlConnection Con;

        public IActionResult Index()
        {
          //  string a = TempData["uname"].ToString();
            Check_Permission(HttpContext.Session.GetString("uname"));
            return View(Get_Personels());
        }
        public IEnumerable<Personel> Get_Personels()
        {
            try
            {
                Con = new SqlConnection(c.Con);
                SqlCommand cmd = new SqlCommand("select_all_personels", Con);
                Con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                string rolename = "";

                List<Personel> personel_list = new List<Personel>();              
                    while (dr.Read())
                    {
                  
                        if (dr["roleid"].Equals(1))
                        {
                            rolename = "مدیر";
                        }
                        else
                        {
                            rolename = "کاربر عادی";
                        }
                        personel_list.Add(new Personel()
                        {
                            ID = (int)dr["ID"],
                            uname = dr["uname"].ToString(),
                            pass = dr["pass"].ToString(),
                            name = dr["name"].ToString(),
                            family = dr["family"].ToString(),
                            mellicode = dr["mellicode"].ToString(),
                            mobile = dr["mobile"].ToString(),
                            rolename = rolename
                        }) ;
                    }        
                    
                Con.Close();
                return personel_list;
            }
            catch (Exception exp)
            {
                throw;
            }


        }

        public void Check_Permission(string username)
        {
            //username = TempData["uname"].ToString();
            Con = new SqlConnection(c.Con);
            SqlCommand cmd = new SqlCommand("check_permission", Con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uname", username);
            
            Con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr["role"].ToString().ToLower().Equals("admin"))
                {
                    TempData["class"] = "visible";
                }
                else
                {
                    TempData["class"] = "hidden";
                }
            }
            Con.Close();
        }
    }
}
