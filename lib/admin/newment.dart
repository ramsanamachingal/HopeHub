import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/Model/mentor_model.dart';
import 'package:hopehub/admin/adment.dart';
import 'package:hopehub/admin/newdr.dart';
import 'package:hopehub/collections/addmentor.dart';
import 'package:image_picker/image_picker.dart';

class newment extends StatefulWidget {
  const newment({super.key});

  @override
  State<newment> createState() => _newmentState();
}

Addmentorcontroller addmentorcontroller = Addmentorcontroller();
File? selectedImage;

class _newmentState extends State<newment> {
  final _auth = FirebaseAuth.instance;
  final mentornameController = TextEditingController();
  final qualificationController = TextEditingController();
  final experienceController = TextEditingController();
  final languageController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String email = "", password = "";

  Future mentorregister() async{
    try{
      return await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => value.user!.uid);
    }on FirebaseAuthException catch(e){
      if( e.code =='weak password'){
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Password is weak'),));
      }
      else if(e.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("email already in use")));
      }
    }
    catch(e){
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
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: 700,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.transparent),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: mentornameController,
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
                                hintText: "Mentor Name",
                                hintStyle: GoogleFonts.inknutAntiqua(
                                    color: Colors.white, fontSize: 15)),
                                    validator: (value) {
                                      if(value!.isEmpty){
                                         return "please enter doctor name";

                                      }
                                     return null;
                                    }
                                    
                                  
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Stack(
                                //   children: [
                                //     Container(
                                //       decoration: BoxDecoration(
                                //           image: DecorationImage(
                                //               fit: BoxFit.cover,
                                //               image: selectedImage != null
                                //                   ? FileImage(selectedImage!)
                                //                   :
                                //                   // NetworkImage('')
                                //                   AssetImage('')
                                //                       as ImageProvider<Object>),
                                //           shape: BoxShape.circle,
                                //           color: Colors.white),
                                //       height: 70,
                                //       width: 70,
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: 55, top: 30),
                                //       child: Container(
                                //         height: 20,
                                //         width: 20,
                                //         decoration: BoxDecoration(
                                //             shape: BoxShape.circle,
                                //             // color: Colors.red
                                //             color: Color.fromARGB(
                                //                 149, 255, 255, 255)),
                                //         child: Center(
                                //           child: IconButton(
                                //               onPressed: () async {
                                //                 _pickedImageGallery()
                                //                     .then((value) async {
                                //                   SettableMetadata metadata =
                                //                       SettableMetadata(
                                //                           contentType:
                                //                               "image/jpg");
                                //                   final currenttime =
                                //                       TimeOfDay.now();

                                //                   UploadTask uploadTask =
                                //                       FirebaseStorage.instance
                                //                           .ref()
                                //                           .child(
                                //                               "profileimage/profile$currenttime")
                                //                           .putFile(
                                //                               selectedImage!,
                                //                               metadata);

                                //                   TaskSnapshot snapshot =
                                //                       await uploadTask;
                                //                   await snapshot.ref
                                //                       .getDownloadURL()
                                //                       .then((url) {
                                //                     String id = FirebaseAuth
                                //                         .instance
                                //                         .currentUser!
                                //                         .uid;
                                //                     FirebaseFirestore.instance
                                //                         .collection('image')
                                //                         .doc(id)
                                //                         .update({'image': url});
                                //                   });
                                //                 });
                                //               },
                                //               icon: Icon(
                                //                 Icons.camera_alt_outlined,
                                //                 color: Colors.black,
                                //                 size: 10,
                                //               )),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                //  CircleAvatar(radius: 87,backgroundColor: Colors.white,child: CircleAvatar(radius: 80,backgroundImage: AssetImage(""),),
                                //  ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: SizedBox(
                                    // height: 20,
                                    width: 220,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextFormField(
                                            controller: qualificationController,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style:
                                                TextStyle(color: Colors.white),
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
                                                        validator: (value){
                                                          if(value!.isEmpty){
                                                            return "please enter the qualification";
                                                          }
                                                          return null;
                                                        },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: experienceController,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                                hintText: "Experience",
                                                hintStyle:
                                                    GoogleFonts.inknutAntiqua(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        fontSize: 15)),
                                                        validator: (value) {
                                                          if(value!.isEmpty){
                                                            return "please enter the experience";

                                                          }
                                                          return null;
                                                        },
                                                        
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: languageController,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                                hintText: "Languages",
                                                hintStyle:
                                                    GoogleFonts.inknutAntiqua(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        fontSize: 15)),
                                                        validator: (value) {
                                                          if(value!.isEmpty){
                                                            return "please enter the language";
                                                          }
                                                          return null;
                                                        },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: phoneController,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                                hintText: "Phone number",
                                                hintStyle:
                                                    GoogleFonts.inknutAntiqua(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        fontSize: 15)),
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if(value!.isEmpty){
                                                return "please enter the phone";
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: emailController,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                                hintText: "E Mail",
                                                hintStyle:
                                                    GoogleFonts.inknutAntiqua(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        fontSize: 15)),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                                validator: (value) {
                                                  if(value!.isEmpty){
                                                    return "enter the email";
                                                  }
                                                  RegExp emailRegExp =RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                                                  );
                                                  if(!emailRegExp.hasMatch(value)){
                                                    return "please enter a valid email";
                                                  }
                                                  return null;
                                                },
                                                
                                          ),
                                          SizedBox(height: 10,),
                                          TextFormField(
                                            controller: passwordController,
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            style: TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                                hintText: "Password",
                                                hintStyle:
                                                    GoogleFonts.inknutAntiqua(
                                                        color: Colors.white
                                                            .withOpacity(0.5),fontSize:15)),
                                                            validator: (value) {
                                                              if(value!.isEmpty){
                                                                return "enter the password";
                                                              }
                                                              return null;
                                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30, left: 30),
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.amber[900])),
                                                onPressed: () async {
                                                  if(_formKey.currentState!.validate()){
                                                    setState(() {
                                                      email=emailController.text;
                                                      password=passwordController.text;
                                                    });
                                                    mentorregister().then((uid) => addmentorcontroller.addMentor(
                                                      MentorModel(
                                                        name: mentornameController.text,
                                                         qualification: qualificationController.text,
                                                          experience: experienceController.text,
                                                           language: languageController.text,
                                                            phone: phoneController.text,
                                                             email: emailController.text,
                                                              password: passwordController.text),
                                                               uid)

                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                                                      "new mentor add successfully")));
                                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>adment()));
                                                  }
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             adment()));
                                                },
                                                child: Text(
                                                  "Submit",
                                                  style:
                                                      GoogleFonts.inknutAntiqua(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                )),
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
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
