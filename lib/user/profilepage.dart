import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/user/connection.dart';
import 'package:hopehub/user/edit_profile.dart';
import 'package:hopehub/user/menu.dart';
import 'package:hopehub/user/notification.dart';
import 'package:hopehub/user/package.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[850],

       drawer: const menuss(),
       appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        bottom: const PreferredSize(preferredSize:Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        leading: Center(child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Builder(
            builder: (context) {
              return IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
              }, icon: const Icon(Icons.menu,color: Colors.white,),);
            }
          )
        )),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text("Profile",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
        ),
        actions: [IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const notifictn()));}, icon: const Icon(
            Icons.notifications_on,
            color: Colors.white,
          ),),
          const Padding(
            padding: EdgeInsets.all(8),
            // child: Icon(Icons.chat_outlined),
          ),
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const connection()));}, icon: const Icon(
            Icons.chat_outlined,
            color: Colors.white,
          ),)],

      ),
       body: Column(
        children: [
          Stack(
            children: [Image.asset("assets/Rectangle 24.jpg"),
            const Padding(
              padding: EdgeInsets.only(left: 110,top: 240 ),
              child: CircleAvatar(
                radius: 87,
                backgroundImage: AssetImage("assets/user.jpg",), 
                
                ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 340,left: 250),
              child: Stack(children: [CircleAvatar(radius: 25,backgroundColor: Colors.white, 
              child: CircleAvatar(radius: 20, backgroundColor: Colors.blue,
              child:Icon(Icons.camera_alt_sharp,color: Colors.white,size: 30,) ,) )],),
            )
             
                
              
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,),
            child: Text("Catherine",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:24),),
            
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,),
            child: Text("London,England",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
            
          ),
           Padding(
            padding: const EdgeInsets.only(top: 10,),
            child: Text("7907048476",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
            
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,),
            child: Text("catherine@gmail.com",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),),
            
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50,top: 10),
            child: Row(
              children: [
                SizedBox(height: 40,width: 125,
                  child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side:const BorderSide(color: Colors.white))),backgroundColor:MaterialStatePropertyAll(Colors.amber[900])) ,onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const edit()));
                  }, child: Text("Edit",style: GoogleFonts.inknutAntiqua(color:Colors.white),))),
                SizedBox(height: 40,width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side:const BorderSide(color: Colors.white))),backgroundColor:MaterialStatePropertyAll(Colors.amber[900])) ,onPressed: (){}, child: Text("share",style: GoogleFonts.inknutAntiqua(color:Colors.white),)),
                  )),
              ],
            ),
          )
        ],
      ),
      

    );
  }
}