using System;
using System.Collections.Generic;

#nullable disable

namespace PetShopApp.DB
{
    public partial class OrderHistory
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public DateTime OrderDate { get; set; }
        public int ProductId { get; set; }
        public int UserId { get; set; }

        public virtual Order Order { get; set; }
    }
}
