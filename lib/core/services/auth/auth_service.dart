import 'package:dartz/dartz.dart';
import 'package:loxis/core/models/user_model.dart';
import 'package:loxis/core/services/auth/i_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService implements IAuthService {
  final fb = FirebaseFirestore.instance;
  final fba = FirebaseAuth.instance;

  @override
  Future<Either<String, Unit>> signInAnonymously() async {
    try {
      final userCredential = await fba.signInAnonymously();
      final uid = userCredential.user!.uid;
      final userDoc = fb.collection('users').doc(uid);

      final docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        final user = UserModel(
          uid: uid,
          createdAt: DateTime.now().toIso8601String(),
        );

        await userDoc.set(user.toMap());
      }
      return Future.value(Right(unit));
    } catch (ex) {
      return Future.value(Left(ex.toString()));
    }
  }
}
