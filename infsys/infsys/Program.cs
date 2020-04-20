using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data.Common;

namespace infsys
{
    class Program
    {
        static void Main(string[] args)
        {
            
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
           

            MySqlConnection connection = new MySqlConnection(connectionString);
            try
            {
                // Открываем подключение
                connection.Open();
                Console.WriteLine("Подключение открыто");
                //InsertTester(connection,  "KarpovSS");
                //UpdateTesterById(connection, 18, "JaSdelalEtoGovno"); 
                //DeleteTester(connection, 18);
                //SelectTesterByName(connection, "Tom");
               
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                // закрываем подключение
                connection.Close();
                Console.WriteLine("Подключение закрыто...");
            }

            Console.Read();
       
              }

        //Воод тестеров
        private static void InsertTester(MySqlConnection connection, string Name)
        {
            // Команда Insert.
            string sql = "Insert into tester (name_tester) "
                                             + " values (@name_tester) ";

            MySqlCommand command = new MySqlCommand(sql, connection);
            MySqlParameter nameParam = new MySqlParameter("@name_tester", Name);
            command.Parameters.Add(nameParam);

            int number = command.ExecuteNonQuery();
            Console.WriteLine("Добавлено объектов: {0}", number); 

        }

        //обновление тестеров
        private static void UpdateTesterById(MySqlConnection connection, int id, string NewName)
        {
            // Команда Update
            string sql = "Update tester Set name_tester = @name_tester Where id_tester = @id";

            MySqlCommand command = new MySqlCommand(sql, connection);
            MySqlParameter nameParam = new MySqlParameter("@name_tester", NewName);
            command.Parameters.Add(nameParam);
            MySqlParameter IdParam = new MySqlParameter("@id", id);
            command.Parameters.Add(IdParam);


            int number = command.ExecuteNonQuery();
            Console.WriteLine("Обновлено объектов: {0}", number); 
            
        }

        private static void DeleteTester(MySqlConnection connection, int id)
        {
            // Команда Update
            //string sql = string.Format("Delete from tester where idTester = '{0}'", id);
            string sql = "Delete from tester where id_tester = @id";

            MySqlCommand command = new MySqlCommand(sql, connection);
            MySqlParameter IdParam = new MySqlParameter("@id", id);
            command.Parameters.Add(IdParam);


            int number = command.ExecuteNonQuery();
            Console.WriteLine("Удалено объектов: {0}", number); 
            

        }

        //Select
        private static void SelectTesterByName(MySqlConnection connection, String Name)
        {
            string sql = "SELECT * FROM system_manager.tester where name_tester = @name_tester";

            // Создать объект Command.
            MySqlCommand command = new MySqlCommand(sql, connection);
            MySqlParameter nameParam = new MySqlParameter("@name_tester",Name);
            command.Parameters.Add(nameParam);

               


         using (DbDataReader reader = command.ExecuteReader())
            {
                if (reader.HasRows)
                {

                    while (reader.Read())
                    {
                        long IdTester = Convert.ToInt64(reader.GetValue(0));
                        string NameTester = reader.GetString(1);
                        Console.WriteLine("--------------------");
                        Console.WriteLine("Id_tester " + IdTester);
                        Console.WriteLine("name_tester " + NameTester);
                    }
                }
            }

        }




    }
}
