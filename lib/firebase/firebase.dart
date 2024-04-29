import 'package:flutter/material.dart';

class FirebaseFirestore extends StatefulWidget {
  static var instance;

  const FirebaseFirestore({super.key});

  @override
  State<FirebaseFirestore> createState() => _FirebaseFirestoreState();
}

class _FirebaseFirestoreState extends State<FirebaseFirestore> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}