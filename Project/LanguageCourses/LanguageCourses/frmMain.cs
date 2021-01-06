using Model;
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
        private Student _std;
        bool active;

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

            StudentService service = new StudentService();
            List<GroupLookup> groups = new List<GroupLookup>();
            groups = service.GetGroups();

            groups.Insert(0, new GroupLookup { GroupId = 0, GroupName = "" });
            cboGroups.ValueMember = "GroupId";
            cboGroups.DisplayMember = "GroupName";
            cboGroups.DataSource = groups;
            cboGroups.SelectedIndex = -1;
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

        private void btnDelete_Click(object sender, EventArgs e)
        {
            int selectedRowIndex = dgvStudents.SelectedCells[0].RowIndex;
            DataGridViewRow selectedRow = dgvStudents.Rows[selectedRowIndex];
            int studentId = Convert.ToInt32(selectedRow.Cells[0].Value);

            if (MessageBox.Show("Are you sure you want to delete the current record?", "Warning",
                    MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
            {
                return;
            }

            StudentService service = new StudentService();
            service.Delete(studentId);

            int student = Convert.ToInt32(cboGroup.SelectedValue);
            dgvStudents.DataSource = service.GetStudentsByGroup(student);
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            StudentService service = new StudentService();

            _std = new Student();
            PopulateStudentObject();


            if (service.AddStudent(_std))
            {
                MessageBox.Show("Student inserted successfully.");
            }
            else 
            {
                MessageBox.Show("Insert Failed.");
            }
        }

        public void PopulateStudentObject()
        {

            if (cbxEnrolled.Checked == true)
            {
                active = true;
            }
            else
            {
                active = false;
            }

            _std.FirstName = txtFirstName.Text.Trim();
            _std.LastName = txtLastName.Text.Trim();
            _std.StartDate = dtpStartDate.Value;
            _std.Gender = Convert.ToInt32(cboGender.SelectedValue);
            _std.Country = txtCountry.Text.Trim();
            _std.EmailAddress = txtEmail.Text.Trim();
            _std.Enrolled = active;
            _std.HourlyClassPrice = Convert.ToDecimal(txtPrice.Text.Trim());
            _std.GroupId = Convert.ToInt32(cboGroups.SelectedValue);
        }
    }
}
