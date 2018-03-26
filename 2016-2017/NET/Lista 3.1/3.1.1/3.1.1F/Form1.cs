using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _3._1._1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void Ok(object sender, EventArgs e)
        {
            MessageBox.Show(tbUczelnia.Text + "\n" + tbAdres.Text + "\nStudia " + cmbNauki.Text + "\n" +
                ((cbDzienne.Checked) ? "dzienne " : "") + ((cbUzupelniajace.Checked) ? "uzupelniające" : ""), "Uczelnia");
        }

        private void Cancel(object sender, EventArgs e)
        {
            Close();
        }

    }
}
