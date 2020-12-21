using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
namespace BLL
{
    public class TacGiaBLL
    {
        TacGiaAccess access = new TacGiaAccess();
        public List<TacGia> getTacGias()
        {
            return access.getAllTacGia();
        }
        public int themTacGia(TacGia tg)
        {
            return access.themTacGia(tg);
        }
    }
}
