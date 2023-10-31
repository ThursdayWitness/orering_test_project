class Person {
  final String name;
  final String email;
  final String phone;
  final String country;
  final String city;
  final List<String> addresses;
  final String postcode;

  Person(this.name, this.email, this.phone, this.country, this.city,
      this.addresses, this.postcode);
}

// Пара тестовых адресов
var person1 = Person("Danilev Egor", "egor_zu@email.com", "+375726014690",
    "Belarus", "Minsk", ["Derzhinskogo 3b"], "220069");
var person2 = Person("Ko Yuri", "yuri@email.com", "+375294545687", "Italy",
    "Naple", ["Via Toledo 256"], "80100");
