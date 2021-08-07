import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUser {
  String id;
  String type;
  String file;
  String img;
  String replyId;
  String replyText;
  String replyUserId;
  Timestamp dateCreated;
  String uidFrom;
  String uidTo;
  String text;

  ChatUser(
      {this.id,
      this.type,
      this.file,
      this.img,
      this.replyId,
      this.replyText,
      this.replyUserId,
      this.dateCreated,
      this.uidFrom,
      this.uidTo,
      this.text});

  //fromDocumentSnapshot
  ChatUser.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    dateCreated = documentSnapshot.data()["dateCreated"];
    uidFrom = documentSnapshot.data()["uidFrom"];
    uidTo = documentSnapshot.data()["uidTo"];
    type = documentSnapshot.data()["type"];
    file = documentSnapshot.data()["file"];
    img = documentSnapshot.data()["img"];
    replyId = documentSnapshot.data()["replyId"];
    replyId = documentSnapshot.data()["replyId"];
    replyText = documentSnapshot.data()["replyText"];
    replyUserId = documentSnapshot.data()["replyUserId"];
    text = documentSnapshot.data()["text"];
  }
}
