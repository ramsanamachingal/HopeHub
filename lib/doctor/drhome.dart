import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/user/chatting.dart';

import 'package:hopehub/doctor/drpro.dart';
import 'package:hopehub/doctor/drreport.dart';
import 'package:hopehub/login/login1.dart';

import 'package:hopehub/user/help.dart';
import 'package:hopehub/user/notification.dart';
import 'package:hopehub/user/settings.dart';

class drhome extends StatefulWidget {
  const drhome({super.key});

  @override
  State<drhome> createState() => _drhomeState();
}

class _drhomeState extends State<drhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      drawer: Drawer(
        child: ListView(
          children: [
            // UserAccountsDrawerHeader(accountName: Text("Catherine"), accountEmail: Text("catherine@gmail.com"),decoration:BoxDecoration(color: Colors.red) ,),

            Padding(
              padding: const EdgeInsets.only(right: 200, top: 20),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/dr3.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Dr.Dayana",
                style: GoogleFonts.inknutAntiqua(
                    color: Colors.white, fontSize: 18),
              ),
            ),

            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => drprofile()));
                },
                leading: Icon(
                  Icons.person,
                  size: 30,
                ),
                iconColor: Colors.amber[900],
                title: Text(
                  "Profile",
                  style: GoogleFonts.inknutAntiqua(
                      color: Colors.white, fontSize: 15),
                )),
            Divider(),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => drhome()));
                },
                leading: Icon(
                  Icons.pending_actions_rounded,
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

            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => drreport()));
              },
              leading: Icon(
                Icons.contact_page_outlined,
                size: 30,
              ),
              iconColor: Colors.amber[900],
              title: Text("Report",
                  style: GoogleFonts.inknutAntiqua(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
            
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => setting()));
              },
              leading: Icon(
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
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => helps()));
              },
              leading: Icon(
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
            Divider(),
            ListTile(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>logo1()));},
              leading: Icon(
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
            Divider(),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom:
            PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        // leading: Center(
        //   child: IconButton(onPressed: (){
        //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>menus()));
        //     }, icon: Icon(Icons.menu,color: Colors.white,))
        //   // Icon(
        //   //   Icons.menu,
        //   //   color: Colors.white,
        //   // ),
        // ),
        title: Text(
          "Home",
          style: GoogleFonts.inknutAntiqua(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => notifictn()));
            },
            icon: Icon(
              Icons.notifications_on,
            ),
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            // child: Icon(Icons.chat_outlined),
          ),
          
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
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
              "Available Schedule",
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
                  padding: EdgeInsets.all(10),
                  child: Container(
                  
                    
                    
                    height: 200,
                    width: 400,
                  
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(7)),
                  
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            "assets/usersc.jpg",
                            scale: 1.3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Catherine",
                                  style: GoogleFonts.inknutAntiqua(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              Text(
                                "catherine@gmail.com",
                                style: GoogleFonts.inknutAntiqua(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                    width: 150,
                                    child: Text(
                                      "7654985412",
                                      style: GoogleFonts.inknutAntiqua(
                                          color: Colors.white,
                                          fontSize: 15),
                                    )),
                              ),
                              Row(
                                children: [
                                  Text("Today     |",style: GoogleFonts.inknutAntiqua(
                                          color: Colors.white,
                                          fontSize: 15),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text(
                                        "10:00 PM",
                                        style: GoogleFonts.inknutAntiqua(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text("chat",style: GoogleFonts.inknutAntiqua(
                                            color: Colors.white, fontSize: 15),),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 15),
                                              child: Row(
                                                children: [
                                                 ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>chatting()));}, child: Text("Accept", style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),)),
                                                 Padding(
                                                   padding: const EdgeInsets.only(left: 10),
                                                   child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){}, child: Text("Reject", style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),)),
                                                 )
                                                ],
                                              ),
                                            )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(showSelectedLabels: true,
      // type: BottomNavigationBarType.fixed,
      // currentIndex: 0,
      // selectedItemColor: Colors.amber[900],

      // items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.amber[900],size: 30,),
      //   label: "Home"
      //   ),
      //   BottomNavigationBarItem(icon: Icon(Icons.contact_page_outlined,color: Colors.white,size: 30,),
      //   label: "Report"
      //   ),
      //   BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,size: 30,),
      //   label: "Profile"
      //   ),

      // ],backgroundColor: Colors.grey[850],
      // onTap: (index) {
      //   switch(index){
      //     case 0:
      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>drhome()));
      //     case 1:
      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>drreport()));
      //     case 2:
      //      Navigator.push(context, MaterialPageRoute(builder: (context)=>drprofile()));
           

      //   }
      // },
      // ),

      
    );
  }
}