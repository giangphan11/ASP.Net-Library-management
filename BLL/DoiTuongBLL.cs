using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
namespace BLL
{
    public class DoiTuongBLL
    {
        DoiTuongAccess doiTuongAccess = new DoiTuongAccess();
        public List<DoiTuong> dsDoiTuong()
        {
            return doiTuongAccess.dsDoiTuong();
        }

        public List<DoiTuong> dsDoiTuong(string ten)
        {
            return doiTuongAccess.dsDoiTuong(ten);
        }

        public string xoaDT(string ma)
        {
            return doiTuongAccess.xoaDT(ma);
        }

        public DoiTuong layDoiTuong(string ma)
        {
            return doiTuongAccess.layDoiTuongTheoMa(ma);
        }

        public string themDoiTuong(DoiTuong dt)
        {
            return doiTuongAccess.themDoiTuong(dt);
        }

        public string suaDoiTuong(DoiTuong doiTuong)
        {
            return doiTuongAccess.suaDoiTuong(doiTuong);
        }
    }
}
