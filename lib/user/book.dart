import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/user/payment.dart';

class bookd extends StatefulWidget {
  const bookd({super.key});

  @override
  State<bookd> createState() => _bookdState();
}

class _bookdState extends State<bookd> {
  @override
  Widget build(BuildContext context) {
    DateTime _dateTime=DateTime.now();
    TimeOfDay _selectedtime = TimeOfDay.now();

    void _showdatepicker(){
      showDatePicker(context: context,
       firstDate: DateTime.now(),
        lastDate: DateTime(3000)).then((value) => setState(() {
          _dateTime = value!;
        }));
    }
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(backgroundColor: Colors.transparent,leading: IconButton(onPressed: (){
        Navigator.pop(context);}, icon:const Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 20,)),
      bottom: const PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()
      ),toolbarHeight: 50,
      title: Text("Booking",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:17),),
      ),
      body:SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 10,right: 20,bottom: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [Text("Enter Details:",style: GoogleFonts.inknutAntiqua(color:Colors.amber[900],fontSize:20),),
        Padding(
          padding: const EdgeInsets.only(top: 40,),
          child: TextField(style: const TextStyle(color: Colors.white),decoration: InputDecoration(
            border:  OutlineInputBorder(borderRadius:BorderRadius.circular(7),borderSide:const BorderSide(
              color: Colors.black) 
           ),hintText: "Name",hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5)),
           ),
           
           ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextField(style: const TextStyle(color: Colors.white),decoration: InputDecoration(
            border:  OutlineInputBorder(borderRadius:BorderRadius.circular(7),borderSide:const BorderSide(
              color: Colors.black) 
           ),hintText: "E Mail",hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5)),),
           keyboardType: TextInputType.emailAddress,
           ),
        ),

           Padding(
             padding: const EdgeInsets.only(top: 20),
             child: TextField(style: const TextStyle(color: Colors.white,
             
             
             
             ),decoration: InputDecoration(
              
              border:  OutlineInputBorder(borderRadius:BorderRadius.circular(7),borderSide:const BorderSide(
                color: Colors.black) 
              ),
              
              hintText: "Whatsapp Number",
              
              hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5)),),
              keyboardType:TextInputType.number ,
              ),
           ),

           Padding(
             padding: const EdgeInsets.only(top: 20),
             child: TextField(style: const  TextStyle(color: Colors.white),decoration: InputDecoration(
              border:  OutlineInputBorder(borderRadius:BorderRadius.circular(7),borderSide:const BorderSide(
                color: Colors.black) 
              ),hintText:'${_dateTime.day}-${_dateTime.month}-${_dateTime.year}' ,
              // "Booking Date",
              // hintStyle: GoogleFonts.inknutAntiqua(color:Colors.white.withOpacity(0.5)),
              suffixIcon:IconButton(onPressed: (){
                _showdatepicker();

              }, icon: const Icon(Icons.calendar_month_rounded,color: Colors.white,)) )
              ),
           ),
           Padding(
             padding: const EdgeInsets.only(top:20 ),
             child: Row(
               children: [Icon(Icons.access_time_rounded,color: Colors.amber[900],size: 30,),
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: Text("Time Slots:",style: GoogleFonts.inknutAntiqua(color:Colors.amber[900],fontSize:20)),
                 ),
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 20,top: 20),
             child: Row(mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Container(width: 80,height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                   padding: const EdgeInsets.only(top: 10,left: 5),
                   child: Text("1:00 PM",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
                 ),),
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: Container(width: 80,height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                     padding: const EdgeInsets.only(top: 10,left: 5),
                     child: Text("3:00 PM",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
                   ),),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: Container(width: 80,height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                     padding: const EdgeInsets.only(top: 10,left: 5),
                     child: Text("5:00 PM",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
                   ),),
                 ),
                 
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(top: 5,left: 20),
             child: Row(
               children: [
                 Container(width: 80,height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                         padding: const EdgeInsets.only(top: 10,left: 5),
                         child: Text("7:00 PM",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
                       ),),
             
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(width: 80,height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                                               padding: const EdgeInsets.only(top: 10,left: 5),
                                               child: Text("9:00 PM",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
                                             ),),
                        ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(width: 80,height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                       padding: const EdgeInsets.only(top: 10,left: 5),
                       child: Text("10:00 PM",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:12)),
                     ),),
                   ),
                   
               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.only(top: 5,left:20 ),
             child: Row(
               children: [
                 Container(width: 80,height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                         padding: const EdgeInsets.only(top: 10,left: 5),
                         child: Text("11:00 PM",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:12)),
                       ),),
             
                        Container(width: 80,height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                     padding: const EdgeInsets.only(top: 10,left: 5),
                     child: Text("12:00 PM",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:12)),
                   ),),
                   
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 2,top: 10),
             child: Row(
               children: [Icon(Icons.mode_standby_rounded,color: Colors.amber[900],size: 30,),
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: Text("Session Mode:",style: GoogleFonts.inknutAntiqua(color:Colors.amber[900],fontSize:20),),
                 ),
               ],
             ),
           ),
               Padding(
                 padding: const EdgeInsets.only(left: 10,top: 10),
                 child: Row(
                   children: [
                     Container(width: 80,height: 60,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                           padding: const EdgeInsets.only(top: 10,left: 5),
                           child: Column(
                             children: [
                               Icon(Icons.chat,color: Colors.amber[900],size: 30,),
                               Text("Chat",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:10),)
                             ],
                           )
                         ),),
                 
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Container(width: 80,height: 60,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                             padding: const EdgeInsets.only(top: 10,left: 5),
                             child: Column(
                               children: [
                                 Icon(Icons.call,color: Colors.amber[900],size: 30,),
                                 Text("call",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:10),)
                               ],
                             )
                                                      ),),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Container(width: 80,height: 60,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(7),color:Colors.transparent,),child: Padding(
                             padding: const EdgeInsets.only(top: 10,left: 5),
                             child: Column(
                               children: [
                                 Icon(Icons.videocam,color: Colors.amber[900],size: 30,),
                                 Text("Video Call",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:10),)
                               ],
                             )
                                                      ),),
                           ),
                 
                 
                 
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: const BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900],)),
                 onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const pay()));
                 }, child: Text("Payment",style: GoogleFonts.inknutAntiqua(color:Colors.white),)),
               )



        ],),
      ),

      )
      
           );
  }
}