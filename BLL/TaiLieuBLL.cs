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
        public void addDocument(TaiLieu tl)
        {
            tlAccess.createDocument(tl);
        }
        public string deleteDoc(string ma)
        {
            return tlAccess.deleteDoc(ma);
        }
    }
}
