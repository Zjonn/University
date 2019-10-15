using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proxy
{
    class Program
    {
        static void Main(string[] args)
        {
            IAirport airport = new AirportProxy(6);
            airport.AcquirePlane();
        }
    }
    public interface IAirport
    {
        Plane AcquirePlane();
        bool ReleasePlane(Plane plane);
    }

    public class Airport : IAirport
    {
        List<Plane> planesPool = new List<Plane>();
        List<Plane> acquiredPlanes = new List<Plane>();

        private int capacity;

        public Airport(int capacity) => this.capacity = capacity;

        public Plane AcquirePlane()
        {
            if (planesPool.Count == 0 && this.acquiredPlanes.Count < this.capacity)
            {
                Plane plane = new Plane();
                this.acquiredPlanes.Add(plane);
                return plane;
            }
            else if (planesPool.Count > 0)
            {
                Plane plane = this.planesPool.First();
                this.acquiredPlanes.Add(plane);
                this.planesPool.Remove(plane);
                return plane;
            }
            else
            {
                return null;
            }
        }

        public bool ReleasePlane(Plane plane)
        {
            if (this.acquiredPlanes.Contains(plane))
            {
                this.planesPool.Add(plane);
                this.acquiredPlanes.Remove(plane);
                return true;
            }
            return false;
        }

    }

    public class AirportProxy : IAirport
    {
        Airport airport;
        private bool Active
        {
            get
            {
                return DateTime.Now.Hour > 8 && DateTime.Now.Hour < 22;
            }
        }
        public AirportProxy(int capacity)
        {
            airport = new Airport(capacity);
        }

        public Plane AcquirePlane()
        {
            if (Active)
            {
                return airport.AcquirePlane();
            }
            throw new Exception("Sorry, Airport is closed");
        }
        public bool ReleasePlane(Plane plane)
        {
            if (Active)
            {
                return airport.ReleasePlane(plane);
            }
            throw new Exception("Sorry, Airport is closed");
        }
    }

    public class Plane
    {

    }
}
