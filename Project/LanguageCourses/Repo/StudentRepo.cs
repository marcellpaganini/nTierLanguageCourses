using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repo
{
    public class StudentRepo
    {
        private DataAccess db;

        public StudentRepo()
        {
            db = new DataAccess();
        }
    }
}
