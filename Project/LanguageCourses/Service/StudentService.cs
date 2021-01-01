using Model.Lookups;
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

        public List<CourseLookup> GetCourses()
        {
            return repo.RetrieveCoursesList();
        }

        public List<GroupLookup> GetGroupsByCourse(int course)
        {
            return repo.RetrieveGroupsByCourse(course);
        }

        public List<StudentLookup> GetStudentsByGroup(int group)
        {
            return repo.RetrieveStudentsByGroup(group);
        }

    }
}
