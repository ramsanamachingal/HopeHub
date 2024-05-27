// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/Model/dr_model.dart';
import 'package:hopehub/admin/adhome.dart';
import 'package:hopehub/collections/adddr.dart';
import 'package:hopehub/user/profilepage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:hopehub/admin/adhome.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class newdr extends StatefulWidget {
  const newdr({super.key});

  @override
  State<newdr> createState() => _newdrState();
}

// File? selectedImage;
Adddrcontroller adddrcontroller = Adddrcontroller();

class _newdrState extends State<newdr> {
  final _auth = FirebaseAuth.instance;
  final DrnameController = TextEditingController();
  final QualificationController = TextEditingController();
  final ExpertController = TextEditingController();
  final LanguageController = TextEditingController();
  final PhoneController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final ImageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String email = "", password = "";

  Future drregister() async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('password is weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("email is already in use")));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _pickedImageGallery() async {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }

    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 23, top: 100),
                      child: Container(
                        height: 650,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: DrnameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: "Doctor Name",
                                    hintStyle: GoogleFonts.inknutAntiqua(
                                        color: Colors.white, fontSize: 15)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter the doctor name";
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       top: 80, left: 10),

                                    //   child: Stack(
                                    //     children: [
                                    //       Container(
                                    //         decoration: BoxDecoration(
                                    //             image: DecorationImage(
                                    //                 fit: BoxFit.cover,
                                    //                 image: selectedImage != null
                                    //                     ? FileImage(
                                    //                         selectedImage!)
                                    //                     :
                                    //                     // NetworkImage('')
                                    //                     AssetImage('')
                                    //                         as ImageProvider<
                                    //                             Object>),
                                    //             shape: BoxShape.circle,
                                    //             color: Colors.white),
                                    //         height: 70,
                                    //         width: 70,
                                    //       ),
                                    //       Padding(
                                    //         padding: const EdgeInsets.only(
                                    //             left: 55, top: 30),
                                    //         child: Container(
                                    //           height: 20,
                                    //           width: 20,
                                    //           decoration: BoxDecoration(
                                    //               shape: BoxShape.circle,
                                    //               // color: Colors.red
                                    //               color: Color.fromARGB(
                                    //                   149, 255, 255, 255)),
                                    //           child: Center(
                                    //             child: IconButton(
                                    //                 onPressed: () async {
                                    //                   _pickedImageGallery()
                                    //                       .then((value) async {
                                    //                     SettableMetadata
                                    //                         metadata =
                                    //                         SettableMetadata(
                                    //                             contentType:
                                    //                                 "image/jpg");
                                    //                     final currenttime =
                                    //                         TimeOfDay.now();

                                    //                     UploadTask uploadTask =
                                    //                         FirebaseStorage
                                    //                             .instance
                                    //                             .ref()
                                    //                             .child(
                                    //                                 "profileimage/profile$currenttime")
                                    //                             .putFile(
                                    //                                 selectedImage!,
                                    //                                 metadata);

                                    //                     TaskSnapshot snapshot =
                                    //                         await uploadTask;
                                    //                     await snapshot.ref
                                    //                         .getDownloadURL()
                                    //                         .then((url) {
                                    //                       String id =
                                    //                           FirebaseAuth
                                    //                               .instance
                                    //                               .currentUser!
                                    //                               .uid;
                                    //                       FirebaseFirestore
                                    //                           .instance
                                    //                           .collection(
                                    //                               'image')
                                    //                           .doc(id)
                                    //                           .update({
                                    //                         'image': url
                                    //                       });
                                    //                     });
                                    //                   });
                                    //                 },
                                    //                 icon: Icon(
                                    //                   Icons.camera_alt_outlined,
                                    //                   color: Colors.black,
                                    //                   size: 10,
                                    //                 )),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),

                                    // CircleAvatar(
                                    //   radius: 87,
                                    //   backgroundColor: Colors.white,
                                    //   child: CircleAvatar(
                                    //     radius: 80,
                                    //     backgroundImage: AssetImage(""),
                                    //   ),
                                    // ),

                                    SizedBox(
                                      width: 220,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextFormField(
                                              controller:
                                                  QualificationController,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                                  hintText: "qualification",
                                                  hintStyle:
                                                      GoogleFonts.inknutAntiqua(
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                          fontSize: 15)),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please enter the qualification";
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 400,
                                              child: TextFormField(
                                                controller: ExpertController,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                style: TextStyle(
                                                    color: Colors.white),
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .white)),
                                                    hintText: "Expert",
                                                    hintStyle:
                                                        GoogleFonts
                                                            .inknutAntiqua(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 15)),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter doctor experts";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 400,
                                              child: TextFormField(
                                                controller: LanguageController,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                style: TextStyle(
                                                    color: Colors.white),
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .white)),
                                                    hintText: "Languages",
                                                    hintStyle:
                                                        GoogleFonts
                                                            .inknutAntiqua(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 15)),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter the languages of doctor";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 400,
                                              child: TextFormField(
                                                controller: PhoneController,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                style: TextStyle(
                                                    color: Colors.white),
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .white)),
                                                    hintText: "Phone number",
                                                    hintStyle:
                                                        GoogleFonts
                                                            .inknutAntiqua(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 15)),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Enter the phone number";
                                                  }
                                                  return null;
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 400,
                                              child: TextFormField(
                                                controller: EmailController,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                style: TextStyle(
                                                    color: Colors.white),
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .white)),
                                                    hintText: "E Mail",
                                                    hintStyle:
                                                        GoogleFonts
                                                            .inknutAntiqua(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 15)),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Enter the email";
                                                  }
                                                  RegExp emailRegExp = RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                                  if (!emailRegExp
                                                      .hasMatch(value)) {
                                                    return "Please Enter a valid Email";
                                                  }
                                                  return null;
                                                },
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 400,
                                              child: TextFormField(
                                                controller: PasswordController,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .white)),
                                                    hintText: "Password",
                                                    hintStyle:
                                                        GoogleFonts
                                                            .inknutAntiqua(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 15)),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Enter the password";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  side: BorderSide(
                                                      color: Colors.white))),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.amber[900])),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            email = EmailController.text;
                                            password = PasswordController.text;
                                          });
                                          drregister().then((uid) =>
                                        
                                              adddrcontroller.addDr(
                                                  Drmodel(
                                                      name:
                                                          DrnameController.text,
                                                      qualification:
                                                          QualificationController
                                                              .text,
                                                      expert:
                                                          ExpertController.text,
                                                      language:
                                                          LanguageController
                                                              .text,
                                                      phone:
                                                          PhoneController.text,
                                                      email:
                                                          EmailController.text,
                                                          password: 
                                                          PasswordController.text),
                                                          
                                                  uid));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'New doctor add successfully')));
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      adhome()));
                                        }
                                      },
                                      child: Text(
                                        "Submit",
                                        style: GoogleFonts.inknutAntiqua(
                                            color: Colors.white, fontSize: 15),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
