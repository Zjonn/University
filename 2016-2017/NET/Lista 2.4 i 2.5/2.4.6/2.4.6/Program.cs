using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2._4._6
{
    class Program
    {
        static void Main(string[] args)
        {
            var test = from a in File.ReadAllLines("1.txt")
                       let s = a.Split(' ')
                       group s by s[1] into g
                       select new { Time = g.ElementAt(0)[0], Ip = g.ElementAt(0)[1], WWW = g.ElementAt(0)[3], Connections = g.Count() };
            var val = (from b in test
                       orderby b.Connections descending
                       select new { Ip = b.Ip, Connections = b.Connections }).Take(3);
            foreach (var arr in val)
            {
                Console.WriteLine(arr);
            }
        }
    }
}
