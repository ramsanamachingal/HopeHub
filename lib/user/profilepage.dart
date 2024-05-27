import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/Model/user_model.dart';
import 'package:hopehub/user/connection.dart';
import 'package:hopehub/user/edit_profile.dart';
import 'package:hopehub/user/menu.dart';
import 'package:hopehub/user/notification.dart';
//import 'package:hopehub/user/package.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

File? selectedImage;
File? selectedbg;

class _ProfilePageState extends State<ProfilePage> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final imageController = TextEditingController();
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

    Future<void> _backgroundImageGallery() async {
      final bgimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (bgimage == null) return;
      setState(() {
        selectedbg = File(bgimage.path);
      });
    }

    String id = _auth.currentUser!.uid;

    return Scaffold(
        backgroundColor: Colors.grey[850],
        drawer: const menuss(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 50,
          leading: Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    );
                  }))),
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Profile",
              style:
                  GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 18),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const notifictn()));
              },
              icon: const Icon(
                Icons.notifications_on,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              // child: Icon(Icons.chat_outlined),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const connection()));
              },
              icon: const Icon(
                Icons.chat_outlined,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Stack(children: [
              //   Container(
              //     height: 250,width: 360,

              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: selectedbg != null ?
              //         FileImage(selectedbg!):
              //         const AssetImage("assets/Rectangle 24.jpg") as ImageProvider <Object>

              //       ),

              //       color: Colors.white),
              //       ),
              //      Padding(
              // padding: const EdgeInsets.only(left: 310,top: 235 ),
              // child:Container(height: 35,width: 35,decoration: const BoxDecoration(shape: BoxShape.circle,color: Color.fromARGB(149, 255, 255, 255)),
              // child: IconButton(onPressed: ()async{
              //   await _backgroundImageGallery();
              // }, icon:const Icon(Icons.camera_alt_outlined,color: Colors.black,size: 20,) ),)
              //           ),
              //            Padding(
              // padding: const EdgeInsets.only(top: 192,left: 120),
              // child: Container(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: selectedImage != null ?
              //       FileImage(selectedImage!):
              //       const AssetImage('assets/image 4.jpg') as ImageProvider<Object>
              //       ),
              //     shape: BoxShape.circle,
              //     color: Colors.white),
              //     height: 150,
              //     width: 150,
              // child:Padding(
              //             padding: const EdgeInsets.only(top: 85,left: 115),
              //             child: Container(height: 15,width: 15,decoration: const BoxDecoration(shape: BoxShape.circle,color: Color.fromARGB(149, 255, 255, 255)),
              //               child: Padding(
              //                 padding: const EdgeInsets.only(right: 20),
              //                 child: IconButton(onPressed: ()async{
              //                   _pickedImageGallery().then((value) async {
              //                     SettableMetadata metadata =SettableMetadata(contentType: "image/jpg");
              //                     final currenttime = TimeOfDay.now();

              //                     UploadTask uploadTask=FirebaseStorage.instance
              //                     .ref()
              //                     .child("profileimage/profile$currenttime")
              //                     .putFile(selectedImage!,metadata);

              //                     TaskSnapshot snapshot=await uploadTask;
              //                     await snapshot.ref.getDownloadURL().then((url) {
              //                       String id=randomString(10);
              //                       FirebaseFirestore.instance
              //                       .collection('image')
              //                       .doc(id)
              //                       .update({'image':url});
              //                     } );

              //                   });
              //                 },icon:const Icon(Icons.camera_alt_outlined,color: Colors.black,size: 20,)),
              //               ),
              //             ),
              //           ),

              // ),
              //           )

              //           ],
              //         ),

              StreamBuilder(
                  stream: _firestore.collection('user new').doc(id).snapshots(),
                  builder: (context, snapshot) {
                    UserModel userModel =
                        UserModel.fromData(snapshot.data!.data()!);

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data == null) {
                      return const Center(
                        child: Text('No data available'),
                      );
                    }

                    // DocumentSnapshot data= snapshot.data!;
                    // print("${data['name']}");
                    //Fetch data from collection

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            userModel.name,
                            style: GoogleFonts.inknutAntiqua(
                                color: Colors.white, fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            userModel.email,
                            style: GoogleFonts.inknutAntiqua(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            userModel.phone,
                            style: GoogleFonts.inknutAntiqua(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            userModel.address,
                            style: GoogleFonts.inknutAntiqua(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    );
                  }),

              Padding(
                padding: const EdgeInsets.only(left: 50, top: 30),
                child: Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: 125,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        side: const BorderSide(
                                            color: Colors.white))),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.amber[900])),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const edit()));
                            },
                            child: Text(
                              "Edit",
                              style: GoogleFonts.inknutAntiqua(
                                  color: Colors.white),
                            ))),
                    SizedBox(
                        height: 40,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          side: const BorderSide(
                                              color: Colors.white))),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.amber[900])),
                              onPressed: () {},
                              child: Text(
                                "share",
                                style: GoogleFonts.inknutAntiqua(
                                    color: Colors.white),
                              )),
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
