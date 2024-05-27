import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hopehub/Model/mentor_model.dart';

class Addmentorcontroller{
  final db=FirebaseFirestore.instance;
  
  Future addMentor(MentorModel mentorModel,uid)async{
    final mentRef=db.collection("mentor").doc(uid);
    mentRef.set(mentorModel.data(mentRef.id));
  }
  MentorModel?singleMentorData;
  Future fetchSingleMentor(id)async{
    final snapshot=await db.collection("mentor").doc(id)
    .get();
    singleMentorData=MentorModel.fromData(snapshot.data()!);
  }
}