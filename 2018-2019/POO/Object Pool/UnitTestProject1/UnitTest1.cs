using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using zad3;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void GetPlanes()
        {
            Airport ny = Airport.GetInstance();

            Plane p1 = ny.AcquireReusable();
            Plane p2 = ny.AcquireReusable();

            Assert.AreNotEqual<Plane>(p1, p2);
        }
   
        [TestMethod]
        [ExpectedException(typeof(InvalidOperationException),
    "This is not your plane!")]
        public void NotAirpotPlane()
        {
            Airport ny = Airport.GetInstance();

            Plane p1 = ny.AcquireReusable();
            ny.RealaseReusable(p1);

            Plane p2 = new Plane("sam");
            ny.RealaseReusable(p2);
        }

        [TestMethod]
        public void CorrectRealase()
        {
            Airport ny = Airport.GetInstance();

            Plane p1 = ny.AcquireReusable();
            ny.RealaseReusable(p1);

            Plane p2 = ny.AcquireReusable();

            Assert.AreEqual<Plane>(p1, p2);
        }
    }


}
