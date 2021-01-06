using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TheLoai
    {
        public string MaTLoai { get; set; }
        public string TenTLoai { get; set; }
        public string GhiChu { get; set; }

        public TheLoai()
        {
            this.GhiChu = "Không có";
        }
        public TheLoai(string matl,string tentl, string ghichu)
        {
            this.MaTLoai = matl;
            this.TenTLoai = tentl;
            this.GhiChu = ghichu;
        }
    }
}
