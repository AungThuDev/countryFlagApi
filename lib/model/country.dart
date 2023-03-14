class Country
{
  late String name;
  late String region;
  // late String subregion;
  // late String capital;
  late int population;
  late String alpha2Code;
  late String subregion;
  late String capital;

  Country.fromJSON(Map<String,dynamic>json)
  {
    name = json["name"];
    alpha2Code = json["alpha2Code"];
    population = json["population"];
    region = json["region"];
    capital = json["capital"] ?? "Yangon";
    subregion = json["subregion"];
  }
}