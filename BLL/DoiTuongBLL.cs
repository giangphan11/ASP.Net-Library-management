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

        public string xoaDT(string ma)
        {
            return doiTuongAccess.xoaDT(ma);
        }

        public string themDoiTuong(DoiTuong dt)
        {
            return doiTuongAccess.themDoiTuong(dt);
        }
    }
}
