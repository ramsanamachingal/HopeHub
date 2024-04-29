// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:hopehub/forgot.dart';
// import 'package:hopehub/login/forgot.dart';
// import 'package:hopehub/user/myproject.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/user/home.dart';
import 'package:hopehub/login/forgot.dart';
import 'package:hopehub/user/package.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final UserNameController=TextEditingController();
  final PasswordController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String password="",email="";
 
    login()async
{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
 );
 ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login succesfull')));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => packages(indexnum: 0,),
            ));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The user is not found'),
          ));
  } else if (e.code == 'wrong-password') {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Wrong password'),
     ));
}
}
// ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Incorrect password or username'),
//      ));
}


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      

      backgroundColor: Colors.grey[800],
      
      body: SingleChildScrollView(child:  Center(
        child: Form(
          key: _formKey,
          child: Column(
            
            children: [
              SizedBox(height: 300,),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: UserNameController,
                  style: TextStyle(color: Colors.white),
                  decoration: 
                  
                    InputDecoration(
                    // fillColor: Colors.white,
                    // filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                      
                      
                          
                    ),
                    
                    hintText: "E Mail",
                    hintStyle:  GoogleFonts.inknutAntiqua(color: Colors.white.withOpacity(0.5),fontSize:15),
                    
                  prefixIcon:  Icon(Icons.email_outlined,color: Colors.white.withOpacity(0.5),),
                  
                  ),
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
               SizedBox(height: 30,),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: TextFormField(
                      autovalidateMode:AutovalidateMode.onUserInteraction,
                      controller: PasswordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                         border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide:  BorderSide(color: Colors.white.withOpacity(0.5))
                        ),
                        hintText: "Password",
                        hintStyle: GoogleFonts.inknutAntiqua(color: Colors.white.withOpacity(0.5),fontSize:15),
                        prefixIcon: Icon(Icons.lock_outlined,color: Colors.white.withOpacity(0.5),),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.white.withOpacity(0.5),size: 20,)
                    
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please Enter the Password";
                        }
                        return null;
                      },
                    
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 10,left: 200),
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>forgot()));
                  }, child: Text("Forget Password?",style:GoogleFonts.inknutAntiqua(color: Colors.white)),),
                ),
                SizedBox(height: 40,width: 250,
                  child: ElevatedButton(style: ButtonStyle(shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side:BorderSide(color: Colors.white)
                      )
                      ),
                      backgroundColor:  MaterialStatePropertyAll(Colors.amber[900])),
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                         setState(() {
                           email=UserNameController.text;
                           password=PasswordController.text;
                         });
                          login();
                        }
                    
                  },child: Text("Login",style: GoogleFonts.inknutAntiqua(color: Colors.white,fontSize:15),),),
                )
                ],
                
          
          ),
        ),
      )
      )
      // Container(height: double.infinity,width: double.infinity,decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Color.fromARGB(97, 22, 22, 22),Color.fromARGB(46, 27, 27, 26)])),)
     
    );
  }
}