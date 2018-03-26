using System;
using System.Drawing;
using System.Windows.Forms;


namespace _3._1._3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.DoubleBuffered = true;
            this.Paint += Form1_Paint;
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            int x = 1, y = 1, w = 290, h = 290;
            int sx = (x + w) / 2, sy = (y + h) / 2;
            Graphics g = e.Graphics;


            g.DrawEllipse(Pens.Black, new Rectangle(new Point(x, y), new Size(new Point(w, h))));

            int hour = DateTime.Now.Hour * 15;
            Pen hPen = new Pen(Color.Navy, 8);
            hPen.EndCap = System.Drawing.Drawing2D.LineCap.ArrowAnchor;
            g.DrawLine(hPen, new Point(sx, sy), rotateOverPoint(sx, sy, sx, y + 30, hour));

            int min = DateTime.Now.Minute * 6;
            Pen minPen = new Pen(Color.SkyBlue, 5);
            minPen.EndCap = System.Drawing.Drawing2D.LineCap.ArrowAnchor;
            g.DrawLine(minPen, new Point(sx, sy), rotateOverPoint(sx, sy, sx, y + 15, min));

            int sec = DateTime.Now.Second * 6;
            Pen secPen = new Pen(Color.Red, 2);
            secPen.EndCap = System.Drawing.Drawing2D.LineCap.ArrowAnchor;
            g.DrawLine(secPen, new Point(sx, sy), rotateOverPoint(sx, sy, sx, y+10, sec));
     
        }

        private Point rotateOverPoint(int cX, int cY, int pX, int pY, int angleInDegrees)
        {
            double angleInRadians = angleInDegrees * (Math.PI / 180);
            int px = (int)(Math.Cos(angleInRadians) * (cX - cX) - Math.Sin(angleInRadians) * (pY - cY) + cX);
            int py = (int)(Math.Sin(angleInRadians) * (cX - cX) + Math.Cos(angleInRadians) * (pY - cY) + cX);
            return new Point(px, py);
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            this.Refresh();
        }
    }
}
