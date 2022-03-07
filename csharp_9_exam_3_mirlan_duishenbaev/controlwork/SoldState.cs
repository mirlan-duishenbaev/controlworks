using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace controlwork
{
    public class SoldState : IState
    {
        public void GiveToTheWinner(Product product)
        {
            throw new Exception("The product is already sold!");
        }

        public void RaisePrice(Product product)
        {
            throw new Exception("The product is already sold!");
        }

        public void SetOff(Product product)
        {
            throw new Exception("Cannot be withdrawn from bidding on a product that has been sold!");
        }

        public void SetUp(Product product)
        {
            throw new Exception("The product is already sold!");
        }
    }
}
