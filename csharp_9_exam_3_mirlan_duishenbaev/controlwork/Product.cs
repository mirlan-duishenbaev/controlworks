using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace controlwork
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Price { get; set; }
        public int Honorary_code { get; set; }
        public string State { get; set; }
        public IState StateProd { get; set; }

    }
}
