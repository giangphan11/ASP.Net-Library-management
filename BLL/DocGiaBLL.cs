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
        public string suaDocGia(DocGia docGia)
        {
            return docGiaAccess.suaDocGia(docGia);
        }
        public DocGia layDocGia(string ma)
        {
            return docGiaAccess.layDocGiaTheoMa(ma);
        }
        public string xoaDocGia(string ma)
        {
            return docGiaAccess.xoaDocGia(ma);
        }
        public string themDocGia(DocGia docGia)
        {
            return docGiaAccess.themDocGia(docGia);
        }

        public List<DocGia> dsDocGia(string ten)
        {
            return docGiaAccess.layDanhSachDocGia(ten);
        }
    }
}
