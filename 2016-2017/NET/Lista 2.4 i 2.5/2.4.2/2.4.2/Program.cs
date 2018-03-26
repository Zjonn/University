using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2._4._2
{
    class Program
    {
        static void Main(string[] args)
        {
            StreamReader s = new StreamReader(" ");
            Console.WriteLine(from l in Array.ConvertAll(File.ReadAllLines(""), int.Parse)
                              where l > 100
                              orderby l descending
                              select l);
            Array.ConvertAll(File.ReadAllLines(""), int.Parse).Where(l => (l > 100)).OrderByDescending(l => l).Select(l => l);

        }
    }
}
