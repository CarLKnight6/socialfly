import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_fly/repositories/interfaces/auth.dart';

import '../controllers/auth.dart';
import '../controllers/interfaces/auth.dart';
import '../models/failure.dart';

class AuthRepository implements IAuthRepository {
  IAuthController authController = AuthController();
  @override
  Stream<User?> get authStateChanges => authController.auth.authStateChanges();

  @override
  Future<Either<Failure, bool>> signInWithEmail(String email, String password) async {
    return await authController.signInWithEmail(email, password);
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    return await authController.signOut();
  }

  @override
  Future<Either<Failure, bool>> signUpWithEmail(String email, String password) async {
    return await authController.signUpWithEmail(email, password);
  }
}
