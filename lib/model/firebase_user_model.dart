class UserModel {
  String uid;
  String email;
  String displayName;
  String photoURL;

  UserModel(
      {this.uid = "",
      this.email = "",
      this.displayName = "",
      this.photoURL = ""});

  // fromJson method to deserialize Firestore data
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? "",
      email: json['email'] ?? "",
      displayName: json['displayName'] ?? "",
      photoURL: json['photoURL'] ?? "",
    );
  }

  // toJson method to serialize data for Firestore
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
    };
  }
}
