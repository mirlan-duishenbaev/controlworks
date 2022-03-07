using System;
using System.Collections.Generic;
using System.Text;

namespace auction
{
    class SoldState : IState
    {
        public void ForSale(Product product)
        {
            throw new NotImplementedException();
        }

        public void InStock(Product product)
        {
            throw new NotImplementedException();
        }

        public void Sold(Product product)
        {
            throw new NotImplementedException();
        }
    }
}
