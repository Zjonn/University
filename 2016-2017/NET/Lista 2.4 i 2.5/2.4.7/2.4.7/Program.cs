using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2._4._7
{
    class Program
    {
        static void Main(string[] args)
        {
            var item = new { Field1 = "The value", Field2 = 5 };
            var item1 = new { Field1 = "The value", Field2 = 5, Field3 = "test" };
            var l = CreateEmptyGenericList(item);
            l.Add(item);
            Console.WriteLine(l[0].Field1);
            //l.Add(item1);

        }

        static List<T> CreateEmptyGenericList<T>(T example)
        {
            return new List<T>();
        }
    }
}

