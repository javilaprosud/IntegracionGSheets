using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntegracionGSheets.Conexion
{
    class Conexiones
    {

        public SqlConnection procesadorabd()
        {
            SqlConnection sql_conexion = new SqlConnection(@"Data Source=192.168.1.69;Initial Catalog=procesadorabd;user=sa;pwd=procesadora1");
            SqlCommand time = new SqlCommand();
            time.CommandTimeout = 800;
            sql_conexion.Open();
            return sql_conexion;
        }

        public string ConsultaColumnsShopify()
        {
            string query_SP;
            query_SP = "SP_ColumnsShopify";
            return query_SP;
        }

        public string AddColumnShopify()
        {
            string query_SP;
            query_SP = "SP_ADDColumnShopify";
            return query_SP;
        }

        //Update a los datos de la tabla
        public string UpdShopify()
        {
            string query_SP;
            query_SP = "SP_UPD_Shopify";
            return query_SP;
        }

        //Agrega un nuevo Identity para Shopify y retorna su id de insercion
        public string AddShopify()
        {
            string query_SP;
            query_SP = "SP_ADD_Shopify";
            return query_SP;
        }

        public string insercionLog()
        {
            string query_SP_Log;
            query_SP_Log = "SP_Log_Shopify";
            return query_SP_Log;
        }

        public string ejecCorreo()
        {
            string query_SP_Log;
            query_SP_Log = "SP_correo_shopify2";
            return query_SP_Log;
        }

        public void InsertarColumna(string nombre)
        {
            SqlConnection conexion = procesadorabd();
            using (procesadorabd())
            {
                SqlCommand cmd = new SqlCommand(AddColumnShopify(), procesadorabd());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = nombre;
                cmd.ExecuteNonQuery();
                conexion.Close();
            }
        }

        public void actualizarInsercion (string columna, string data, int id)
        {
            SqlConnection conexion = procesadorabd();
            using (conexion)
            {
                SqlCommand command = new SqlCommand(UpdShopify(), conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@Columna", SqlDbType.VarChar).Value = columna;
                command.Parameters.Add("@Data", SqlDbType.VarChar).Value = data;
                command.Parameters.Add("@Id", SqlDbType.Int).Value = id;
                command.ExecuteNonQuery();
                conexion.Close();
            }
        }
        public void EjecutarLog(int id_insercion, string info, string estado)
        {
            SqlConnection conexion = procesadorabd();
            using (conexion)
            {
                SqlCommand cmd = new SqlCommand(insercionLog(), conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id_insercion", SqlDbType.Int).Value = id_insercion;
                cmd.Parameters.Add("@info", SqlDbType.VarChar).Value = info;
                cmd.Parameters.Add("@estado", SqlDbType.VarChar).Value = estado;
                cmd.ExecuteNonQuery();
            }
        }
        public void Correo(int pedidos, string name)
        {
            SqlConnection conexion = procesadorabd();
            using (conexion)
            {
                SqlCommand cmd = new SqlCommand(ejecCorreo(), conexion)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.Add("@pedidos", SqlDbType.Int).Value = pedidos;
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
                cmd.ExecuteNonQuery();
            }
        }


    }
}
