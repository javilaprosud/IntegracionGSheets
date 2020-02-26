using System;
namespace IntegracionGSheets
{
    class Program
    {
        static void Main(string[] args)
        {
            Controller.GoogleSheets Sheets = new Controller.GoogleSheets();
            Console.WriteLine(Sheets.ConsultaGoogleSheets());
        }
    }
}
