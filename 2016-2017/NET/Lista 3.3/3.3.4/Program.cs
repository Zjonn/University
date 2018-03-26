using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace _3._3._4
{
    class Program
    {
        private readonly static string MUTEX_GUID = "e1ffff8f-c91d-4188-9e82-c92ca5b1d057";
        static void Main(string[] args)
        {
            Mutex m = new Mutex(false, MUTEX_GUID); ;
            Queue<Klient> s = new Queue<Klient>(10);
            Golibroda g = new Golibroda(m, s);
            for (int i = 0; i < 100; i++)
            {
                new Klient(g, m, s);
            }
        }
    }

    class Golibroda
    {
        Mutex m;
        Queue<Klient> s;
        bool isSleep = false;

        public Golibroda(Mutex m, Queue<Klient> s)
        {
            this.m = m;
            this.s = s;
            Thread t = new Thread(delegate () { run(); });
            t.Start();
        }

        void run()
        {
            while (true)
            {
                m.WaitOne();
                if (isSleep) continue;
                if (s.Count == 0) isSleep = true;
                else
                {
                    Console.WriteLine("Pracuję, w kolejce czeka " + s.Count);
                    s.Dequeue();
                }
                m.ReleaseMutex();
                Thread.Sleep(1);
            }
        }

        public void obudz()
        {
            isSleep = false;
        }
        public bool spi()
        {
            return isSleep;
        }
    }
    class Klient
    {
        Mutex m;
        Golibroda g;
        Queue<Klient> s;
        public Klient(Golibroda g, Mutex m, Queue<Klient> s)
        {
            this.m = m;
            this.g = g;
            this.s = s;
            Thread t = new Thread(delegate () { run(); });
            t.Start();
        }

        void run()
        {
            m.WaitOne();
            if (s.Count == 10)
            {
                Console.WriteLine("Wychodzę");
                m.ReleaseMutex();
                return;
            }
            Console.WriteLine("Siadam w kolejce");
            s.Enqueue(this);
            if (g.spi())
            {
                Console.WriteLine("Budzę");
                g.obudz();
            }
            m.ReleaseMutex();
        }

    }
}
