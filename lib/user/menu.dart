// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/login/login1.dart';
import 'package:hopehub/user/help.dart';

import 'package:hopehub/user/payment.dart';

import 'package:hopehub/user/profilepage.dart';
import 'package:hopehub/user/review.dart';
import 'package:hopehub/user/schedule.dart';
import 'package:hopehub/user/settings.dart';

class menuss extends StatefulWidget {
  const menuss({super.key});

  @override
  State<menuss> createState() => _menussState();
}

class _menussState extends State<menuss> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
          children: [
            // UserAccountsDrawerHeader(accountName: Text("Catherine"), accountEmail: Text("catherine@gmail.com"),decoration:BoxDecoration(color: Colors.red) ,),

            const Padding(
              padding: EdgeInsets.only(right: 200, top: 20),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/user.jpg"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Catherine",
                style: GoogleFonts.inknutAntiqua(
                    color: Colors.white, fontSize: 18),
              ),
            ),

            const SizedBox(height: 30,),

            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()));
                },
                leading: const Icon(
                  Icons.person,
                  size: 30,
                ),
                iconColor: Colors.amber[900],
                title: Text(
                  "Profile",
                  style: GoogleFonts.inknutAntiqua(
                      color: Colors.white, fontSize: 15),
                )),
            const Divider(),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const schedle()));
                },
                leading: const Icon(
                  Icons.system_security_update_good_rounded,
                  size: 30,
                ),
                iconColor: Colors.amber[900],
                title: Text(
                  "My Schedule",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),

            const Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const pay()));
              },
              leading: const Icon(
                Icons.payment_rounded,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Payment",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const reviews()));
              },
              leading: const Icon(
                Icons.person_add_alt_1,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Review",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const setting()));
              },
              leading: const Icon(
                Icons.settings,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Settings",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const helps()));
              },
              leading: const Icon(
                Icons.help,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Help",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const logo1()));
              },
              leading: const Icon(
                Icons.logout,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Logout",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            const Divider(),
          ],
        ),
    );
  }
}