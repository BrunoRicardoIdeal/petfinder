import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RandomDogImg {
  final String message;
  final String status;
  RandomDogImg({
    required this.message,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
    };
  }

  factory RandomDogImg.fromMap(Map<String, dynamic> map) {
    return RandomDogImg(
      message: map['message'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RandomDogImg.fromJson(String source) =>
      RandomDogImg.fromMap(json.decode(source) as Map<String, dynamic>);
}
