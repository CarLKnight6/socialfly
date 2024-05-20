import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/failure.dart';

abstract class IAuthController {
  late FirebaseAuth auth;
  Future signInWithEmail(String email, String password);
  Future<Either<Failure, bool>> signUpWithEmail(String email, String password);
  Future<Either<Failure, bool>> signOut();
}
