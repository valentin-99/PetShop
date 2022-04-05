using System;
using System.Collections.Generic;

#nullable disable

namespace PetShopApp.DB
{
    public partial class UserHistory
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public virtual User User { get; set; }
    }
}
