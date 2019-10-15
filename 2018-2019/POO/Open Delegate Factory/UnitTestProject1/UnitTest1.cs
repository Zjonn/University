using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using zad2;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void NoWorker()
        {
            ShapeFactory factory = new ShapeFactory();

            IShape square = factory.CreateShape("Square", 2);
            IShape triangle = factory.CreateShape("Triangle", 2, 3, 4);

            Assert.IsNotNull(square);
            Assert.IsNull(triangle);

        }

        [TestMethod]
        public void AddedWorker()
        {
            ShapeFactory factory = new ShapeFactory();
            factory.RegisterWorker(new TriangleWorker());

            IShape square = factory.CreateShape("Square", 2);
            IShape triangle = factory.CreateShape("Triangle", 2, 3, 4);
                   
            Assert.IsNotNull(square);
            Assert.IsNotNull(triangle);
            Assert.AreNotEqual(triangle, square);

        }

    }
}
