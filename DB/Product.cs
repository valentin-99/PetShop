using System;
using System.Collections.Generic;

#nullable disable

namespace PetShopApp.DB
{
    public partial class Product
    {
        public Product()
        {
            Orders = new HashSet<Order>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public double Price { get; set; }
        public int CategoryId { get; set; }
        public int ProductTypeId { get; set; }
        public int BrandId { get; set; }

        public virtual Brand Brand { get; set; }
        public virtual Category Category { get; set; }
        public virtual ProductType ProductType { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
