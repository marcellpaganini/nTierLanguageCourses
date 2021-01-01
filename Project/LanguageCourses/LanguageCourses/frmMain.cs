using Model.Lookups;
using Service;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Types;

namespace LanguageCourses
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            cboGender.DataSource = Enum.GetValues(typeof(Gender));
            LoadCourses();
        }

        private void btnNewStudent_Click(object sender, EventArgs e)
        {
            gbxNewStudent.Visible = true;
        }

        private void LoadCourses()
        {
            StudentService service = new StudentService();
            List<CourseLookup> courses = service.GetCourses();
            courses.Insert(0, new CourseLookup { CourseId = 0, CourseName = "" });
            cboCourse.ValueMember = "CourseId";
            cboCourse.DisplayMember = "CourseName";
            cboCourse.DataSource = courses;
            cboCourse.SelectedIndex = -1;
        }

        private void cboCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            int course = Convert.ToInt32(cboCourse.SelectedValue);
            StudentService service = new StudentService();
            List<GroupLookup> groups = new List<GroupLookup>();
            groups = service.GetGroupsByCourse(course);

            groups.Insert(0, new GroupLookup { GroupId = 0, GroupName = "" });
            cboGroup.ValueMember = "GroupId";
            cboGroup.DisplayMember = "GroupName";
            cboGroup.DataSource = groups;
            cboGroup.SelectedIndex = -1;
        }

        private void btnView_Click(object sender, EventArgs e)
        {
            int group = Convert.ToInt32(cboGroup.SelectedValue);
            StudentService service = new StudentService();
            dgvStudents.DataSource = service.GetStudentsByGroup(group);
        }
    }
}
