using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ado_net.Models
{
    public class Personel
    {
        [Display(Name = "کد")]
        public int ID { get; set; }
        [Display(Name = "نام کاربری")]
        public string uname { get; set; }
        [Display(Name = "کلمه عبور")]
        public string pass { get; set; }
        [Display(Name = "نام")]
        public string name { get; set; }
        [Display(Name = "نام خانوادگی")]
        public string family { get; set; }
        [Display(Name = "کدملی")]
        public string mellicode { get; set; }
        [Display(Name = "تلفن همراه")]
        public string mobile { get; set; }       
        public int roleid { get; set; }
        [Display(Name = "سطح دسترسی")]
        public string rolename { get; set; }
    }
}
