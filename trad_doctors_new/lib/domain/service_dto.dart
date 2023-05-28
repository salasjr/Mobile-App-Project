import 'dart:convert';

class Service {
  final int id;
  final String title;
  final String description;
  final String price;

  Service({
    this.id = 0,
    required this.title,
    required this.description,
    required this.price,
  });

//converts class to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
    };
  }

// converts map to class
  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
    );
  }

  static List<Service> fromList(List<dynamic> list) {
    return list.map((e) => Service.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));
}
