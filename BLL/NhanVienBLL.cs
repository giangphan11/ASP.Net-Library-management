using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
namespace BLL
{
    public class NhanVienBLL
    {
        NhanVienAccess vienAccess = new NhanVienAccess();
        public List<NhanVien> getAllNhanVien()
        {
            return vienAccess.layDanhSachNhanVien();
        }
    }
}
