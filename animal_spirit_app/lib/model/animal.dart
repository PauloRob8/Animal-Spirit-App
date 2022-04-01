class Animal {
  Animal({
    required this.name,
    required this.type,
    required this.description,
    required this.maxAge,
    required this.location,
    required this.imagePath,
  });
  final String name;
  final String type;
  final String description;
  final int maxAge;
  final String location;
  final String imagePath;

  /// Creates an object of type Animal of a Json
  Animal.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        type = json['type'],
        description = json['description'],
        maxAge = json['age'] as int,
        location = json['location'],
        imagePath = json['imagePath'];

  /// Creates a list of Animals of a json
  static List<Animal> listFromJson(List<dynamic> json) =>
      json.map((json) => Animal.fromJson(json)).toList();
}
