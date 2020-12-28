using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DocGia
    {
        public string MaDG { get; set; }
        public string TenDG { get; set; }
        public string GT { get; set; }
        public string NgaySinh { get; set; }
        public string MaDT { get; set; }
        public string NgayCap { get; set; }
        public string NgayGiaHan { get; set; }
        public string Anh { get; set; }
        public DocGia()
        {
            this.Anh = "df.png";
        }
    }
}
