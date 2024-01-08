import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_front_end/core/exceptions/exceptions.dart';
import 'package:mobile_front_end/features/auth/data/models/userModel.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> signInUser(UserModel userModel);
  Future<void> signOutUser();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final http.Client client;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserRemoteDataSourceImpl({http.Client? client})
      : client = client ?? http.Client();
  @override
  Future<UserModel> signInUser(UserModel userModel) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: userModel.username,
        password: userModel.password ?? '',
      );
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        username: userCredential.user!.email ?? '',
      );

      return Future.value(user);
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Exception: ${e.message}");
      throw LoginException();
    } catch (e) {
      print("Exception: $e");
      return Future.value(null);
    }
  }

  @override
  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }
}
