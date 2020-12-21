using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace LibraryManagement
{
    public partial class ATraSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void alertz(string z)
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + z + "')", true);

        }



        protected void btnTimKiem_Click(object sender, EventArgs e)
        {

            PhieuTraSachBUS obj = new PhieuTraSachBUS();
            if (txtMaDG.Text != "")
            {
                if (!obj.check_maDG(txtMaDG.Text))
                {
                    //thong bao
                    lbThongBao.Text = "Không tồn tại mã độc giả: " + txtMaDG.Text;
                    lbThongBao.ForeColor = Color.Red;
                    //lbThongBao.Show();

                    //Disnable
                    //list1.Enabled = false;
                    //list1.ForeColor = Color.Gray;

                    //list2.Enabled = false;
                    //list2.ForeColor = Color.Gray;
                }
                else
                {
                    //enable
                    GridView1.Enabled = true;
                    GridView1.ForeColor = Color.Black;

                    GridView2.Enabled = true;
                    GridView2.ForeColor = Color.Black;

                    //do du lieu
                    DataTable dt = obj.timkiem(txtMaDG.Text);
                    GridView1.DataSource = dt;
                    DataBind();

                    //nếu như với mã DG vừa tìm đc không có phiếu mượn nào thì disnable list2
                    if (dt.Rows.Count == 0)
                    {
                        GridView2.Enabled = false;
                        GridView2.ForeColor = Color.Gray;
                    }

                    //thong bao
                    lbThongBao.Text = "Kết quả tìm được: " + (GridView1.Rows.Count) + " phiếu mượn";
                    lbThongBao.ForeColor = Color.Blue;
                    //lbThongBao.Show();
                }
            }
            else
            {
                alertz("Mã độc giả không được để trống!");
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            PhieuTraSachBUS obj = new PhieuTraSachBUS();
            //lay ma phieu
            string maPhieu = GridView1.SelectedRow.Cells[1].Text;

            //Mang gia tri
            string[] param = obj.layThongTinPhieu(maPhieu);
            string ngay = param[2].Substring(0, 9);
            string oDate = Convert.ToDateTime(ngay).ToString("dd/MM/yyyy");

            //hien thi label
            lbMaPhieu.Text = maPhieu;
            lbMaDocGia.Text = param[0];
            lbTenDocGia.Text = param[1];
            lbNgayMuon.Text = oDate;
            lbMaNV.Text = param[3];
            lbTenNV.Text = param[4];

            //hien thi chi tiet cac tai lieu muon (PhieuMuonChiIiet5)
            loadList2();
        }


        public void loadList2()
        {
            try
            {
                PhieuTraSachBUS obj = new PhieuTraSachBUS();
                //int dong = list1.CurrentCell.RowIndex;
                string maPhieu = GridView1.SelectedRow.Cells[1].Text;

                DataTable dt = new DataTable();
                dt = obj.chiTietMuonSach(maPhieu);
                GridView2.DataSource = dt;
                //GridView2.Columns[3].DefaultCellStyle.Format = "dd/MM/yyyy";
                DataBind();
                //dinh dang lai ngay/thang/nam trong dgv
                

            }
            catch
            {
                alertz("Có lỗi, vui lòng kiểm tra lại");
            }
        }

        protected void GridView22_SelectedIndexChanged(object sender, EventArgs e)
        {
            //hien thi len form tailieu
            txtMaSach.Text = GridView2.SelectedRow.Cells[1].Text;
            txtTenSach.Text = GridView2.SelectedRow.Cells[2].Text;
            txtMaPhieu.Text = lbMaPhieu.Text;
            txtSoLuongTra.Text = GridView2.SelectedRow.Cells[3].Text;

            //button
            btnTraSach.Enabled = true;
        }

        protected void btnTraSach_Click(object sender, EventArgs e)
        {
            PhieuTraSachBUS obj = new PhieuTraSachBUS();
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            obj.traSach(lbMaPhieu.Text, txtMaSach.Text, Convert.ToInt32(txtSoLuongTra.Text), date);
            loadList2();
            alertz("Trả thành công!");
            btnTraSach.Enabled = false;
        }
    }
}