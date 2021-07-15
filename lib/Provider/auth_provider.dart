import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

//create Account
  Future<String?> createAccount(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Account created";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

//sign in user
  Future<String?> signIN(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    } catch (e) {
      return 'Unknown Error.'; // Change this to whatever you want.
    }
  }

//reset password
  Future<String> resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      return "Email sent";
    } catch (e) {
      return "Error occurred";
    }
  }

//sign out user
  void signOut() {
    auth.signOut();
  }
}
