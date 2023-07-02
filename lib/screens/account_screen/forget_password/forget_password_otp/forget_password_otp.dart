import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:travel_app/widgets/custom_button.dart';
import 'package:travel_app/widgets/custom_widgets.dart';

import '../../../../authentication/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CO\nDE", style: myStyle(70,Colors.black,FontWeight.bold),),
            Text("VERIFICATION", style: myStyle(16,Colors.black,FontWeight.bold),),
            SizedBox(height: 20,),
            Text("Enter the OTP sent to abc@gmail.com",textAlign: TextAlign.center, style: myStyle(16),),
            SizedBox(height: 20,),
            OtpTextField(
              filled: true,
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              onSubmit: (code){
                // print("Code is => $code");
                otp=code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            SizedBox(height: 20,),
            MyButton(
              title: "Next",
              color: Colors.blue,
              onPressed: (){
                OTPController.instance.verifyOTP(otp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
