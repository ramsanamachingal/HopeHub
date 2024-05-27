import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hopehub/Model/feedback_model.dart';
import 'package:hopehub/user/feedback.dart';

class FeedbackController{
  final db=FirebaseFirestore.instance;

  Future addFeedback(FeedbackModel feedbackModel,uid)async{
    final feedbackref=db.collection("feedback").doc(uid);
    feedbackref.set(feedbackModel.data(feedbackref.id));
  }
  FeedbackModel?singleFeedbackData;
  Future fetchSingleFeedback(id)async{
    final snapshot=await db.collection("feedback").doc(id)
    .get();
    singleFeedbackData=FeedbackModel.fromData(snapshot.data()!);
  }

}