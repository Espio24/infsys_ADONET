using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MySql.Data.MySqlClient;

namespace SelectTesterTest
{
    using infsys;
    [TestClass]
    public class SelectTester
    {

        [TestMethod]
        public void SelectVolodya()
        {
            string connectionString = "server=localhost; port=3306; username=root; password=vbif159753; database=system_manager_test";
            MySqlConnection connection = new MySqlConnection(connectionString);

            connection.Open();
            Assert.AreEqual(Program.SelectTesterByName(connection, "VolodyaTester"), 0);
            connection.Close();
        }
    }
}
