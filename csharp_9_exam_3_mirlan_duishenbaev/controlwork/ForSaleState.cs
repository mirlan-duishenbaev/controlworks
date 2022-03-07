using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace controlwork
{
    public class ForSaleState : IState
    {
        public void GiveToTheWinner(Product product)
        {
            
            if(product.Price == 0)
            {
                throw new Exception("The product cannot be given away for free!");
            }
            else
            {
                product.StateProd = new SoldState();
                Console.WriteLine("Product sold and removed from auction!");
            }
            
        }

        public void RaisePrice(Product product)
        {
            
            Console.WriteLine("The price of the product has been successfully raised!");
        }

        public void SetOff(Product product)
        {
            product.StateProd = new InStockState();
            Console.WriteLine("The product is removed from the auction and moved to the warehouse due to lack of bids!");
        }

        public void SetUp(Product product)
        {
            throw new Exception("The product cannot be re-bid!");
        }
    }
}
