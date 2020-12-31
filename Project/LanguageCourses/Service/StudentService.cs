using Repo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class StudentService
    {
        private StudentRepo repo;

        public StudentService()
        {
            repo = new StudentRepo();
        }
    }
}
