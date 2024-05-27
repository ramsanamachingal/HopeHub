
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/admin/adnotification.dart';
import 'package:hopehub/admin/aduser.dart';

class admenu extends StatefulWidget {
  const admenu({super.key});

  @override
  State<admenu> createState() => _admenuState();
}

class _admenuState extends State<admenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          
          CircleAvatar(radius: 55,backgroundColor: Colors.white,child: CircleAvatar(radius: 50,backgroundImage: AssetImage("image/admin.jpg"),),),
          Padding(
            padding: const EdgeInsets.only(left: 100,top: 20),
            child: Text("Ramsana",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),),
          ),
          SizedBox(
            height: 50,
          ),
          ListTile(
            
            leading: Icon(Icons.language,color: Colors.white,),
          title: Text("Language",style: GoogleFonts.inknutAntiqua(color:Colors.white),
          ),
          trailing: Icon(Icons.arrow_drop_down_sharp,size: 60,color: Colors.white,),
          
          ),
          Divider(),
          ListTile(
            
            leading: Icon(Icons.brightness_4_outlined,color: Colors.white,),
          title: Text("Light mode",style: GoogleFonts.inknutAntiqua(color:Colors.white),
          ),
        
          
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>adnoti()));
            },
            leading: Icon(Icons.star,color: Colors.white,),
          title: Text("Review",style: GoogleFonts.inknutAntiqua(color:Colors.white),
          ),
          
          ),
          Divider(),
          ListTile(
             onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>aduser()));
            },
            
            leading: Icon(Icons.person,color: Colors.white,),
          title: Text("Patient Information",style: GoogleFonts.inknutAntiqua(color:Colors.white),
          ),
         
          
          ),
          Divider(),
        ],
      )
    );
      
    
  }
}