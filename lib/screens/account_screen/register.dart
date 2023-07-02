import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/authentication/sign_up_controller.dart';
import 'package:travel_app/screens/account_screen/forget_password/forget_password_otp/forget_password_otp.dart';
import 'package:travel_app/widgets/custom_button.dart';
import 'package:travel_app/widgets/custom_widgets.dart';
import 'package:intl/intl.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final controller = Get.put(SignUpController());

  bool isobs = false;
  final _formKey = GlobalKey<FormState>();

  String ?valueChoose;
  List gender = ["Male", "Female", "Others"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                child: Column(
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
                              'Sign Up',
                          speed: Duration(milliseconds: 100, )
                          )
                        ],
                        repeatForever: true,
                      ),
                    ),

                    SizedBox(height: 10,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.45,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: controller.firstNameController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Enter first name";
                              }
                            },
                            decoration: customInputDecoration.copyWith(
                              hintText: "First Name",
                              labelText: "First Name",),
                          ),
                        ),
                        SizedBox(width: 10,),


                        Container(
                          width: MediaQuery.of(context).size.width*0.45,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: controller.lastNameController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Enter last name";
                              }
                            },
                            decoration: customInputDecoration.copyWith(
                              hintText: "Last Name",
                              labelText: "Last Name",),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),

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
                    SizedBox(height: 10,),


                    Container(
                      padding: EdgeInsets.only(left: 16,right: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButton(
                        hint: Text("Select your gender"),
                          dropdownColor: Colors.white,
                          iconEnabledColor: Colors.blue,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(color: Colors.black,fontSize: 16),
                          value: valueChoose,
                        onChanged: (newValue){
                          setState(() {
                            valueChoose=newValue.toString();
                          });
                        },
                        items: gender.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                                child: Text(valueItem));
                          }).toList(),
                      ),
                    ),
                    SizedBox(height: 10,),




                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      controller: controller.dateOfBirthController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter your birth date";
                        }
                      },
                      decoration: customInputDecoration.copyWith(
                        prefixIcon: Icon(Icons.calendar_month_outlined),
                        hintText: "Date of Birth",
                        labelText: "Enter Birth Date",),
                      onTap: () async{
                        DateTime ?pickedDate= await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1980),
                            lastDate: DateTime(2100));
                        if(pickedDate!=null){
                          setState(() {
                            controller.dateOfBirthController.text=DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      },
                    ),
                    SizedBox(height: 10,),




                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: controller.mailcontroller,
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
                    SizedBox(height: 10,),


                    TextFormField(
                      controller: controller.pwcontroller,
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
                        suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isobs=!isobs;
                          });
                        },
                        icon: Icon(Icons.visibility),
                      ),
                        filled: true,
                        hintText: "Enter Password",
                        labelText: "Enter Your Password",
                        prefixIcon: Icon(Icons.password),),
                    ),
                    SizedBox(height: 10,),

                    TextFormField(
                      controller: controller.repwcontroller,
                      obscureText: isobs,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter a Password";
                        }
                        if(value.length<8){
                          return "Password must be more than 7 characters";
                        }
                        if(value!=controller.repwcontroller.text.toString()){
                          return "Password does not match";
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: customInputDecoration.copyWith(
                        hintText: "Re-enter Password",
                        labelText: "Re-enter Your Password",
                        prefixIcon: Icon(Icons.password),),
                    ),
                    SizedBox(height: 20,),

                    MyButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          // SignUpController.instance.registerUser(
                          //     controller.mailcontroller.text.trim(),
                          //     controller.pwcontroller.text.trim()
                          // );
                          SignUpController.instance.phoneAuthentication(controller.phoneController.text.trim());
                          Get.to(()=>OtpScreen());
                        }
                      },
                      color: buttonColor,
                      title: "Sign Up",
                    ),
                    Text("or Sign up with"),
                    Divider(),

                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2008px-Google_%22G%22_Logo.svg.png"),
                        ),
                        Text("Google")
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
