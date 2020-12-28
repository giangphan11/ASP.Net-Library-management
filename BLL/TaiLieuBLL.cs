using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BLL
{
    public class TaiLieuBLL
    {
        TaiLieuAccess tlAccess = new TaiLieuAccess();
        public List<TaiLieu> getListDocument()
        {
            return tlAccess.getListDocument();
        }

        public List<TaiLieu> getListDocument(string ten)
        {
            return tlAccess.getListDocument(ten);
        }



        public void addDocument(TaiLieu tl)
        {
            tlAccess.createDocument(tl);
        }
        public TaiLieu GetTaiLieuTheoMa(string ma)
        {
            return tlAccess.getTaiLieuTheoMa(ma);
        }
        public string deleteDoc(string ma)
        {
            return tlAccess.deleteDoc(ma);
        }

        public string suaTaiLieu(TaiLieu taiLieu)
        {
            return tlAccess.suaTaiLieu(taiLieu);
        }
    }
}
