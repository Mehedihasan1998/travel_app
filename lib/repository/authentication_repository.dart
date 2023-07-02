import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:travel_app/helper/routes.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationID = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAllNamed(TripRoutes.initial) : Get.offAllNamed(TripRoutes.home);
  }

  Future<void> phoneAuthentication(String phoneNo) async{
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
        verificationCompleted: (credential) async{
        await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e){
        if(e.code == 'invalid-phone-number'){
          Get.snackbar('Error', 'The Phone Number is invalid...');
        }
        else
          {
            Get.snackbar('Error', 'Something went wrong. Try again.');
          }
        },
        codeSent: (verificationId, resendToken){
        this.verificationID.value=verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationID.value=verificationId;
        }
    );
  }

  Future<bool> verifyOTP(String otp) async{
    var credentials= await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationID.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAllNamed(TripRoutes.home) : Get.offAllNamed(TripRoutes.initial);
    }on FirebaseAuthException catch(e){
    }catch(_){}
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
    }catch(_){}
  }

  Future<void> logout() async => await _auth.signOut();
}