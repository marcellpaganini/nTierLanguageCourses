using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Student
    {
        public int StudentId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime StartDate { get; set; }
        public int Gender { get; set; }
        public string Country { get; set; }
        public string EmailAddress { get; set; }
        public bool Enrolled { get; set; }
        public decimal HourlyClassPrice { get; set; }
        public int GroupId { get; set; }
    }
}
