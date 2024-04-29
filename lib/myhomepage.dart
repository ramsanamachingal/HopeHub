import 'package:flutter/material.dart';

class hopehub2 extends  StatefulWidget {
   const hopehub2({super.key,required this.title});
   final String title;
   @override
   State<hopehub2> createState() => _hopehub2state();
}

class _hopehub2state extends State<hopehub2>{  int _counter=0;
  @override
  void initState(){
    super.initState();
  }
  void dispose(){
    super.dispose();
  }
  void _incrementCounter(){
    setState(() {
      _counter++;

    });
  }
  void _decrimentCounter(){
    setState(() {
      _counter--;

    });
  }

  void _reset(){
    setState(() {
      _counter=0;

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(backgroundColor:Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title)),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('enter the button'),
            Text('$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
            ),
              Row(
              mainAxisAlignment:MainAxisAlignment.center,
 children: [
   FloatingActionButton(
    onPressed: _incrementCounter,
    tooltip: 'increment',
    child: const Icon(Icons.add),
  ),
  SizedBox(width: 10,),
   FloatingActionButton(
    onPressed: _reset,
    tooltip: 'reset',
    child: const Icon(Icons.refresh),
  ),
  SizedBox(width: 10,),
   FloatingActionButton(
    onPressed: _decrimentCounter,
    tooltip: 'decrement',
    child: const Icon(Icons.remove),
  ),
  
 ],
          )
          ],
        
        ),
      ),
      

         


    );
    
  }
}