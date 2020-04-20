using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using infsys;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;


namespace ConnectionTest
{
    using infsys;
    [TestClass]
    public class ConectionTest
    {

        [TestMethod]
        public void ConnectTest()
        {
            Assert.AreEqual(Program.Connection(), 0);
            
        }
    }
}



