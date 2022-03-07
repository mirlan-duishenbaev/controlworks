using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace controlwork
{
    public interface IState
    {
        void RaisePrice(Product prod);
        void SetUp(Product prod);
        void GiveToTheWinner(Product prod);
        void SetOff(Product prod);

    }
}
