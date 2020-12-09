using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TaiLieu
    {
        public string MaTLieu { get; set; }
        public string TenTLieu { get; set; }
        public string MaTLoai { get; set; }
        public int SLuong { get; set; }
        public string NXB { get; set; }
        public int NamXB { get; set; }
        public string TG { get; set; }

        public TaiLieu()
        {

        }
        public TaiLieu(string maTlieu,string tenTlieu,string maTloai,int sl, string nxb,int namXB,string tg)
        {
            this.MaTLieu = MaTLieu;
            this.TenTLieu = TenTLieu;
            this.MaTLoai = maTloai;
            this.SLuong = sl;
            this.NXB = nxb;
            this.NamXB = namXB;
            this.TG = tg;

        }
    }
}
