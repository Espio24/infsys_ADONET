using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MySql.Data.MySqlClient;

namespace UpdateTesterTest
{
    using infsys;
    [TestClass]
    public class UpdateTest
    {
        [TestMethod]
        public void UpdateTesterTest()
        {
            string connectionString = "server=localhost; port=3306; username=root; password=vbif159753; database=system_manager_test";
            MySqlConnection connection = new MySqlConnection(connectionString);

            connection.Open();
            Assert.AreEqual(Program.UpdateTesterById(connection, 1, "UpdateTester"), 0);
            connection.Close();
        }
    }
}
