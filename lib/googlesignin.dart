
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async
{
  final GoogleSignInAccount googleSignInAccount =  await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
  final AuthResult result = await _auth.signInWithCredential(credential);
  final FirebaseUser user =  result.user;
  assert(!user.isAnonymous);
  assert(await user.getIdToken()!=null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid==currentUser.uid);
  return 'logged in successfully: $user';
}

Future<bool>signOutGoogle() async
{
  await _googleSignIn.signOut();
  return true;
}
