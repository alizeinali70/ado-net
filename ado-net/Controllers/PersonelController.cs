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
           
            return View( Get_Personels());
        }
        public IEnumerable<Personel> Get_Personels()
        {
            try
            {
                Con = new SqlConnection(c.Con);
                SqlCommand cmd = new SqlCommand("select_all_personels", Con);               
                Con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                Personel p = new Personel();
                List<Personel> personel_list = new List<Personel>();
                foreach(var data in dr)
                {
                    p.ID = (int)data["ID"];
                    p.uname = dr["uname"].ToString();
                    p.pass = dr["pass"].ToString();
                    p.name = dr["name"].ToString();
                    p.family = dr["family"].ToString();
                    p.mellicode = dr["mellicode"].ToString();
                    p.mobile = dr["mobile"].ToString();
                    personel_list.Add(p);
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
