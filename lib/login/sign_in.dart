import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/Model/user_model.dart';
import 'package:hopehub/admin/newdr.dart';
import 'package:hopehub/admin/newment.dart';
import 'package:hopehub/collections/controller.dart';
// import 'package:hopehub/firebase/firebase.dart';
// import 'package:hopehub/login/loginpage.dart';
// import 'package:hopehub/user/home.dart';
import 'package:hopehub/user/package.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_instate();
}
File? selectedImage;

class _sign_instate extends State<sign_in> {
  // create controller object

  Controller controller = Controller();

  final _auth = FirebaseAuth.instance;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  final UserNameController = TextEditingController();
  final EmailController = TextEditingController();
  final NewPassController = TextEditingController();
  final ConfirmPassController = TextEditingController();
  final AddressController = TextEditingController();
  final PhoneController = TextEditingController();
  final imagecontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String email = "", password = "";

  String? _password;
  String? _confirm;

  Future<void> _pickImageFromGallery() async {
    final pickedImage = await controller.pickImage();
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

// Get auth id  or match document id and authid make same collection
  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        email = EmailController.text;
        password = NewPassController.text;
      });

      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final uid = userCredential.user!.uid;

        String imageUrl = '';
        if (selectedImage != null) {
          imageUrl = await controller.uploadImage(XFile(selectedImage!.path));
        }

        final userModel = UserModel(
            name: UserNameController.text,
            email: EmailController.text,
            phone: PhoneController.text,
            address: AddressController.text,
            imageUrl: imageUrl,
            id: uid);

        await controller.addUser(userModel, uid);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => packages(
              indexnum: 0,
            ),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Weak password')),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('E-mail is already in use')),
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "Signup",
                  style: GoogleFonts.inknutAntiqua(
                      color: Colors.amber[900], fontSize: 30),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: selectedImage != null
                      ? FileImage(selectedImage!)
                      : AssetImage("assets/image.png") as ImageProvider,
                  child: IconButton(
                      onPressed: _pickImageFromGallery,
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: UserNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                      color: Colors.white,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter the Name";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: AddressController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Address",
                      hintStyle: GoogleFonts.inknutAntiqua(
                          color: Colors.white.withOpacity(0.5)),
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: PhoneController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.inknutAntiqua(
                          color: Colors.white.withOpacity(0.5)),
                      prefixIcon: Icon(
                        Icons.phone_sharp,
                        color: Colors.white,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: EmailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Email",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      )),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter the Email";
                    }
                    RegExp emailRegExp = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (!emailRegExp.hasMatch(value)) {
                      return "Please Enter a valid Email";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: NewPassController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Password",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.white,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                      )),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter the Password";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: ConfirmPassController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Confirm Password",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      prefixIcon: Icon(
                        Icons.lock_reset,
                        color: Colors.white,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                      )),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter the Confirm Password";
                    }

                    if ((NewPassController.text !=
                        ConfirmPassController.text)) {
                      return "Password do not match with confirm password";
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: BorderSide(color: Colors.white))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber[900])),
                      onPressed: _register,
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.inknutAntiqua(
                            color: Colors.white, fontSize: 20),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
