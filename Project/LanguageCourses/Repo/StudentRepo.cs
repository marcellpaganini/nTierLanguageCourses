using DAL;
using Model;
using Model.Lookups;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Types;

namespace Repo
{
    public class StudentRepo
    {
        private DataAccess db;

        public StudentRepo()
        {
            db = new DataAccess();
        }

        public List<CourseLookup> RetrieveCoursesList()
        {
            DataTable dt = db.GetData("CoursesLookup");

            List<CourseLookup> courses = new List<CourseLookup>();

            foreach (DataRow row in dt.Rows)
            {
                courses.Add(
                    new CourseLookup
                    {
                        CourseId = Convert.ToInt32(row["CourseId"]),
                        CourseName = row["CourseName"].ToString()
                    }
                );
            }

            return courses;
        }

        public List<GroupLookup> RetrieveGroupsByCourse(int course)
        {
            List<ParmStruct> parms = new List<ParmStruct>();
            parms.Add(new ParmStruct("@CourseId", course, 0, SqlDbType.Int, ParameterDirection.Input));

            DataTable dt = db.GetData("RetrieveGroupsByCourseId", parms);

            List<GroupLookup> groups = new List<GroupLookup>();

            foreach (DataRow row in dt.Rows)
            {
                groups.Add(
                    new GroupLookup
                    {
                        GroupId = Convert.ToInt32(row["GroupId"]),
                        GroupName = row["GroupName"].ToString()
                    }
                );
            }
            return groups;
        }

        public List<GroupLookup> RetrieveGroups()
        {

            DataTable dt = db.GetData("RetrieveGroups");

            List<GroupLookup> groups = new List<GroupLookup>();

            foreach (DataRow row in dt.Rows)
            {
                groups.Add(
                    new GroupLookup
                    {
                        GroupId = Convert.ToInt32(row["GroupId"]),
                        GroupName = row["GroupName"].ToString()
                    }
                );
            }
            return groups;
        }

        public List<StudentLookup> RetrieveStudentsByGroup(int group)
        {
            List<ParmStruct> parms = new List<ParmStruct>();
            parms.Add(new ParmStruct("@GroupId", group, 0, SqlDbType.Int, ParameterDirection.Input));

            DataTable dt = db.GetData("RetrieveStudentsByGroupId", parms);

            List<StudentLookup> students = new List<StudentLookup>();

            foreach (DataRow row in dt.Rows)
            {
                students.Add(
                    new StudentLookup
                    {
                        StudentId = Convert.ToInt32(row["StudentId"]),
                        FirstName = row["FirstName"].ToString(),
                        LastName = row["LastName"].ToString(),
                        StartDate = Convert.ToDateTime(row["StartDate"]),
                        Country = row["Country"].ToString(),
                        EmailAddress = row["EmailAddress"].ToString()
                    }
                );
            }
            return students;
        }

        public bool Delete(int studentId)
        {
            List<ParmStruct> parms = new List<ParmStruct>();
            parms.Add(new ParmStruct("@studentId", studentId, 0, SqlDbType.Int, ParameterDirection.Input));

            int retVal = db.SendData("DeleteStudent", parms);

            if (retVal > 0)
            {
                return true;
            }

            return false;
        }

        public bool Insert(Student s)
        {
            List<ParmStruct> parms = new List<ParmStruct>();

            parms.Add(new ParmStruct("@FirstName", s.FirstName, 50, SqlDbType.VarChar, ParameterDirection.Input));
            parms.Add(new ParmStruct("@LastName", s.LastName, 50, SqlDbType.VarChar, ParameterDirection.Input));
            parms.Add(new ParmStruct("@StartDate", s.StartDate, 7, SqlDbType.DateTime2, ParameterDirection.Input));
            parms.Add(new ParmStruct("@Gender", s.Gender, 0, SqlDbType.Int, ParameterDirection.Input));
            parms.Add(new ParmStruct("@Country", s.Country, 50, SqlDbType.VarChar, ParameterDirection.Input));
            parms.Add(new ParmStruct("@EmailAddress", s.EmailAddress, 50, SqlDbType.VarChar, ParameterDirection.Input));
            parms.Add(new ParmStruct("@Enrolled", s.Enrolled, 0, SqlDbType.Bit, ParameterDirection.Input));
            parms.Add(new ParmStruct("@HourlyClassPrice", s.HourlyClassPrice, 5, SqlDbType.Decimal, ParameterDirection.Input));
            parms.Add(new ParmStruct("@GroupId", s.GroupId, 0, SqlDbType.Int, ParameterDirection.Input));

            if (db.SendData("InsertStudent", parms) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
