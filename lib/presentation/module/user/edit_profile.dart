import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/user_model.dart';
import 'package:hopehub/data/firebase/controller.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/widget/custome_snackbar.dart';
import 'package:image_picker/image_picker.dart';

class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

File? selectedImage;

class _editState extends State<edit> {
  Controller controller = Controller();
  final _firestore = FirebaseFirestore.instance;
  final _fireStorage= FirebaseStorage.instance.ref().child('image');
  String uniqueImageName = DateTime.now().microsecondsSinceEpoch.toString();
  final id = FirebaseAuth.instance.currentUser!.uid;
  DocumentSnapshot? user;
  File? selectedImage;
  // Uint8List? _image;
  String? imageURL;
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var emailController = TextEditingController();
  var watsappController = TextEditingController();

  getUser() async {
    user = await _firestore.collection("user").doc(id).get();
    nameController.text = user!["name"];
    addressController.text = user!["address"];
    emailController.text = user!["email"];
    watsappController.text = user!["phone"];
  }

  // Future<void> _pickedImageGallery() async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedImage == null) return;
  //   setState(() {
  //     selectedImage = File(pickedImage.path);
  //     _image = File(pickedImage.path).readAsBytesSync();
  //   });
  // }

  @override
  void initState() {
    getUser();
    super.initState();
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.white,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  Stack(
                    children: [
                      // Image.asset("assets/Rectangle 24.jpg"),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 320, top: 290),
                      //   child: CircleAvatar(
                      //     radius: 25,
                      //     backgroundColor: Colors.white,
                      //     child: CircleAvatar(
                      //       radius: 20,
                      //       child: Icon(
                      //         Icons.camera_alt_sharp,
                      //         color: Colors.white,
                      //         size: 30,
                      //       ),
                      //       backgroundColor: Colors.blue,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: selectedImage != null
                                    ? FileImage(selectedImage!)
                                    : AssetImage("assets/image.png")
                                        as ImageProvider<Object>),
                            shape: BoxShape.circle,
                            color: Colors.white),
                        height: 150,
                        width: 200,
                      ),

                      // CircleAvatar(
                      //     radius: 87,
                      //     backgroundImage: AssetImage(
                      //       "assets/user.jpg",
                      //     )),
                      Padding(
                        padding: const EdgeInsets.only(top: 110, left: 130),
                        child: Stack(
                          children: [
                            CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 20,
                                  child: IconButton(
                                      onPressed: _pickedImageGallery,
                                      icon: Icon(
                                        Icons.camera_alt_sharp,
                                        color: Colors.white,
                                        size: 25,
                                      )),
                                  backgroundColor: Colors.blue,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      height: 70,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: TextFormField(
                          controller: nameController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: "Name",
                              labelStyle: GoogleFonts.inknutAntiqua(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextFormField(
                        controller: addressController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: "Address",
                            labelStyle: GoogleFonts.inknutAntiqua(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 15)),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 70,
                  //   width: 350,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //       top: 20,
                  //     ),
                  //     child: TextFormField(
                  //       controller: emailController,
                  //       style: TextStyle(color: Colors.white),
                  //       decoration: InputDecoration(
                  //           border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(7),
                  //               borderSide: BorderSide(color: Colors.white)),
                  //           labelText: "E-Mail",
                  //           labelStyle: GoogleFonts.inknutAntiqua(
                  //               color: Colors.white.withOpacity(0.5),
                  //               fontSize: 15)),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 70,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextFormField(
                        controller: watsappController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: "Whatsapp Number",
                            labelStyle: GoogleFonts.inknutAntiqua(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side: BorderSide(color: Colors.white))),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.amber[900])),
                        onPressed: () async {
                          Reference referanceImageToUpload = _fireStorage.child(uniqueImageName);
                          try{
                            await referanceImageToUpload.putFile(selectedImage!);
                            imageURL = await referanceImageToUpload.getDownloadURL();
                          }catch(e){
                            print(e);
                          }
                          UserModel userMod = UserModel(
                              name: nameController.text,
                              email: emailController.text,
                              phone: watsappController.text,
                              address: addressController.text,
                              imageUrl: imageURL);
                              _firestore.collection("user").doc(id).update(userMod.toMap(id)).then((value) {
                                CSnackBar.showSuccesSnack(context, "Updated Succesfully");
                                Navigator.pop(context);
                              });
                        },
                        child: Text(
                          "Submit",
                          style: GoogleFonts.inknutAntiqua(
                              color: Colors.white, fontSize: 15),
                        )),
                  )
                ],
              );
            }),
      ),
    );
  }
}
