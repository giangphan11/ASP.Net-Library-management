using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TacGia
    {
        public string MaTG { get; set; }
        public string TenTG { get; set; }
        public string Anh { get; set; }

        public TacGia()
        {
            this.Anh = "default.jpg";
        }
    }
}
