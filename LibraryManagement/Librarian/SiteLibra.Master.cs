﻿using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement.Librarian
{
    public partial class SiteLibra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //NhanVien nv =(NhanVien) Session["nhanvien"];
        }
        protected void xuLyThoat(object sender, EventArgs e)
        {
            Session["nhanvien"] = null;
            Response.Redirect("/Login/LoginForm.aspx");
        }
    }
}