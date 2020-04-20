using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MySql.Data.MySqlClient;

namespace InsertTesterTest
{
    using infsys;
    [TestClass]
    public class InsertTest
    {
        [TestMethod]
        public void InsertVolodyaTest()
        {
            string connectionString = "server=localhost; port=3306; username=root; password=vbif159753; database=system_manager_test";
            MySqlConnection connection = new MySqlConnection(connectionString);

            connection.Open();      
            Assert.AreEqual(Program.InsertTester(connection, "VolodyaTester"), 0);
            
            connection.Close();
        }

        
    }
}
