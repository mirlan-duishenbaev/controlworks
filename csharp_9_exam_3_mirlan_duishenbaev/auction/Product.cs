using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;

namespace auction
{
    class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Price { get; set; }
        public int Honorary_code { get; set; }
        public string State { get; set; }

        [JsonIgnore]
        public IState StateObj { get; set; }


        public void StartSale()
        {
            try
            {
                StateObj.ForSale(this);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public void RaisePrice()
        {
            Price += 1000;
        }

        public void WithDraw()
        {
            try
            {
                StateObj.InStock(this);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public void GiveToTheWinner()
        {
            try
            {
                StateObj.Sold(this);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}
