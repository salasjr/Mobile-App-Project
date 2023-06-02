import 'dart:convert';

class Service {
  final int id;
  final String title;
  final String description;
  final double price;
  final int doctor_id;

  Service({
    this.id = 0,
    required this.title,
    required this.description,
    required this.price,
    required this.doctor_id,
  });

//converts class to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'doctor_id': doctor_id,
    };
  }

// converts map to class
  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price'].toDouble() ?? 0,
      doctor_id: map['doctor_id'] ?? 0,
    );
  }

  static List<Service> fromList(List<dynamic> list) {
    final services = list.map((e) => Service.fromMap(e)).toList();
    return services;
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));
}
