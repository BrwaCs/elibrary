// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatygoryDataModel {
String category;
String categoryImage;
  CatygoryDataModel({
    required this.category,
    required this.categoryImage,
  });

  CatygoryDataModel copyWith({
    String? category,
    String? categoryImage,
  }) {
    return CatygoryDataModel(
      category: category ?? this.category,
      categoryImage: categoryImage ?? this.categoryImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'categoryImage': categoryImage,
    };
  }

  factory CatygoryDataModel.fromMap(Map<String, dynamic> map) {
    return CatygoryDataModel(
      category: map['category'] as String,
      categoryImage: map['categoryImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatygoryDataModel.fromJson(String source) => CatygoryDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatygoryDataModel(category: $category, categoryImage: $categoryImage)';

  @override
  bool operator ==(covariant CatygoryDataModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.category == category &&
      other.categoryImage == categoryImage;
  }

  @override
  int get hashCode => category.hashCode ^ categoryImage.hashCode;
}
