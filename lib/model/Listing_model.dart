class ListingModel {
  String name;
  String description;
  int stars;
  String latitude;
  String longitude;
  String city;
  int pricerperhour;
  String image;

  ListingModel({required this.image,required this.name,required this.description,required this.stars,
    required this.latitude,required this.longitude,required this.city,required this.pricerperhour});

  factory ListingModel.fromJson(Map<String,dynamic> json){
    return ListingModel(image: json["image"],name: json["name"], description: json["description"], stars: json["stars"], latitude: json["latitude"], longitude: json["longitude"], city: json["city"], pricerperhour: json["priceperhour"]);
  }
}