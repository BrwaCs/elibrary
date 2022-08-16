// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {

String uid;
String bookName;
String auther;
String category;
String dateAndTime;
String? review;
String bookImage;
String? bookDescription;
String autherImage;
 DocumentReference? reference;
  BookModel({
    required this.uid,
    required this.bookName,
    required this.auther,
    required this.category,
    required this.dateAndTime,
    this.review,
    required this.bookImage,
    this.bookDescription,
    required this.autherImage,
    this.reference
  });





  BookModel copyWith({
    String? uid,
    String? bookName,
    String? auther,
    String? category,
    String? dateAndTime,
    String? review,
    String? bookImage,
    String? bookDescription,
    String? autherImage,
  }) {
    return BookModel(
      uid: uid ?? this.uid,
      bookName: bookName ?? this.bookName,
      auther: auther ?? this.auther,
      category: category ?? this.category,
      dateAndTime: dateAndTime ?? this.dateAndTime,
      review: review ?? this.review,
      bookImage: bookImage ?? this.bookImage,
      bookDescription: bookDescription ?? this.bookDescription,
      autherImage: autherImage ?? this.autherImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'bookName': bookName,
      'auther': auther,
      'category': category,
      'dateAndTime': dateAndTime,
      'review': review,
      'bookImage': bookImage,
      'bookDescription': bookDescription,
      'autherImage': autherImage,
    };
  }
  factory BookModel.fromSnapShot(DocumentSnapshot documentSnapshot) {
    return BookModel.fromMap(documentSnapshot.data() as Map<String, dynamic>,
        reference: documentSnapshot.reference);
  }
  factory BookModel.fromMap(Map<String, dynamic> map,{required DocumentReference? reference}) {
    return BookModel(
      uid: map['uid'] as String,
      bookName: map['bookName'] as String,
      auther: map['auther'] as String,
      category: map['category'] as String,
      dateAndTime: map['dateAndTime'] as String,
      review: map['review'] != null ? map['review'] as String : null,
      bookImage: map['bookImage'] as String,
      bookDescription: map['bookDescription'] != null ? map['bookDescription'] as String : null,
      autherImage: map['autherImage'] as String,
      reference: reference
      
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) => BookModel.fromMap(json.decode(source) as Map<String, dynamic>, reference: null);

  @override
  String toString() {
    return 'BookModel(uid: $uid, bookName: $bookName, auther: $auther, category: $category, dateAndTime: $dateAndTime, review: $review, bookImage: $bookImage, bookDescription: $bookDescription, autherImage: $autherImage)';
  }

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.bookName == bookName &&
      other.auther == auther &&
      other.category == category &&
      other.dateAndTime == dateAndTime &&
      other.review == review &&
      other.bookImage == bookImage &&
      other.bookDescription == bookDescription &&
      other.autherImage == autherImage;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      bookName.hashCode ^
      auther.hashCode ^
      category.hashCode ^
      dateAndTime.hashCode ^
      review.hashCode ^
      bookImage.hashCode ^
      bookDescription.hashCode ^
      autherImage.hashCode;
  }
}
