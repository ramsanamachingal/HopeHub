import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/Model/dr_model.dart';
import 'package:hopehub/admin/adment.dart';
import 'package:hopehub/admin/admenu.dart';
import 'package:hopehub/admin/adnotification.dart';
import 'package:hopehub/admin/aduser.dart';
import 'package:hopehub/admin/newdr.dart';
import 'package:hopehub/admin/newment.dart';
import 'package:image_picker/image_picker.dart';

class adhome extends StatefulWidget {
  const adhome({super.key});

  @override
  State<adhome> createState() => _adhomeState();
}
File?selectedImage;

class _adhomeState extends State<adhome> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final imageController=TextEditingController();

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

    String id = _auth.currentUser!.uid;
    return Scaffold(
      drawer: admenu(),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 50,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ));
          }),
          title: Text(
            "Doctors",
            style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 16),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => aduser()));
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => adnoti()));
                },
                icon: Icon(
                  Icons.mark_as_unread_sharp,
                  color: Colors.white,
                  size: 30,
                )),
          ]),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
         
          StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('doctor').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No data available',
                        style: TextStyle(color: Colors.white)),
                  );
                }

                var doctors = snapshot.data!.docs
                    .map((doc) =>
                        Drmodel.fromMap(doc.data() as Map<String, dynamic>))
                    .toList();

                return Expanded(
                    child: ListView.builder(
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    var drmodel = doctors[index];
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        height: 280,
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(width: 1, color: Colors.white),
                            color: const Color.fromRGBO(0, 0, 0, 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 250),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              side: BorderSide(
                                                  color: Colors.white))),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.amber[900])),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => adment()));
                                  },
                                  child: Text(
                                    " Mentors",
                                    style: GoogleFonts.inknutAntiqua(
                                        color: Colors.white),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                drmodel.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection("doctor")
                                          .doc(id)
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        Drmodel drmodel = Drmodel.fromMap(
                                            snapshot.data!.data()!);
                                        String image = drmodel.imageUrl.toString();
                                        return CircleAvatar(
                                          radius: 45,
                                          backgroundImage:
                                              NetworkImage(image)
                                        );
                                      }),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          drmodel.qualification,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          drmodel.expert,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          drmodel.language,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          drmodel.phone,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          drmodel.email,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          drmodel.password,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60, top: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 100,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    side: BorderSide(
                                                        color: Colors.white))),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.amber[900])),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      newdr()));
                                        },
                                        child: Text(
                                          "Edit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                      height: 30,
                                      width: 100,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      side: BorderSide(
                                                          color:
                                                              Colors.white))),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.amber[900])),
                                          onPressed: () {},
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ));
              }),
          ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(color: Colors.white))),
                  backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => newdr()));
              },
              child: Text(
                "Add New Doctor",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ))
        ],
      ),
    );
  }
}
