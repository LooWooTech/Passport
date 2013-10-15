﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LoowooTech.Passport.Web.Models
{
    public class User
    {
        public string ID { get; set; }

        public string Username { get; set; }

        public string Password { get; set; }

        public UserGroup Group { get; set; }

        public UserRole Role { get; set; }

        public DateTime CreateTime { get; set; }

        public DateTime LastLoginTime { get; set; }

        public string LastLoginIP { get; set; }

        public string TrueName { get; set; }

        public string ContactNo { get; set; }
    }
}