using System;
using System.Windows.Forms;

namespace _3._1._2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void numericUpDown1_Click(object sender, EventArgs e)
        {
            pb1.Value = (int)numericUpDown1.Value;
        }

        private void więcejToolStripMenuItem1_Click(object sender, EventArgs e)
        {
        }
    }
}
