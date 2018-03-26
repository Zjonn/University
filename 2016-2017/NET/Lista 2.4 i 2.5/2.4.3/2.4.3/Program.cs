using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2._4._3
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(from s in File.ReadAllLines("")
                              group s by s[0] into g
                              orderby g descending
                              select g); 
        }
    }
}
