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

        }

        private void btnNewStudent_Click(object sender, EventArgs e)
        {
            gbxNewStudent.Visible = true;
        }
    }
}
