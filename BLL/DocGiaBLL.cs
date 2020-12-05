using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class DocGiaBLL
    {
        DocGiaAccess docGiaAccess = new DocGiaAccess();
        public List<DocGia> dsDocGia()
        {
            return docGiaAccess.layDanhSachDocGia();
        }
        public string xoaDocGia(string ma)
        {
            return docGiaAccess.xoaDocGia(ma);
        }
    }
}
