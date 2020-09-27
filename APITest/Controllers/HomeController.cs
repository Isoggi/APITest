using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;

namespace APITest.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }

        [Route("Login")]
        public ActionResult Login()
        {
            ViewBag.Title = "Login";
            return View();
        }

        [Route("Register")]
        public ActionResult Register()
        {
            ViewBag.Title = "Register";
            return View();
        }
    }
}
