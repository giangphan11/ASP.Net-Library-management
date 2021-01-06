using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;

namespace LibraryManagement.Librarian
{
    public partial class TTMuonSach : System.Web.UI.Page
    {
        private NhanVien nv;
        protected void Page_Load(object sender, EventArgs e)
        {
            nv = (NhanVien)Application["nhanvien"];
            if (nv == null)
            {
                Server.Transfer("/Login/LoginForm.aspx");
            }
            drNhanVien.Enabled = false;
            drDocGia.Enabled = false;
            if (!IsPostBack)
            {
                loadDropDocGia();
                loadDropNhanVien();
                loadDropTaiLieu();
            }

        }


        private void loadDropTaiLieu()
        {
            List<TaiLieu> dsTL = new TaiLieuBLL().getListDocument();
            drSach.DataSource = dsTL;
            drSach.DataValueField = "MaTLieu";
            drSach.DataTextField = "TenTLieu";
            DataBind();
        }

        private void alertz(string z)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + z + "')", true);

        }
        public void clearText()
        {
            DateTime now = DateTime.Now;
            //txtMaDocGia.Text = "";
            //txtTenDocGia.Text = "";
            txtNgayMuon.Text = now.ToString("yyyy-MM-dd");
            //txtMaNhanVien.Text = "";
            //txtTenNhanVien.Text = "";
        }



        public void loadDgv()
        {
            PhieuMuonSachBUS obj_phieu = new PhieuMuonSachBUS();
            DataTable dtb = obj_phieu.chiTietMuonSach(txtMaPhieu.Text);
            GridView1.DataSource = dtb;

            //thay doi dinh dang date trong datatable


            //cuon nao tra roi se duoc danh dau mau


            for (int i = 0; i < GridView1.Rows.Count - 1; i++)
            {
                if (GridView1.Rows[i].Cells[4].Text == "Đã trả")
                {
                    GridView1.Rows[i].ForeColor = Color.Red;
                }
            }

            //dinh dang lai ngay/thang/nam trong dgv
            //GridView1.Columns[3].DefaultCellStyle.Format = "dd/MM/yyyy";
            DataBind();
        }

        private void loadDropDocGia()
        {
            List<DocGia> dsDocGia = new DocGiaBLL().dsDocGia();
            drDocGia.DataSource = dsDocGia;
            drDocGia.DataValueField = "MaDG";
            drDocGia.DataTextField = "TenDG";
            DataBind();
        }
        private void loadDropNhanVien()
        {
            //drNhanVien.Items.Clear();
            List<NhanVien> dsNhanVien = new NhanVienBLL().getAllNhanVien();
            drNhanVien.DataSource = dsNhanVien;
            //foreach(NhanVien nv in dsNhanVien)
            //{
            //    ListItem item = new ListItem(nv.MaNV, nv.TenNV);
            //    //DropDownList1.Items.Insert(0, new ListItem("Add New", ""));

            //    drNhanVien.Items.Add(item);
            //}
            drNhanVien.DataValueField = "MaNV";
            drNhanVien.DataTextField = "TenNV";
            DataBind();
        }
        protected void btnTimKiemMaPhieu_Click(object sender, ImageClickEventArgs e)
        {
            PhieuMuonSachBUS obj_phieu = new PhieuMuonSachBUS();
            //hien thi len textbox
            try
            {
                //Mang gia tri
                string[] param = obj_phieu.layThongTinPhieu2(txtMaPhieu.Text);

                if (txtMaPhieu.Text == "")
                {
                    alertz("Mã phiếu không được để trống");
                    return;
                }

                Regex reg = new Regex(@"^[P]\d{2,4}$");
                if (!reg.IsMatch(txtMaPhieu.Text))
                {
                    alertz("Mã phiếu bắt đầu từ P theo sau là 2-4 số, ví dụ: P01");
                    return;
                }

                if (param[0] == null)
                {
                    alertz("Không tìm thấy mã phiếu :" + txtMaPhieu.Text);
                    clearText();
                    return;
                }

                //dua len textbox
                //drDocGia.se  = param[1];
                drDocGia.SelectedValue = param[0];
                //txtTenDocGia.Text = param[1];
                txtNgayMuon.Text = param[2];
                drNhanVien.SelectedValue = param[3];
                //drNhanVien.Text = param[4];
                //txtTenNhanVien.Text = param[4];
            }
            catch
            {
                alertz("Có lỗi, kiểm tra lại!");
            }

            //neu nhu chua co gi thi thong bao nhap
            DataTable dtb = obj_phieu.chiTietMuonSach(txtMaPhieu.Text);
            if (dtb.Rows.Count == 0)
            {
                alertz("Phiếu hiện tại chưa có tài liệu mượn, hãy nhập thông tin");
                return;
            }

            //hien thi tren bang chi tiet
            try
            {
                loadDgv();
            }
            catch
            {
                alertz("Có lỗi!");
            }
        }

        protected void btnNhapLai_Click(object sender, EventArgs e)
        {
            clearText();
            drNhanVien.Enabled = true;
            drDocGia.Enabled = true;
            drNhanVien.SelectedValue = nv.MaNV;
        }

        protected void btnTaoPhieu_Click(object sender, EventArgs e)
        {
            //regex
            Regex reg = new Regex(@"^[P]\d{2,5}$");
            if (!reg.IsMatch(txtMaPhieu.Text))
            {
                alertz("Sai định dạng mã phiếu, ví dụ: P01");
                return;
            }

            //if (txtTenNhanVien.Text == "" || txtTenDocGia.Text == "")
            //{
            //    alertz("Hãy nhập đầy đủ thông tin");
            //    return;
            //}

            //them phieu
            try
            {
                PhieuMuonSachBUS obj_phieu = new PhieuMuonSachBUS();
                DateTime ngayMuon = DateTime.Parse(txtNgayMuon.Text);
                PhieuMuon pm = new PhieuMuon(txtMaPhieu.Text, drDocGia.SelectedValue, drNhanVien.SelectedValue, ngayMuon);
                obj_phieu.themPhieu(pm);

                alertz("Tạo phiếu thành công, nhập tài liệu mượn");

                //cho phép nhập và hiển thị thông tin chi tiết tài liệu mượn của Phiếu vừa tạo ra:
                loadDgv();

            }
            catch
            {
                alertz("Đã tồn tại mã phiếu: " + txtMaPhieu.Text);
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            Regex reg = new Regex(@"^[P]\d{2,5}$");
            if (!reg.IsMatch(txtMaPhieu.Text))
            {
                alertz("Sai định dạng mã phiếu, ví dụ: P01");
                return;
            }


            try
            {
                //xoa
                PhieuMuonSachBUS obj_phieu = new PhieuMuonSachBUS();
                obj_phieu.XoaPhieu(txtMaPhieu.Text);
                txtMaPhieu.Text = "";
                //txtMaDocGia.Text = "";
                //txtMaNhanVien.Text = "";
                drNhanVien.Enabled = false;
                drDocGia.Enabled = false;

                alertz("Đã xóa");
            }
            catch
            {
                alertz("Lỗi Xóa - Phiếu mượn đang tồn tại các thông tin tài liệu mượn");
            }

        }

        protected void de_btnNhap_Click(object sender, EventArgs e)
        {
            drSach.Enabled = true;
            txtNgayTra.Enabled = true;
            txtSLMuon.Enabled = true;
        }

        protected void de_btnChoMuon_Click(object sender, EventArgs e)
        {
            PhieuMuonSachBUS obj_phieu = new PhieuMuonSachBUS();
            //tạo một đối tượng chi tiết
            PhieuMuonChiTiet CT = new PhieuMuonChiTiet();
            CT.MaPMuon = txtMaPhieu.Text; //mã lấy mã hiện tại của Phiếu
            CT.MaSach = drSach.SelectedValue;
            CT.SLMuon = Convert.ToInt32(txtSLMuon.Text);
            DateTime dt = DateTime.Parse(txtNgayTra.Text);
            CT.NgayTra = dt;
            CT.TrangThai = "Đang mượn";

            //mã phiếu không được thiếu
            if (txtMaPhieu.Text == "")
            {
                alertz("Hãy điền mã phiếu !");
                return;
            }

            //kiểm tra ngày hợp lệ
            /*DateTime now = DateTime.Now;
            DateTime enter_value = dtpNgayTra.Value;
            if (now > enter_value) {
                MessageBox.Show("Thời gian không hợp lệ - Thời gian > ngày hiện tại");
                //quay tro lai ngay hien tai
                dtpNgayTra.Value = now;
                return;
            }*/

            //điều kiện hợp lê: số lương có >= số lượng mượn
            if (obj_phieu.check_soLuong(drSach.SelectedValue, Convert.ToInt32(txtSLMuon.Text)))
            {
                try
                {
                    //Thêm thông tin vào phiếu chi tiết
                    obj_phieu.themChiTietTaiLieuMuon(CT);

                    //cập nhật lại số lượng còn lại trong bảng Tài Liêu:
                    obj_phieu.capNhatSoLuongThem(drSach.SelectedValue, Convert.ToInt32(txtSLMuon.Text));

                    //load du lieu

                    loadDgv();
                    //MessageBox.Show("Thành công!");
                }
                catch
                {
                    alertz("Thêm lỗi - kiểm tra mã phiếu, hoặc mã tài liệu đã tồn tại!");
                }
            }
            else
            {
                alertz("Số lượng hiện tại không đủ!");
                txtSLMuon.Focus();
            }
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            alertz(GridView1.SelectedRow.Cells[1].Text);
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {

        }
    }
}