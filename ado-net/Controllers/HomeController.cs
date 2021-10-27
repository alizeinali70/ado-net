using ado_net.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Http;

namespace ado_net.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        ConnectionString c = new ConnectionString();
        SqlConnection Con;
        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {          
            return View("Login");
        }
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Login(string username, string password)
        {
            Con = new SqlConnection(c.Con);
            SqlCommand cmd = new SqlCommand("select_user_login", Con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uname", username);
            cmd.Parameters.AddWithValue("@pass", password);
            Con.Open();
            cmd.ExecuteNonQuery();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                HttpContext.Session.SetString("uname", username);
                TempData["uname"]= HttpContext.Session.GetString("uname");
                Con.Close();
                return RedirectToAction("Index", "Dashboard");               
            }
            else
            {
                Con.Close();
                return View();
            }
        }

        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Register(string username, string password)
        {
            Con = new SqlConnection(c.Con);
            SqlCommand cmd = new SqlCommand("insert_user", Con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uname", username);
            cmd.Parameters.AddWithValue("@pass", password);
            Con.Open();
            cmd.ExecuteNonQuery();
            return View("Login");
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
