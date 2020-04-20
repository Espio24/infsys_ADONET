using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MySql.Data.MySqlClient;

namespace DeleteTesterTest
{
    using infsys;
    [TestClass]
    public class DeleteTester
    {
       
        [TestMethod]
        public void DeleteVolodya()
        {
            string connectionString = "server=localhost; port=3306; username=root; password=vbif159753; database=system_manager_test";
            MySqlConnection connection = new MySqlConnection(connectionString);

            connection.Open();
            Assert.AreEqual(Program.DeleteTester(connection, 10), 0);
            connection.Close();
        }
    }
}
