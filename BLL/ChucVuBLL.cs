using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
namespace BLL
{
    public class ChucVuBLL
    {
        ChucVuAccess vuAccess = new ChucVuAccess();
        public List<ChucVu> getChucVu()
        {
            return vuAccess.getListChucVu();
        }
        public string xoaCV(string ma)
        {
            return vuAccess.xoaChucVu(ma);
        }
        public string themCV(ChucVu cv)
        {
            return vuAccess.themChucVu(cv);
        }
        public ChucVu getChucVuTheoMa(string ma)
        {
            return vuAccess.cv(ma);
        }

        public string suaChucVu(ChucVu chucVu)
        {
            return vuAccess.suaChucVu(chucVu);
        }
    }
}
