

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/business_logic/firebase_options.dart';
import 'package:hopehub/user/home.dart';
// import 'package:hopehub/appbar.dart';
// import 'package:hopehub/demo.dart';
import 'package:hopehub/login/logo.dart';
import 'package:hopehub/login/loginpage.dart';
import 'package:hopehub/user/profilepage.dart';


Future<void> main()async {
    WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 63, 8, 80)),
        useMaterial3: true,
      ),
      home: const logo(),
      // home: (packages(indexnum: 0)),
      // home: packages(indexnum: 0,)
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});


//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 5;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//       print(_counter);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("hello");
   
//     return Scaffold(
//       appBar: AppBar(
        
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
//         title: Text(widget.title),
//       ),
//       body: Center(
       
//         child: Column(
          
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
