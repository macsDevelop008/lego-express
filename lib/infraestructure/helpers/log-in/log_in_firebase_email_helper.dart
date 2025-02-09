import 'package:firebase_auth/firebase_auth.dart';
import 'package:lego_express/domain/domain.dart';

Future<LogInEntity> logInEmailPasswordHelper(
    String email, String password) async {
  final userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);

  return LogInEntity(hasError: false, userLogueado: userCredential);
}
