import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/repository/authentication_repository.dart';

class SignUpController extends GetxController{
  // For using GetxController create an instance
  static SignUpController get instance => Get.find();

  final mailcontroller = TextEditingController();
  final firstNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final lastNameController = TextEditingController();
  final pwcontroller = TextEditingController();
  final repwcontroller = TextEditingController();


  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}