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
        public string xoaNhanVien(string ma)
        {
            return vienAccess.xoaNhanVien(ma);
        }
        public string themNhanVien(NhanVien nv)
        {
            return vienAccess.themNhanVien(nv);
        }
    }
}
