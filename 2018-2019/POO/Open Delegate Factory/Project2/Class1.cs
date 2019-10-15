using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zad2
{
    class zad2
    {
        public static void Main(string[] args)
        {

        }
    }


    public interface IShape
    {

    }

    public class Triangle : IShape
    {
        public int a { get; set; }
        public int b { get; set; }
        public int c { get; set; }
    }

    public class Square : IShape
    {
        public int a { get; set; }
    }

    public interface IShapeFactoryWorker
    {
        bool Parameter(string name, params object[] parameters);

        IShape Create(params object[] parameters);
    }

    public class TriangleWorker : IShapeFactoryWorker
    {
        public bool Parameter(string name, params object[] parameters)
        {
            return name.Equals("Triangle") && parameters.Length == 3;
        }
        public IShape Create(params object[] parameters)
        {
            return new Triangle() { a = (int)parameters[0], b = (int)parameters[1], c = (int)parameters[2] };
        }

    }

    public class SquareWorker : IShapeFactoryWorker
    {
        public bool Parameter(string name, params object[] parameters)
        {
            return name.Equals("Square") && parameters.Length == 1;
        }
        public IShape Create(params object[] parameters)
        {
            return new Square() { a = (int)parameters[0] };
        }

    }

    public interface IShapeFactory
    {
        void RegisterWorker(IShapeFactoryWorker worker);
        IShape CreateShape(string ShapeName, params object[] parameters);
    }

    public class ShapeFactory : IShapeFactory
    {
        public List<IShapeFactoryWorker> workers;

        public ShapeFactory()
        {
            workers = new List<IShapeFactoryWorker>();
            workers.Add(new SquareWorker());
        }

        public void RegisterWorker(IShapeFactoryWorker worker)
        {
            workers.Add(worker);
        }

        public IShape CreateShape(string type, params object[] parameters)
        {
            foreach (IShapeFactoryWorker worker in workers)
            {
                if (worker.Parameter(type, parameters))
                {
                    IShape newShape = worker.Create(parameters);
                    return newShape;
                }

            }
            return null;
        }
    }


}