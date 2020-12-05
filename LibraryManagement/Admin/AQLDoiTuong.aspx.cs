using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BLL;

namespace LibraryManagement.Admin
{
    public partial class AQLDoiTuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                loadData();
            }
        }
        private void loadData()
        {
            DoiTuongBLL doiTuongBLL = new DoiTuongBLL();
            List<DoiTuong> dsDT = doiTuongBLL.dsDoiTuong();
            gvDoiTuong.DataSource = dsDT;
            DataBind();
        }
    }
}