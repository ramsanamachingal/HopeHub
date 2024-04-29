import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/user/booking.dart';
import 'package:hopehub/user/connection.dart';
import 'package:hopehub/user/menu.dart';
import 'package:hopehub/user/notification.dart';
import 'package:hopehub/user/package.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   //int selectColor = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.grey[850],
      drawer: const menuss(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom:
            const PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        leading: 
        // // Center(
          Builder(
            builder: (context) {
              return IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
                }, icon: const Icon(Icons.menu,color: Colors.white,));
            }
          ),
        //   Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        // ),
        title: Text(
          "Home",
          style: GoogleFonts.inknutAntiqua(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const notifictn()));
            },
            icon: const Icon(
              Icons.notifications_on,
            ),
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            // child: Icon(Icons.chat_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const connection()));
            },
            icon: const Icon(
              Icons.chat_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.white)),
                  labelText: "Search",
                  labelStyle: GoogleFonts.inknutAntiqua(
                      color: Colors.white.withOpacity(0.5)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white.withOpacity(0.5),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Popular Experts",
              style: GoogleFonts.inknutAntiqua(
                color: Colors.amber[900],
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const booking()));
                    },
                    child: Container(
                      // height: 150,
                      width: 350,

                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(7)),

                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/dr3.png",
                              scale: 1.3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    "DR.Rose",
                                    style: GoogleFonts.inknutAntiqua(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Clinical Psychologist",
                                    style: GoogleFonts.inknutAntiqua(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                          width: 150,
                                          child: Text(
                                            "Love and family",
                                            style: GoogleFonts.inknutAntiqua(
                                                color: Colors.white,
                                                fontSize: 15),
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.language,
                                      color: Colors.blue[900],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          "English,Hindi",
                                          style: GoogleFonts.inknutAntiqua(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),

    );
  }
}