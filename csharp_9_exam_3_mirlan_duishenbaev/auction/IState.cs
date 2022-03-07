using System;
using System.Collections.Generic;
using System.Text;

namespace auction
{
    interface IState
    {
        void InStock(Product product);
        void ForSale(Product product);
        void Sold(Product product);

    }
}
