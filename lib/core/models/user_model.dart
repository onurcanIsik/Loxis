class UserModel {
  final String uid;
  final String createdAt;

  UserModel({required this.uid, required this.createdAt});

  Map<String, dynamic> toMap() => {'uid': uid, 'createdAt': createdAt};

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      createdAt: map['createdAt'] as String,
    );
  }
}
