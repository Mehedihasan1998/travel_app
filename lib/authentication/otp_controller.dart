import 'package:get/get.dart';
import 'package:travel_app/repository/authentication_repository.dart';
import 'package:travel_app/screens/main_screens/home.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();


  void verifyOTP(String otp)async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(HomePage()) : Get.back();


  }
}