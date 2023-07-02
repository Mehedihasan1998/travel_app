import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/authentication/sign_up_controller.dart';
import 'package:travel_app/screens/account_screen/forget_password/forget_password_options/forget_password_modal_bottom_sheet.dart';
import 'package:travel_app/screens/account_screen/forget_password/forget_password_otp/forget_password_otp.dart';
import 'package:travel_app/screens/main_screens/home.dart';
import 'package:travel_app/widgets/custom_button.dart';
import 'package:travel_app/widgets/custom_widgets.dart';
class LogInPhone extends StatefulWidget {
  const LogInPhone({Key? key}) : super(key: key);

  @override
  State<LogInPhone> createState() => _LogInPhoneState();
}

class _LogInPhoneState extends State<LogInPhone> {
  final controller = Get.put(SignUpController());
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                            'Log In',
                            speed: Duration(milliseconds: 100, )
                        )
                      ],
                      repeatForever: true,
                    ),
                  ),
                  SizedBox(height: 20,),


                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter a phone number";
                      }
                      if(value!.length!=14){
                        return "Enter valid phone number";
                      }
                    },
                    decoration: customInputDecoration.copyWith(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "Phone Number",
                      labelText: "Enter Phone Number",),
                  ),


                  SizedBox(height: 20,),
                  MyButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        // print("Login Successful");
                        SignUpController.instance.phoneAuthentication(controller.phoneController.text.trim());
                        Get.to(()=>OtpScreen());
                      }
                    },
                    color: buttonColor,
                    title: "Next",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


