using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2._5._1
{
    class Program
    {
        public Program()
        {
            const int howManyTest = 10000;

            DateTime t = DateTime.Now;

            for (int i = 0; i < howManyTest; i++)
            {
                Foos(50, i);
            }
            Console.WriteLine("Dynamic time is: {0}", DateTime.Now - t);

            t = DateTime.Now;
            for (int i = 0; i < howManyTest; i++)
            {
                Foo(50, i);
            }
            Console.WriteLine("Normal time is: {0}", DateTime.Now - t);
        }

        static void Main(string[] args)
        {
            new Program();
        }

        int Foo(int x, int y)
        {
            for (int i = 0; i < y; i++)
            {
                x = y + x + x;
            }
            return x;
        }

        dynamic Foos(dynamic x, dynamic y)
        {
            for (int i = 0; i < y; i++)
            {
                x = y * x * x;
            }
            return x;
        }
    }
}
