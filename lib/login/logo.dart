import 'package:flutter/material.dart';
import 'package:hopehub/login/login1.dart';

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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>logo1()));
  });
}


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.amber[800] ,
      body:
      Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 300,left: 100),
          child: Image.asset("assets/logo.png",),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100),
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