using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ado_net.Controllers
{
    public class DashboardController : Controller
    {
        public IActionResult Index()
        {
            TempData["uname"] = HttpContext.Session.GetString("uname");

            return View();
        }
    }
}
