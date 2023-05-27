class Country {
  String name;
  String capital;
  String? flagUrl;

  Country({required this.name, required this.capital, this.flagUrl});

    static List<Country> getCountry() {
      return <Country>[
      ];
    }
}