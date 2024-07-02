import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/feedback_model.dart';

class adnoti extends StatefulWidget {
  const adnoti({super.key});

  @override
  State<adnoti> createState() => _adnotiState();
}

class _adnotiState extends State<adnoti> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(20), child: Divider()),
          toolbarHeight: 50,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 30,
              )),
          title: Text(
            "Feedback",
            style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.grey[850],
        body: StreamBuilder(
            stream: _firestore.collection('feedback').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var feedback = snapshot.data!.docs
                  .map((doc) => FeedbackModel.fromData(
                      doc.data() as Map<String, dynamic>))
                  .toList();
              return feedback.isEmpty
                  ? const Center(
                      child: Text('No Feedbacks',
                          style: TextStyle(color: Colors.white)),
                    )
                  : ListView.builder(
                      itemCount: feedback.length,
                      itemBuilder: ((context, index) {
                        var feedmodel = feedback[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.forward_to_inbox_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                      color: Colors.transparent),
                                  height: 250,
                                  width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 600,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              color: Colors.transparent),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 20),
                                            child: Text(
                                              feedmodel.email,
                                              style: GoogleFonts.inknutAntiqua(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          feedmodel.feedback,
                                          style: GoogleFonts.inknutAntiqua(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }));
            }));
  }
}
