import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hopehub/login/login1.dart';
import 'package:hopehub/user/home.dart';
import 'package:hopehub/user/package.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logo extends StatefulWidget {
  const logo({super.key});

  @override
  State<logo> createState() => _logoState();
}

class _logoState extends State<logo> {
  @override
void initState(){
  super.initState();
  Future.delayed(const Duration(seconds: 3),(){
    Timer(Duration(seconds: 1),()=> check( ));
  });

}
check( )async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String? name=preferences.getString('isloggin');
    

    if(name!=null)
    {
       Navigator.push(context,MaterialPageRoute(builder: (context) =>  packages(indexnum: 0,)) );
    }
    else
    {
      Navigator.push(context,MaterialPageRoute(builder: (context) =>  logo1()) );
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffdE1842E),
      body:
      Column(children: [
        SizedBox(height: 100,),
        Padding(
          padding: const EdgeInsets.only(left: 70,top: 200),
          child: Container(
            color: Colors.white,
            height: 100,
            width: 100,
          
            child: Image(image:AssetImage("assets/logonew.PNG",),fit: BoxFit.cover,),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 300,left: 100),
        //   child: Image.asset("assets/logonew.PNG",),
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 100,top: 50),
          child: Container(
            width: 200,
            height: 10,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1,color: Colors.white),color: Colors.white),
            child: Column(children: [Padding(
              padding: const EdgeInsets.only(right: 140),
              child: Container(
                height: 8,width: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1,color: Colors.white),color: Colors.amber[900]),
              ),
            ),],),),
            
        )
],),
       


    );
  }
}