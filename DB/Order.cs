using System;
using System.Collections.Generic;

#nullable disable

namespace PetShopApp.DB
{
    public partial class Order
    {
        public Order()
        {
            OrderHistories = new HashSet<OrderHistory>();
        }

        public int OrderId { get; set; }
        public DateTime? OrderTime { get; set; }
        public double Price { get; set; }
        public int ProductId { get; set; }
        public int UserId { get; set; }

        public virtual Product Product { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<OrderHistory> OrderHistories { get; set; }
    }
}
