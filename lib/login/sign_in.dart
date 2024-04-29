import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/firebase/firebase.dart';
import 'package:hopehub/login/loginpage.dart';
import 'package:hopehub/user/home.dart';
import 'package:hopehub/user/package.dart';

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_instate();
}

class _sign_instate extends State<sign_in> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  final UserNameController=TextEditingController();
  final EmailController=TextEditingController();
  final NewPassController=TextEditingController();
  final ConfirmPassController=TextEditingController();
  final _formKey=GlobalKey<FormState>();

  String email="",password=""; 
//   // Future addfirebase(Map<String,dynamic>registereinfomap,String userid)async{
//   //   return FirebaseFirestore.instance
//   //   .collection('firebase')
//   //   .doc(userid)

//   //   .set(registereinfomap);
//   // }

register() async
{
try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
   ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign up Success"))
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => packages(indexnum: 0,),
            ));

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
     ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password is weak"))
        );
  } else if (e.code == 'email-already-in-use') {
    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email is already in use"))
        );
    // print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}



    
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(child: Form(
        key: _formKey,
        child: Column(
          children: [ Center(child: Padding(
            padding:  EdgeInsets.only(top: 60),
            child: Text("Signup",style: GoogleFonts.inknutAntiqua(color:Colors.amber[900],fontSize:30),),
          )),
        
          Padding(
            padding:  EdgeInsets.only(top: 80,left: 10,right: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: UserNameController,
              decoration: InputDecoration(border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Colors.white)),
            hintText: "Username",
            hintStyle:  TextStyle(color: Colors.white.withOpacity(0.5)),
            prefixIcon:  Icon(Icons.person_2_outlined,color: Colors.white,),
            
            ),
            validator: (value) {
              if(value!.isEmpty){
                return "Please Enter the Username";
              }
              return null;
            },
            style: TextStyle(color: Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: EmailController,
              decoration: InputDecoration(border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
            hintText: "Email",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            prefixIcon: Icon(Icons.email_outlined,color: Colors.white,)
            
            ),style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if(value!.isEmpty){
                return "Please Enter the Email";
              }
              RegExp emailRegExp=RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                );
                if(!emailRegExp.hasMatch(value))
                {
                  return "Please Enter a valid Email";
                }
              return null;
            },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: NewPassController,
              decoration: InputDecoration(border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            prefixIcon: Icon(Icons.lock_outlined,color: Colors.white,),
            suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.white,)
            ),style: TextStyle(color: Colors.white),
            validator: (value) {
              if(value!.isEmpty){
                return "Please Enter the Password";
              }
              return null;
            },
            
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: ConfirmPassController,
              decoration: InputDecoration(border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Colors.white)),
            hintText: "Confirm Password",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            prefixIcon: Icon(Icons.lock_reset,color: Colors.white,),
            suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.white ,)
            ),style: TextStyle(color: Colors.white),
            validator: (value) {
              if(value!.isEmpty){
                return "Please Enter the Confirm Password";
              }

              if((NewPassController.text != ConfirmPassController.text)){
                return "Password do not match with confirm password";
              }
              
              return null;
            },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(height: 40,width: 200,
              child: ElevatedButton(style:  ButtonStyle(shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius:BorderRadius.circular(7),side: BorderSide(color: Colors.white) )),
                backgroundColor: MaterialStatePropertyAll(Colors.amber[900])) ,onPressed: () async{
                if(_formKey.currentState!.validate()){
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>packages(indexnum: 0)));
                  setState(() {
                    email=EmailController.text;
                    password=NewPassController.text;
                  });
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>packages(indexnum: 0)));
                  register();
                  

                }
               
              }, child: Text("Sign up",style: GoogleFonts.inknutAntiqua(color: Colors.white,fontSize:20),)),
            ),
          )
          
          ],
        ),
      ),),
    );
  }
}