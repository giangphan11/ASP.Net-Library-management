using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class NhanVien
    {
        public string MaNV { get; set; }
        public string TenNV { get; set; }
        public string MaCV { get; set; }
        public string Username { get; set; }
        public string PassWord { get; set; }
        public int Quyen { get; set; }

        public NhanVien() { }
        public NhanVien(string ma, string ten, string macv, string uname, string pass, int quyen)
        {
            this.MaNV = ma;
            this.TenNV = ten;
            this.MaCV = macv;
            this.Username = uname;
            this.PassWord = pass;
            this.Quyen = quyen;
        }
    }
}
