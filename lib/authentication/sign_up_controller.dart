import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/user_model.dart';
import 'package:travel_app/repository/authentication_repository.dart';
import 'package:travel_app/repository/user_repository.dart';
import 'package:travel_app/screens/account_screen/forget_password/forget_password_otp/forget_password_otp.dart';

class SignUpController extends GetxController{
  // For using GetxController create an instance
  static SignUpController get instance => Get.find();
  final userRepo = Get.put(UserRepository());

  final mailcontroller = TextEditingController();
  final firstNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final lastNameController = TextEditingController();
  final pwcontroller = TextEditingController();
  final repwcontroller = TextEditingController();
  late String gender = "None";


  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async{
    await userRepo.createUser(user);
    phoneAuthentication(user.phone!);
    Get.to(() => OtpScreen());
  }
  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}