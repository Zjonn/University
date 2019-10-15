using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zad3
{
    class zad3
    {
        static void Main()
        {

        }
    }

    public class Plane
    {
        string name;
        public Plane(string name)
        {
            this.name = name;
        }
    }

    public class Airport
    {
        private static Airport instance;

        private HashSet<Plane> usedPlanes;
        private Stack unusedPlanes;

        private int airportSize;

        private Airport()
        {
            usedPlanes = new HashSet<Plane>();
            unusedPlanes = new Stack();

            airportSize = 5;
        }

        public Plane AcquireReusable()
        {
            Plane reusable;
            if (usedPlanes.Count + unusedPlanes.Count >= airportSize)
                throw new InvalidOperationException("No planes left!");
            if (unusedPlanes.Count != 0)
            {
                reusable = (Plane)unusedPlanes.Pop();
            }
            else
            {
                reusable = new Plane("cesna");
            }
            usedPlanes.Add(reusable);
            return reusable;
        }

        public static Airport GetInstance()
        {
            if (instance == null)
                instance = new Airport();
            return instance;
        }

        public void RealaseReusable(Plane o)
        {
            if (!usedPlanes.Remove(o))
                throw new InvalidOperationException("This is not your plane!");

            unusedPlanes.Push(o);

        }
    }
}
