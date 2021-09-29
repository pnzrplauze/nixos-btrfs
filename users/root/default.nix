{ lib, ... }:
# recommend using `hashedPassword`
{
  users.users.root.hashedPassword = "$6$0DzbAV7lbnH8kS/E$P53OZ4GDDGiPl1RiImw9eGLIWtBJrf1cZmrMgbANJEJUvgc4j/fY69jElbzzFWJ7EkUhyGdXG0QBAHrAPGFng0";
}
