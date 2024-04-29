
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class reviews extends StatefulWidget {
  const reviews({super.key});

  @override
  State<reviews> createState() => _reviewsState();
}

class _reviewsState extends State<reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel,color: Colors.white,size: 35,),),
      bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
      toolbarHeight: 50,
      backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.only(top: 100,left: 20),
        child: 
        Column(children: [ Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.white),color: Colors.black,),
          height: 500,
          width: 340,
          
          child: Column(children: [Padding(
            padding: const EdgeInsets.only(top: 80,left: 5),
            child: SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                style: TextStyle(color: Colors.white),
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.white)),
              hintText: "E Mail",
              hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5),fontSize:15)
              ) ,
              keyboardType: TextInputType.emailAddress,
                      
                      ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.white),color: Colors.black,),
            height: 300,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
              
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(border: InputBorder.none,
                hintText: "Review",
                hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5),fontSize:15)
                ) ,
                maxLines: 5,
                
                
              ),
            ),
            ),
          )
        ],),),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){}, child: Text("Review",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15),)),
        )],
        )
        
        
        
       
      ),



      )
    );
  }
}
