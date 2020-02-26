using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using Google.Apis.Sheets.v4;
using Google.Apis.Util.Store;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Reflection;
using System.Data;
using System.Data.SqlClient;
using IntegracionGSheets.Conexion;

namespace IntegracionGSheets.Controller
{
    class GoogleSheets
    {

        public string ConsultaGoogleSheets()
        {
            try
            {
                SheetsService sheetsService = new SheetsService(new BaseClientService.Initializer
                {
                    HttpClientInitializer = GetCredential(),
                    ApplicationName = "Google-SheetsSample/0.1",
                });

                string spreadsheetId = "1_iIbyZZAzO02HOA-3l38FCJxq9Mm_MHaZ8l7NvFtw44";

                string range = "A1:FZ3000";

                SpreadsheetsResource.ValuesResource.GetRequest.ValueRenderOptionEnum valueRenderOption = (SpreadsheetsResource.ValuesResource.GetRequest.ValueRenderOptionEnum)0; 

                SpreadsheetsResource.ValuesResource.GetRequest.DateTimeRenderOptionEnum dateTimeRenderOption = (SpreadsheetsResource.ValuesResource.GetRequest.DateTimeRenderOptionEnum)0;  

                SpreadsheetsResource.ValuesResource.GetRequest request = sheetsService.Spreadsheets.Values.Get(spreadsheetId, range);
                request.ValueRenderOption = valueRenderOption;
                request.DateTimeRenderOption = dateTimeRenderOption;

                Google.Apis.Sheets.v4.Data.ValueRange response = request.Execute();

                IList<IList<Object>> values = response.Values;

                IList<Object> listaParametros = values[0];

                Diferencia(listaParametros);

                InsertShopify(values, listaParametros);

                return JsonConvert.SerializeObject(response);
            }
            catch (Exception e)
            {
                Conexion.Conexiones c = new Conexiones();
                c.EjecutarLog(0, e.ToString(), "ERROR CONSULTA DATA SHOPIFY");
                return e.ToString();
            }
        }
        public void Diferencia(IList<Object> listaParametros)
        {
            try
            {
                Conexiones conn = new Conexion.Conexiones();
                SqlConnection conexion = conn.procesadorabd();
                using (conexion)
                {
                    SqlCommand cmd = new SqlCommand(conn.ConsultaColumnsShopify(), conn.procesadorabd());
                    DataTable colu = new DataTable();
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    ad.Fill(colu);

                    int columnasBD = colu.Rows.Count;
                    int totalParametros = listaParametros.Count;

                    foreach (var item in listaParametros)
                    {
                        bool exist = false;
                        string it = Convert.ToString(item);
                        foreach (DataRow rows in colu.Rows)
                        {
                            if (Convert.ToString(rows.ItemArray[0]) == it)
                            {
                                exist = true;
                                break;
                            }
                        }
                        if (!exist)
                        {
                            conn.InsertarColumna(it);
                            conn.EjecutarLog(0, "Nueva columna insertada: " + it + ".", "OK INST DIFERENCIA");
                        }
                    }
                    conexion.Close();
                }
            }
            catch (Exception e)
            {
                Conexion.Conexiones c = new Conexiones();
                c.EjecutarLog(0, e.ToString(), "ERROR INST NEW PARAMETROS");
            }
        }
        public void InsertShopify(IList<IList<Object>> values, IList<Object> listaParametros)
        {
            try
            {
                string names = string.Empty;
                int pedidos = 0;

                Conexiones conn = new Conexion.Conexiones();
                SqlConnection conexion = conn.procesadorabd();
                using (conexion)
                {

                    for (int i = 1; i < values.Count; i++)
                    {
                        SqlCommand cmd = new SqlCommand(conn.AddShopify(), conexion);
                        SqlDataReader read = cmd.ExecuteReader();
                        read.Read();

                        int o = 0;
                        int id = read.GetInt32(0);

                        foreach (var item in values[i])
                        {
                            string columna = Convert.ToString(listaParametros[o]);
                            o++;
                            string data = Convert.ToString(item);

                            if (columna == "Line item origin location" || columna == "Line item discount allocations" || columna == "Line item destination location")
                            {
                                data = data.Replace("'", "'+''''+'");
                            }
                            conn.actualizarInsercion(columna, data, id);

                            if (columna == "Name" && !names.Contains(data))
                            {
                                pedidos = pedidos + 1;

                                if (i == 1)
                                {
                                    names = data;
                                }
                                else
                                {
                                    names = names + ", " + data;
                                }
                            }
                        }
                        read.Close();
                        conn.EjecutarLog(id, "Fila insertada correctamente", "OK INST DATA SHOPIFY");
                    }
                    conn.Correo(pedidos, names);
                    conexion.Close();
                }
            }
            catch (Exception e)
            {
                Conexion.Conexiones c = new Conexiones();
                c.EjecutarLog(0, e.ToString(), "ERROR INST DATA SHOPIFY");
            }
        }      
        public static UserCredential GetCredential()
        {
            UserCredential credential;
            string[] Scopes = { SheetsService.Scope.SpreadsheetsReadonly };

            using (var stream =
                new FileStream("credentials.json", FileMode.Open, FileAccess.Read))
            {
                string credPath = "token.json";
                credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None,
                    new FileDataStore(credPath, true)).Result;
            }
            return credential;
        }
    }
}
