using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DTO;
using DAL;

namespace BLL
{
    public class TheLoaiBLL
    {
        TheLoaiAccess categoryAccess = new TheLoaiAccess();
        public List<TheLoai> getListCategory()
        {
            return categoryAccess.getListCategory();
        }
        public string delete(string ma)
        {
            return categoryAccess.delete(ma);
        }
        public string create(TheLoai category)
        {
            return categoryAccess.createCategory(category);
        }
        public TheLoai findById(string ma)
        {
            return categoryAccess.findByID(ma);
        }
    }
}
