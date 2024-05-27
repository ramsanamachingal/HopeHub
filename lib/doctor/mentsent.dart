import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mentsent extends StatefulWidget {
  const mentsent({super.key});

  @override
  State<mentsent> createState() => _mentsentState();
}

class _mentsentState extends State<mentsent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom:
            PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
        toolbarHeight: 50,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.cancel,color: Colors.white,size: 30,)),
        ),
        backgroundColor: Colors.grey[900],
        body: Expanded(child: ListView.builder(itemCount: 3,itemBuilder: (context, index) {
         return Padding(padding: EdgeInsets.all(10),
         child: Container(height: 230,width: 350,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.white), color: Colors.black,),
         child: Padding(
           padding: const EdgeInsets.only(top: 20),
           child:Column(children: [
             Row(children: [
            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/mentor.jpg",
                                scale: 1.3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Denies Thomas",
                                      style: GoogleFonts.inknutAntiqua(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Msc Psychology",
                                      style: GoogleFonts.inknutAntiqua(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: SizedBox(
                                            width: 150,
                                            child: Text(
                                              "5 Years Experience",
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
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Text(
                                            "English,Hindi",
                                            style: GoogleFonts.inknutAntiqua(
                                                color: Colors.white, fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
           ],),
           SizedBox(
            width: 150,
            child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){}, child: Text("Send",style: GoogleFonts.inknutAntiqua(color:Colors.white),)))


           ],)
         ),
         ),
         
         
         ); 
        },))
    );
  }
}