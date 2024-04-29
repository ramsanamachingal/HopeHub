
import 'package:flutter/material.dart';
import 'package:hopehub/user/home.dart';
import 'package:hopehub/user/payment.dart';
import 'package:hopehub/user/profilepage.dart';
import 'package:hopehub/user/schedule.dart';

class packages extends StatefulWidget {
   int indexnum=0;
   packages({super.key,required this.indexnum});

  @override
  State<packages> createState() => _packagesState();
}

class _packagesState extends State<packages> {
 final _pages=[
    // const logo(),
    // project(),
    const HomePage(),
    const schedle(),
    const pay(),
    const ProfilePage(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
  body: _pages[widget.indexnum],
      bottomNavigationBar:mynav(
        index:widget.indexnum,
        onTap:(index){
        setState(() {
          widget.indexnum=index;
        });
      }
        )

    );
  }
}
Widget mynav({
  int? index,
  void Function(int)?onTap,
  selectedcolor,
})
{
  return BottomNavigationBar(
    showUnselectedLabels: true,
    currentIndex: index!,
    selectedItemColor: Colors.amber[900],
    unselectedItemColor: Colors.white,
    showSelectedLabels: true,
    onTap: onTap ,
    items: [
      BottomNavigationBarItem(icon: const Icon(Icons.home),label: "Home",
      backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.pending_actions_rounded),label: "Schedule",
      backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.payment_outlined),label: "Payment",
      backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.person),label: "Profile",
      backgroundColor: Colors.grey[850],)
      
    ]);
    

}

   