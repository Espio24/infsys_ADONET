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
    public class Program
    {
        public static void Main(string[] args)
        {
            
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
           

            MySqlConnection connection = new MySqlConnection(connectionString);
            try
            {
               
                connection.Open();
                Console.WriteLine("Подключение открыто");
                InsertTester(connection,  "KarpovSS");
                //UpdateTesterById(connection, 18, "Vasya"); 
                //DeleteTester(connection, 18);
               // SelectTesterByName(connection, "Tom");
               
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
               
                connection.Close();
                Console.WriteLine("Подключение закрыто...");
            }

            Console.Read();
       
              }


        //Воод тестеров
        public static int InsertTester(MySqlConnection connection, string Name)
        {
            // Команда Insert.
            string sql = "Insert into tester (name_tester) "
                                             + " values (@name_tester) ";

            MySqlCommand command = new MySqlCommand(sql, connection);
            MySqlParameter nameParam = new MySqlParameter("@name_tester", Name);
            command.Parameters.Add(nameParam);

            int number = command.ExecuteNonQuery();
            Console.WriteLine("Добавлено объектов: {0}", number);


            return 0;

        }

        //обновление тестеров
        public static int UpdateTesterById(MySqlConnection connection, int id, string NewName)
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

            return 0;
            
        }

        public static int DeleteTester(MySqlConnection connection, int id)
        {
            // Команда Update
            //string sql = string.Format("Delete from tester where idTester = '{0}'", id);
            string sql = "Delete from tester where id_tester = @id";

            MySqlCommand command = new MySqlCommand(sql, connection);
            MySqlParameter IdParam = new MySqlParameter("@id", id);
            command.Parameters.Add(IdParam);


            int number = command.ExecuteNonQuery();
            Console.WriteLine("Удалено объектов: {0}", number);

            return 0;
        }

        //Select
        public static int SelectTesterByName(MySqlConnection connection, String Name)
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
         return 0;
        }

        //Проверка подключения
        public static int Connection()
        {

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


            MySqlConnection connection = new MySqlConnection(connectionString);
            try
            {
                connection.Open();
                Console.WriteLine("Подключение открыто");
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                connection.Close();
                Console.WriteLine("Подключение закрыто...");
            }

            return 0;

        }
    }
}
