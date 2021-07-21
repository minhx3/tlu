import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/service/firebase.dart';

import 'base_model.dart';

class Chat extends BaseModel {
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

  Chat(
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
  Chat.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
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

class ChatCrud {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _firebase = Get.put(FirebaseService<Chat>());

  static const Collection = FirebaseCollections.CHAT;

  Stream<List<Chat>> chatStream(groupId) {
    return _firebase.getListStream(
      groupId: groupId,
      collection: Collection,
      returnVal: (query) {
        List<Chat> retVal = [];
        query.docs.forEach((element) async {
          retVal.add(
            Chat.fromDocumentSnapshot(
              documentSnapshot: element,
            ),
          );
        });
        return retVal;
      },
    );
  }

  // this.id,
  // this.type,
  // this.file,
  // this.img,
  // this.replyId,
  // this.replyText,
  // this.dateCreated,
  // this.uidFrom,
  // this.uidTo,
  // this.text

  Future<String> addchat({Chat chat, groupId}) {
    final _data = {
      "dateCreated": Timestamp.now(),
      "uidFrom": chat.uidFrom,
      "uidTo": chat.uidTo,
      "text": chat.text,
      "type": chat.type,
      "file": chat.file,
      "img": chat.img,
      "replyId": chat.replyId,
      "replyText": chat.replyText,
    };
    return _firebase.crud(
      CrudState.add,
      collection: Collection,
      id: groupId,
      model: chat,
      wantLoading: false,
      data: _data,
    );
  }
}
