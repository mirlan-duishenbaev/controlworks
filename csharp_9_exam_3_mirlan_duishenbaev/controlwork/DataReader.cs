using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Text.Json;

namespace controlwork
{
    public class DataReader
    {
        public Product[] products { get; set; }

        public void FillTheProduct()
        {
            Product[] products = new Product[3];
            for(int i = 0; i < 3; i++)
            {
                products[i] = new Product();
                Console.WriteLine("Enter the product's name:");
                products[i].Name = Console.ReadLine();
                products[i].Id = i + 1;
                products[i].Price = 0;
                products[i].State = "in_stoke";
                products[i].Honorary_code = 0;
            }

            string json = JsonSerializer.Serialize<Product[]>(products);
            string file = "../../../data.json";
            File.WriteAllText(file, json);
        }

        public Product[] GetProducts(string path)
        {
            try
            {
                string json = File.ReadAllText(path);
                this.products = JsonSerializer.Deserialize<Product[]>(json);
            }
            catch (IOException ex)
            {
                Console.WriteLine(ex.Message);
            }
            return this.products;
        }

        public void ScreenProduct()
        {
            Console.WriteLine("№        | Продукт");
            for(int i = 0; i < products.Length; i++)
            {
                Console.WriteLine($"{i + 1}  |  {products[i].Name}");
            }
        }


    }
}

