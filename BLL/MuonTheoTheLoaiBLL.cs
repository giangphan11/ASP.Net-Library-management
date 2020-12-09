using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
namespace BLL
{
    public class MuonTheoTheLoaiBLL
    {

        public List<MuonTheoTheLoai> muonTheoTheLoaisAll(DateTime date)
        {
            return new MuonTheoTheLoaiAccess().muonTheoTheLoaisALL(date);
        }
        public List<MuonTheoTheLoai> muonTheoTheLoaisDate(DateTime date1, DateTime date2)
        {
            return new MuonTheoTheLoaiAccess().muonTheoTheLoaisDate(date1, date2);
        }
    }
}
