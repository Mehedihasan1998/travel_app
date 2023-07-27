import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/account_screen/forget_password/forget_password_options/forget_password_modal_bottom_sheet.dart';
import 'package:travel_app/screens/account_screen/login_phone.dart';
import 'package:travel_app/screens/main_screens/home.dart';
import 'package:travel_app/widgets/custom_button.dart';
import 'package:travel_app/widgets/custom_widgets.dart';
import 'package:get/get.dart';
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  bool isobs = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(70.0),
                      child: Image.asset("images/app_icon.jpg",
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10,),
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
                      controller: mailcontroller,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter an Email";
                        }
                        if(!value.contains("@")){
                          return "Enter valid Email";
                        }
                      },
                      decoration: customInputDecoration.copyWith(
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Email Address",
                        labelText: "Enter Your Email",),
                    ),


                    SizedBox(height: 20,),

                    TextFormField(
                      controller: pwcontroller,
                      obscureText: isobs,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter a Password";
                        }
                        if(value.length<8){
                          return "Password must be more than 7 characters";
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration.copyWith(
                        hintText: "Password",
                        labelText: "Enter Your Password",
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              isobs=!isobs;
                            });
                          },
                          icon: Icon(Icons.visibility),
                        ),
                      ),
                    ),


                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: (){
                          ForgetPasswodScreen.buildShowModalBottomSheet();
                        },
                          child: Text("Forgot Password",style: TextStyle(color: Colors.blue),)),
                    ),
                    SizedBox(height: 20,),
                    MyButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          // print("Login Successful");
                          Get.to(HomePage());
                        }
                      },
                      color: buttonColor,
                      title: "Log In",
                    ),
                    Text("or Sign in with"),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2008px-Google_%22G%22_Logo.svg.png"),
                            ),
                            Text("Google"),
                          ],
                        ),
                        SizedBox(width: 30,),
                        Column(
                          children: [
                            InkWell(
                                onTap: (){
                                  Get.to(LogInPhone());
                                },
                                child: Icon(Icons.phone_android,size: 40,color: Colors.blue,)),
                            Text("Phone")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}


