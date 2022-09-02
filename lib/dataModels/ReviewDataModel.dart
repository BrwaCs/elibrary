// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReviewDataModel {

  String review;
  String uid;
  String bookName;
  // String userName;
  // String userImage;
  ReviewDataModel({
    required this.review,
    required this.uid,
    required this.bookName,
    // required this.userName,
    // required this.userImage,
  });

  ReviewDataModel copyWith({
    String? review,
    String? uid,
    String? bookName,
  }) {
    return ReviewDataModel(
      review: review ?? this.review,
      uid: uid ?? this.uid,
      bookName: bookName ?? this.bookName, 
      // userImage:userImage , userName: userName ,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'review': review,
      'uid': uid,
      'bookName': bookName,
    };
  }

  factory ReviewDataModel.fromMap(Map<String, dynamic> map) {
    return ReviewDataModel(
      review: map['review'] as String,
      uid: map['uid'] as String,
      bookName: map['bookName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewDataModel.fromJson(String source) => ReviewDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ReviewDataModel(review: $review, uid: $uid, bookName: $bookName)';

  @override
  bool operator ==(covariant ReviewDataModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.review == review &&
      other.uid == uid &&
      // other.userName==userName&&
      // other.userImage==userImage&&
      other.bookName == bookName;
  }

  @override
  int get hashCode => review.hashCode ^ uid.hashCode ^ bookName.hashCode ;
}
