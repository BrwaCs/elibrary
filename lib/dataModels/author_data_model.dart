// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class autherModel {


  String auther;
  String autherImage;
  String autherDescribtion;
  autherModel({
    required this.auther,
    required this.autherImage,
    required this.autherDescribtion,
  });

  autherModel copyWith({
    String? auther,
    String? autherImage,
    String? autherDescribtion,
  }) {
    return autherModel(
      auther: auther ?? this.auther,
      autherImage: autherImage ?? this.autherImage,
      autherDescribtion: autherDescribtion ?? this.autherDescribtion,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'auther': auther,
      'autherImage': autherImage,
      'autherDescribtion': autherDescribtion,
    };
  }

  factory autherModel.fromMap(Map<String, dynamic> map) {
    return autherModel(
      auther: map['auther'] as String,
      autherImage: map['autherImage'] as String,
      autherDescribtion: map['autherDescribtion'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory autherModel.fromJson(String source) => autherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'autherModel(auther: $auther, autherImage: $autherImage, autherDescribtion: $autherDescribtion)';

  @override
  bool operator ==(covariant autherModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.auther == auther &&
      other.autherImage == autherImage &&
      other.autherDescribtion == autherDescribtion;
  }

  @override
  int get hashCode => auther.hashCode ^ autherImage.hashCode ^ autherDescribtion.hashCode;
}
