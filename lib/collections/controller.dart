import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hopehub/Model/user_model.dart';

class Controller{
  // Instance of a firestore
   final db=FirebaseFirestore.instance;

  Future addUser(UserModel userModel,uid) async
  {
    // create collection
    final docRef=db.collection("user new").doc(uid);
    //set or add values to collection
    docRef.set(userModel.data(docRef.id));
  }  

 // Fetch single user
  UserModel? singleUserData;
  Future fetchSingleUser(id) async
  {

    final snapshot = await db.collection("user new").doc(id).get();
    singleUserData= UserModel.fromData(snapshot.data()!);
  }
}