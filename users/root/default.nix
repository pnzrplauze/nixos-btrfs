{ lib, ... }:
# recommend using `hashedPassword`
{
  users.users.root.hashedPassword = "$6$rU/gd7Dm/$dFxMqcDfAvuk5llGOK4lH7lMh5jH6/.SKSuYr8HQZrwBYorOIcn3hb8cEbOsyBbNb2MmWPqJP65.rbMkkfmex0";
}
