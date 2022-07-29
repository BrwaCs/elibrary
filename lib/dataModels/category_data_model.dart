// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category_datamodel {
  final int id;
  final String first_name;
  String? image;
  Category_datamodel({
    required this.id,
    required this.first_name,
    this.image,
  });

  Category_datamodel copyWith({
    int? id,
    String? first_name,
    String? image,
  }) {
    return Category_datamodel(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': first_name,
      'image': image,
    };
  }

  factory Category_datamodel.fromMap(Map<String, dynamic> map) {
    return Category_datamodel(
      id: map['id'] as int,
      first_name: map['first_name'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category_datamodel.fromJson(String source) => Category_datamodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category_datamodel(id: $id, first_name: $first_name, image: $image)';

  @override
  bool operator ==(covariant Category_datamodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.first_name == first_name &&
      other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ first_name.hashCode ^ image.hashCode;
}
