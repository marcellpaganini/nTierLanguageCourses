using DAL;
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
    }
}
