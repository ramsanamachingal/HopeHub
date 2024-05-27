
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/Model/mentor_model.dart';
import 'package:hopehub/admin/adhome.dart';
import 'package:hopehub/admin/admenu.dart';
import 'package:hopehub/admin/adnotification.dart';
import 'package:hopehub/admin/aduser.dart';
import 'package:hopehub/admin/newment.dart';

class adment extends StatefulWidget {
  const adment({super.key});

  @override
  State<adment> createState() => _admentState();
}

class _admentState extends State<adment> {
  final _firestore =FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String id= _auth.currentUser!.uid;
    return Scaffold(
      drawer: admenu(),
       appBar: AppBar(backgroundColor: Colors.transparent,
      bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
      toolbarHeight: 50,
      leading: Builder(
        builder: (context) {
          return IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel,color: Colors.white,size: 30,));
        }
      ),
      actions: [IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>aduser()));}, icon: Icon(Icons.person,color: Colors.white,size: 30,)),
      IconButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>adnoti()));}, icon: Icon(Icons.mark_as_unread_sharp,color: Colors.white,size: 30,)),]

      ),
      backgroundColor: Colors.grey[900],
      body: Column(children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     height: 50,
        //     width: 375,
        //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.white),color:Colors.transparent ),
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 20,right: 20),
        //       child: Row(children: [SizedBox(
        //         height: 30,
        //         width: 160,
        //         child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),
        //                 side: BorderSide(color: Colors.white))),
        //                 backgroundColor:  MaterialStatePropertyAll(Colors.transparent)),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>adhome()));}, child: Text("Doctors",style: TextStyle(color: Colors.white,fontSize: 15),)),
        //       ),
        //       SizedBox(width: 5,),
        //       SizedBox(
        //         height: 30,
        //         width: 160,
        //         child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),
        //                 side: BorderSide(color: Colors.white))),
        //                 backgroundColor:  MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>adment()));}, child: Text("Mentors",style: TextStyle(color: Colors.white,fontSize: 15),)),
        //       )
              
        //       ],),
        //     ),),
        // ),
        StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('mentor').snapshots(),
           builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
              return Center(
                child: Text('No data available',style: TextStyle(color: Colors.white),),
              );

            }
            var mentors=snapshot.data!.docs.map((doc) => MentorModel.fromData(doc.data()as Map <String,dynamic>)).toList();
           return Expanded(
            child: ListView.builder(
              itemCount: mentors.length,
              itemBuilder:(context, index) {
                var mentormodel=mentors[index];
            return Padding(padding: EdgeInsets.all(10),
            child: Container(
              height: 240,
              width: 280,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.white),color: Colors.black),
              child: Column(children: [
               Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      mentormodel.name,
                    style: TextStyle(
                      color: Colors.white,fontSize: 25),),
                  ),
                ],
              ),
               Padding(
                padding: EdgeInsets.only(left: 20,top: 10),
                child: Row(
                  children: [
                   CircleAvatar(radius: 47,backgroundColor:Colors.white ,child: CircleAvatar(radius: 45,backgroundImage: AssetImage("assets/mentor.jpg"),),),
                    Padding(
                      padding: EdgeInsets.only(left: 10,top:10 ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          
                          Text(mentormodel.qualification,style: TextStyle(color: Colors.white,fontSize: 15),),
                          Text(mentormodel.experience,style: TextStyle(color: Colors.white,fontSize: 15),),
                          Text(mentormodel.language,style: TextStyle(color: Colors.white,fontSize: 15),),
                          Text(mentormodel.phone,style: TextStyle(color: Colors.white,fontSize: 15),),
                          Text(mentormodel.email,style: TextStyle(color: Colors.white,fontSize: 15),),
                           Text(mentormodel.password,style: TextStyle(color: Colors.white,fontSize: 15),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60,top: 15),
                child: Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>newment()));
                      }, child: Text("Edit",style: TextStyle(color: Colors.white,fontSize: 15),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){
                         
                        }, child: Text("Delete",style: TextStyle(color: Colors.white,fontSize: 15),)),
                      ),
                    ),
                  ],
                ),
              )
            ],),
            ),
            );
          }, ));
           }),
            
          ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7),side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(Colors.amber[900])),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>newment()));}, child: Text("Add New mentor",style: TextStyle(color: Colors.white,fontSize: 15),))
      ],),
    );
  }
}