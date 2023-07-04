import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/authentication/sign_up_controller.dart';
import 'package:travel_app/controller/profile_controller.dart';
import 'package:travel_app/model/user_model.dart';
import 'package:travel_app/widgets/custom_widgets.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final editController = Get.put(ProfileController());
  final registerController = Get.put(ProfileController());

  bool isobs = false;
  final _formKey = GlobalKey<FormState>();
  String gender="";
  String ?valueChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Edit Profile", style: myStyle(18, Colors.black, FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: editController.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel user = snapshot.data as UserModel;
                final id = TextEditingController(text: user.id);
                final mailcontroller = TextEditingController(text: user.email);
                final firstNameController = TextEditingController(
                    text: user.firstName);
                final phoneController = TextEditingController(text: user.phone);
                final genderController = TextEditingController(text: user.gender);
                final dateOfBirthController = TextEditingController(
                    text: user.dateOfBirth);
                final lastNameController = TextEditingController(
                    text: user.lastName);
                final pwcontroller = TextEditingController(text: user.password);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: NetworkImage(
                          "https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg"),
                    ),
                    SizedBox(height: 20,),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          children: [

                            TextFormField(
                              controller: firstNameController,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter first name";
                                }
                              },
                              decoration: customInputDecoration.copyWith(
                                prefixIcon: Icon(
                                    Icons.drive_file_rename_outline),
                                hintText: "First Name",
                                labelText: "First Name",),
                            ),
                            SizedBox(height: 10,),


                            TextFormField(
                              controller: lastNameController,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter last name";
                                }
                              },
                              decoration: customInputDecoration.copyWith(
                                prefixIcon: Icon(
                                    Icons.drive_file_rename_outline),
                                hintText: "Last Name",
                                labelText: "Last Name",),
                            ),
                            SizedBox(height: 10,),

                            TextFormField(
                              controller: phoneController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter a phone number";
                                }
                                if (value!.length != 14) {
                                  return "Enter valid phone number";
                                }
                              },
                              decoration: customInputDecoration.copyWith(
                                prefixIcon: Icon(Icons.phone),
                                hintText: "Phone Number",
                                labelText: "Enter Phone Number",),
                            ),

                            SizedBox(height: 10,),

                            TextFormField(
                              controller: genderController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              decoration: customInputDecoration.copyWith(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Gender",
                                labelText: "Gender",),
                            ),

                            SizedBox(height: 10,),


                            TextFormField(
                              controller: dateOfBirthController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter your birth date";
                                }
                              },
                              decoration: customInputDecoration.copyWith(
                                prefixIcon: Icon(Icons.calendar_month_outlined),
                                hintText: "Date of Birth",
                                labelText: "Enter Birth Date",),
                              onTap: () async {
                                DateTime ?pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1980),
                                    lastDate: DateTime(2100));
                                if (pickedDate != null) {
                                  setState(() {
                                    dateOfBirthController.text =
                                        DateFormat('yyyy-MM-dd').format(
                                            pickedDate);
                                  });
                                }
                              },
                            ),
                            SizedBox(height: 10,),


                            TextFormField(
                              controller: mailcontroller,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter an Email";
                                }
                                if (!value.contains("@")) {
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
                              controller: pwcontroller,
                              obscureText: isobs,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter new Password";
                                }
                                if (value.length < 8) {
                                  return "Password must be more than 7 characters";
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: customInputDecoration.copyWith(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isobs = !isobs;
                                    });
                                  },
                                  icon: Icon(Icons.visibility),
                                ),
                                filled: true,
                                hintText: "Enter new Password",
                                labelText: "Enter new Password",
                                prefixIcon: Icon(Icons.password),),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Material(
                                elevation: 5.0,
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(30.0),
                                child: MaterialButton(
                                  onPressed: () async {
                                    final userData = UserModel(
                                        id: id.text,
                                        firstName: firstNameController.text.trim(),
                                        lastName: lastNameController.text.trim(),
                                        phone: phoneController.text.trim(),
                                        gender: genderController.text.trim(),
                                        dateOfBirth: dateOfBirthController.text.trim(),
                                        email: mailcontroller.text.trim(),
                                        password: pwcontroller.text.trim(),
                                    );
                                    await editController.updateRecord(userData);
                                    Get.snackbar("Successful", "Changes saved successfully",snackPosition: SnackPosition.BOTTOM);
                                  },
                                  minWidth: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  height: 50,
                                  child: Text("Save Changes", style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()),);
              } else {
                return Center(
                    child: Text("Something went wrong.", style: myStyle(16),));
              }
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
