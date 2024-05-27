import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hopehub/Model/dr_model.dart';

class Adddrcontroller{
  final db=FirebaseFirestore.instance;
  
  Future addDr(Drmodel drmodel,uid)async{
    final docRef=db.collection("doctor").doc(uid);
    docRef.set(drmodel.data(docRef.id));
  }
  Drmodel?singleDrData;
  Future fetchSingleDr(id)async{
    final snapshot=await db.collection("doctor").doc(id).get();
    singleDrData=Drmodel.fromData(snapshot.data()!);
  }

}