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
    public partial class WebForm1 : System.Web.UI.Page
    {
        const string srcImage = "~/images/tacgia/";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }
        }
        private void loadData()
        {
            List<TacGia> dsTG = new TacGiaBLL().getTacGias();
            foreach(TacGia tg in dsTG)
            {
                tg.Anh = ResolveUrl(srcImage + tg.Anh);
            }
            GridView1.DataSource = dsTG;
            DataBind();
        }


        private void alertz(string z)
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + z + "')", true);

        }


        protected void btnThem_Click(object sender, EventArgs e)
        {
            TacGia tg = new TacGia();
            tg.MaTG = txtMa.Text;
            tg.TenTG = txtTen.Text;
            string path = Server.MapPath(srcImage);
            fileAnh.PostedFile.SaveAs(path + fileAnh.FileName);
            if (fileAnh.HasFile)
            {
                tg.Anh = fileAnh.FileName;
            }
            int kq = new TacGiaBLL().themTacGia(tg);
            if(kq > 0)
            {
                alertz("Thêm tác giả thành công !");
            }
            else
            {
                alertz("Thêm lỗi");
            }
            
        }

        protected void btnQuaylai_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/AQLTaiLieu.aspx");
        }
    }
}