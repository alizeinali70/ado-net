using ado_net.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;


namespace ado_net.Controllers
{
    public class PersonelController : Controller
    {
        ConnectionString c = new ConnectionString();
        SqlConnection Con;

        public IActionResult Index()
        {

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

                
                List<Personel> personel_list = new List<Personel>();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        personel_list.Add(new Personel()
                        {
                            ID = (int)dr["ID"],
                            uname = dr["uname"].ToString(),
                            pass = dr["pass"].ToString(),
                            name = dr["name"].ToString(),
                            family = dr["family"].ToString(),
                            mellicode = dr["mellicode"].ToString(),
                            mobile = dr["mobile"].ToString()
                        });
                    }
                }
                Con.Close();
                return personel_list;
            }
            catch (Exception exp)
            {

                throw;
            }


        }
    }
}
