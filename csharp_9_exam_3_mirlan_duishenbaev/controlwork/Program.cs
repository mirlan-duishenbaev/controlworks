using System;

namespace controlwork
{
    class Program
    {
        static void Main(string[] args)
        {
            DataReader data = new DataReader();
            data.FillTheProduct();

            data.GetProducts("../../../data.json");
            data.ScreenProduct();
        }
    }   
}
