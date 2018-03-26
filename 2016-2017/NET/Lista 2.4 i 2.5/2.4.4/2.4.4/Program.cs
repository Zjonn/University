using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2._4._4
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] f = Directory.GetFiles(@"D:\Inne");
            foreach(string st in f)
            {
                Console.WriteLine(st);
            }

            int s = f.Aggregate(0,(a1,a2) => a1 + Path.GetFileName(a2).Length);
            Console.WriteLine(s);
            
        }
    }
}
