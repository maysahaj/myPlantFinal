import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth{
  Auth._();
  FirebaseAuth firebaseAuth  = FirebaseAuth.instance;
  SharedPreferences sharedPreferences ; 
  Future<SharedPreferences> initSp() async{
    if(sharedPreferences == null){
      sharedPreferences =await SharedPreferences.getInstance();
      return sharedPreferences;
    }else
    return sharedPreferences;
  }
  Future<String> createNewUserUsingEmailAndPassword(String email, String password) async {
     try{
        sharedPreferences = await initSp();
      AuthResult authResult  = await firebaseAuth.createUserWithEmailAndPassword(
      email:email, password: password);
      assert(authResult.user.uid != null);
      String userId  = authResult.user.uid;
      sharedPreferences.setString('UserId', userId);
      sharedPreferences.setBool('isLogged', true);
      return userId;

     }
     catch(error){
      print(error);
     }   
  }
  Future<String> signInUsingEmailAndPassword(String email, String password) async {
     try{
      sharedPreferences = await initSp();
      AuthResult authResult  = await firebaseAuth.signInWithEmailAndPassword(
      email:email, password: password);
      assert(authResult.user.uid != null);
      String userId  = authResult.user.uid;
      sharedPreferences.setString('UserId', userId);
      sharedPreferences.setBool('isLogged', true);
      return userId;

     }
     catch(error){
      print(error);
     }   
  }
  signOut() async{
    try{
      sharedPreferences = await initSp();
      sharedPreferences.setBool('isLogged', false);
      sharedPreferences.setString('UserId', '');
      firebaseAuth.signOut();

    } catch (error) {
      print(error);
    }

  }
}
/*     Future<bool> checkUser() async {
    try {
      sharedPreferences = await initSp();
      bool isLoggedUser = sharedPreferences.getBool('isLogged');
      return isLoggedUser;
    } catch (error) {
      print(error);
    }
  } */


