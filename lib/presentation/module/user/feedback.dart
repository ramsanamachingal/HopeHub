import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/feedback_model.dart';
import 'package:hopehub/data/Model/user_model.dart';
import 'package:hopehub/presentation/module/user/page_home.dart';
import 'package:hopehub/presentation/widget/custome_snackbar.dart';
import 'package:random_string/random_string.dart';

class feedback extends StatefulWidget {
  const feedback({super.key});

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final emailController=TextEditingController(text: FirebaseAuth.instance.currentUser!.email.toString());
  final feedbackController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    String id = _auth.currentUser!.uid;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.white,
              size: 35,
            ),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[850],
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.black,
                    ),
                    height: 500,
                    width: 340,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80, left: 5),
                          child: SizedBox(
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              controller: emailController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide:
                                          BorderSide(color: Colors.white)),),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(width: 1, color: Colors.white),
                              color: Colors.black,
                            ),
                            height: 300,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                controller: feedbackController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "feedback",
                                    hintStyle: GoogleFonts.inknutAntiqua(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 15)),
                                maxLines: 10,
                                maxLength: 200,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side: BorderSide(color: Colors.white))),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.amber[900])),
                        onPressed: () async {
                          String id = randomAlpha(6);
                          FeedbackModel feedbackModel = FeedbackModel(email: emailController.text, feedback: feedbackController.text);
                          await _firestore.collection("feedback").doc(id).set(feedbackModel.data(id)).then((value) {
                            CSnackBar.showSuccesSnack(context, 'Feedback Added');
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                          });
                        },
                        child: Text(
                          "Feedback",
                          style: GoogleFonts.inknutAntiqua(
                              color: Colors.white, fontSize: 15),
                        )),
                  )
                ],
              )),
        ));
  }
}
