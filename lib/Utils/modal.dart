import 'dart:io';

class Learner {
  String id;
  String fullName;
  String Mobielnumber;
  String photoUrl;
  File? profilePictureFile;

  Learner(
      {required this.id,
      required this.fullName,
      required this.Mobielnumber,
      required this.photoUrl,
      required this.profilePictureFile});

  factory Learner.fromMap({required Map<String, dynamic> data}) {
    return Learner(
      id: data["id"],
      fullName: data["fullName"],
      Mobielnumber: data["grade"],
      photoUrl: data["photoUrl"],
      profilePictureFile: data["profilePictureFile"],
    );
  }
}
