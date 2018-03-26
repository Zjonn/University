using System;
using System.Runtime.InteropServices;
using System.Text;

namespace _2._2._1
{

    class Program
    {
        [DllImport("Advapi32.dll", CharSet = CharSet.Unicode)]
        public static extern bool GetUserName([MarshalAs(UnmanagedType.LPTStr)] StringBuilder lpBuffer, ref int lpnSize);
        [DllImport("User32.dll", CharSet = CharSet.Unicode)]
        public static extern int MessageBox(IntPtr hWnd, string lpText, [MarshalAs(UnmanagedType.LPTStr)] string lpCaption, uint uType);
        static void Main(string[] args)
        {
            StringBuilder s = new StringBuilder(100);
            int size = 100;
            GetUserName(s, ref size);
            MessageBox(new IntPtr(0), s.ToString(), "Hello Dialog", 0);
        }
    }
}
