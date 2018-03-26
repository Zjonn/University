using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3._3._2
{
    class Program
    {
        static void Main(string[] args)
        {
            Set s = new Set();
            s.Peek();
            s.Pop(5);
            s.Pop(10);
            Console.WriteLine(s.Peek().ToString());
        }
    }

    class Set : Stack
    {
        int p = -1;
        Object[] o;
        public Set()
        {
            o = new Object[10];
        }

        public Set(int initialCapacity) : base(initialCapacity)
        {
            o = new Object[initialCapacity];
        }

        public Set(ICollection col) : base(col)
        {
            o = new Object[col.Count];
            foreach (Object n in col)
            {
                Pop(n);
            }
        }

        public override Object Peek()
        {
            if (p == -1)
            {
                return null;
            }

            Object r = o[p];
            p--;
            return r;
        }

        public void Pop(Object o)
        {
            if (p == this.o.Length - 1)
            {
                throw new IndexOutOfRangeException();
            }
            if (p < 0 || this.o[p] != o)
            {
                this.o[++p] = o;
            }
        }
    }
}
