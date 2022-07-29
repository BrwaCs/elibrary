// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class book_datamodel {
  final String book_name;
  final String image;
  book_datamodel({
    required this.book_name,
    required this.image,
  });

  book_datamodel copyWith({
    String? book_name,
    String? image,
  }) {
    return book_datamodel(
      book_name: book_name ?? this.book_name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'book_name': book_name,
      'image': image,
    };
  }

  factory book_datamodel.fromMap(Map<String, dynamic> map) {
    return book_datamodel(
      book_name: map['book_name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory book_datamodel.fromJson(String source) => book_datamodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'book_datamodel(book_name: $book_name, image: $image)';

  @override
  bool operator ==(covariant book_datamodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.book_name == book_name &&
      other.image == image;
  }

  @override
  int get hashCode => book_name.hashCode ^ image.hashCode;
}
