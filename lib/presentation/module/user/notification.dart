import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/data/Model/booking_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/module/user/page_home.dart';
import 'package:hopehub/presentation/module/user/page_slote_package.dart';

class notifictn extends StatefulWidget {
  const notifictn({super.key});

  @override
  State<notifictn> createState() => _notifictnState();
}

class _notifictnState extends State<notifictn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: Text(
          "Notification",
          style: GoogleFonts.inknutAntiqua(color: Colors.white, fontSize: 15),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
      ),
      backgroundColor: Colors.grey[850],
      body: StreamBuilder<QuerySnapshot>(
          stream: DbController().getRejectedBooking(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<BookingModel> rejectedbooking = snapshot.data!.docs
                .map((e) =>
                    BookingModel.fromMap(e.data() as Map<String, dynamic>))
                .toList();

            return rejectedbooking.isEmpty
                ? Center(
                    child: Text("No Notification",style: GoogleFonts.inknutAntiqua(color:Colors.white),),
                  )
                : ListView.builder(
                    itemCount: rejectedbooking.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star_border_rounded,
                              color: Colors.yellow,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 300,
                                  height: 110,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.black),
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Your schedule is rejected. Please reschedule it.",
                                            style: GoogleFonts.inknutAntiqua(
                                                color: Colors.white),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SlotePackagePage(
                                                          bookingIdForReshedule: "",
                                                          isRescheduling: false,
                                                          isFreeBook: true,
                                                            drName:
                                                                "Doctor Name",
                                                            drid:
                                                                rejectedbooking[
                                                                        index]
                                                                    .doctorid,
                                                            email:
                                                                rejectedbooking[
                                                                        index]
                                                                    .email,
                                                            name:
                                                                rejectedbooking[
                                                                        index]
                                                                    .patientName,
                                                            whatsappnumber:
                                                                rejectedbooking[
                                                                        index]
                                                                    .whatsApp)));
                                          },
                                          child: Text("Click here",
                                              style: GoogleFonts.inknutAntiqua(
                                                  color: Colors.amber[900])))
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      );
                    });
          }),
    );
  }
}
