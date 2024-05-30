
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Método para iniciar sesión con correo y contraseña
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Manejar errores de Firebase
      if (e.code == 'user-not-found') {
        print('Usuario no encontrado');
      } else if (e.code == 'wrong-password') {
        print('Contraseña incorrecta');
      }
    } catch (e) {
      // Manejar otros errores
      print('Error: $e');
    }
    return null;
  }

  // Método para obtener el usuario actual
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}