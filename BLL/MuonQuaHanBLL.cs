using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;
namespace BLL
{
    public class MuonQuaHanBLL
    {
        public List<MuonQuaHan> muonQuaHans()
        {
            return new MuonQuaHanAccess().listMuonQUaHan();  
        }
    }
}
