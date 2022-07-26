// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AutherModel {
  final int id;
  final String first_name;
  String? gender;
  String? image; 
  AutherModel({
    required this.id,
    required this.first_name,
    this.gender,
    this.image,
  });

  AutherModel copyWith({
    int? id,
    String? first_name,
    String? gender,
    String? image,
  }) {
    return AutherModel(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      gender: gender ?? this.gender,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': first_name,
      'gender': gender,
      'image': image,
    };
  }

  factory AutherModel.fromMap(Map<String, dynamic> map) {
    return AutherModel(
      id: map['id'] as int,
      first_name: map['first_name'] as String,
      gender: map['gender'] != null ? map['gender'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AutherModel.fromJson(String source) => AutherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AutherModel(id: $id, first_name: $first_name, gender: $gender, image: $image)';
  }

  @override
  bool operator ==(covariant AutherModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.first_name == first_name &&
      other.gender == gender &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      first_name.hashCode ^
      gender.hashCode ^
      image.hashCode;
  }
}
