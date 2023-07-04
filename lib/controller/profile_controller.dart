import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/user_model.dart';
import 'package:travel_app/repository/authentication_repository.dart';
import 'package:travel_app/repository/user_repository.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();


  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData(){
    final phone = _authRepo.firebaseUser.value!.phoneNumber;
    if(phone != null){
      return _userRepo.getUserDetails(phone);
    } else{
      Get.snackbar("Error", "Login to continue");
    }
  }

  updateRecord(UserModel user) async{
    await _userRepo.updateUserRecord(user);
  }
}