using BLL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class LoginForm : System.Web.UI.Page
    {

        private string snackbarScript;
        protected void Page_Load(object sender, EventArgs e)
        {
            snackbarScript = GenerateSnackbarJS();
            if (Application["nhanvien"] != null)
            {
                Server.Transfer("/Login/ControlForm.aspx");
                //Response.Redirect("/Home1.aspx");
                
            }
        }
        private string GenerateSnackbarJS()
        {

            StringBuilder sb = new StringBuilder();
            sb.AppendLine("var x = document.getElementById('snackbar');");
            sb.AppendLine("x.className = 'show';");
            sb.AppendLine("setTimeout(function(){ x.className = x.className.replace('show', ''); }, 3000);");
            return sb.ToString();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string uname = txtEmail.Text;
            string pass = txtPass.Text;
            NhanVienBLL nhanVienBLL = new NhanVienBLL();
            List<NhanVien> dsNhanVien = nhanVienBLL.getAllNhanVien();

            bool flag = false;

            foreach (NhanVien nv in dsNhanVien)
            {
                if (nv.Username.Equals(uname) && nv.PassWord.Equals(pass))
                {
                    Application["nhanvien"] = nv;
                    flag = true;
                    Server.Transfer("/Login/ControlForm.aspx");
                }
            }
            if (flag == false)
            {
                Snack.Text = "Đăng nhập thất bại !!!";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "snackbar", snackbarScript, true);
                return;
            }
        }
    }
}