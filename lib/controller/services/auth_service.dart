import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  //Google sign in
  SignInWithGoogle() async {

    //Begin interactive sign process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();//This should open up a page to allow user to select an email

    //Obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //Create new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //Finally, let's sign login
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
