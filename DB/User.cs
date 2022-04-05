using System;
using System.Collections.Generic;

#nullable disable

namespace PetShopApp.DB
{
    public partial class User
    {
        public User()
        {
            Orders = new HashSet<Order>();
            UserHistories = new HashSet<UserHistory>();
        }

        public int UserId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<UserHistory> UserHistories { get; set; }
    }
}
