using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;

namespace QLSV1
{
    public partial class UCThongTinChuongTrinh : UserControl
    {
        public UCThongTinChuongTrinh()
        {
            InitializeComponent();
        }

        private void btnLienHe_Click(object sender, EventArgs e)
        {
            using (Process process = new Process())
            {
                process.StartInfo.FileName = "mailto:ducminhvudlt@gmail.com";
                process.Start();
            }
        }
    }
}
