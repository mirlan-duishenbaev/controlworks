using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace controlwork
{
    public class InStockState : IState
    {
        public void GiveToTheWinner(Product product)
        {
            throw new Exception("It is impossible to give the product immediately from the warehouse!");
        }

        public void RaisePrice(Product product)
        {
            throw new Exception("The product is not yet bidding!");
        }

        public void SetOff(Product product)
        {
            throw new Exception("It is impossible to remove from the auction a product that does not participate in it!");
        }

        public void SetUp(Product product)
        {
            product.StateProd = new ForSaleState();
            Console.WriteLine("The product has been successfully auctioned off!");
        }
    }
}
