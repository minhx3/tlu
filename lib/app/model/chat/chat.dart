import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/model/chat/user_entity.dart';
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
  int badge;

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
      this.text,
      this.badge});

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
    badge = documentSnapshot.data()["badge"];
  }
}

class ChatCrud {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _firebase = Get.put(FirebaseService<Chat>());

  static const Collection = FirebaseCollections.CHAT;

  Stream<List<Chat>> chatStream(groupId) {
    return _firebase.getListStream(
      id: groupId,
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

  Stream<List<Chat>> chatUserStream(groupId) {
    return _firebase.getListStream(
      id: groupId,
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

  Future sendNewChat({Chat chat, groupId, List<UserEntity> listUser}) {
    final _data = {
      "dateCreated": Timestamp.now(),
      "uidFrom": chat.uidFrom,
      "uidTo": chat.uidTo,
      "text": chat.text,
      "type": chat.type,
      "file": chat.file,
      "img": chat.img,
      "replyId": chat.replyId,
      "replyUserId": chat.replyUserId,
      "replyText": chat.replyText,
      "badge": chat.badge
    };
    try {
      _firestore
          .collection(FirebaseCollections.CHAT)
          .doc(groupId)
          .collection(groupId)
          .add(_data);

      listUser.forEach((element) {
        _firestore
            .collection(FirebaseCollections.USER)
            .doc(element.id)
            .collection(element.id)
            .doc(groupId)
            .set({..._data, 'badge': FieldValue.increment(1)},
                SetOptions(merge: true));
      });
    } on Exception catch (e) {
      print(e);
    } finally {}
  }

  Future changeUserStatus({Chat chat, groupId}) {
    final _data = {
      "dateCreated": Timestamp.now(),
      "uidFrom": chat.uidFrom,
      "uidTo": chat.uidTo,
      "text": chat.text,
      "type": chat.type,
      "file": chat.file,
      "img": chat.img,
      "replyId": chat.replyId,
      "replyUserId": chat.replyUserId,
      "replyText": chat.replyText,
    };

    return _firestore
        .collection(FirebaseCollections.CHAT)
        .doc(groupId)
        .collection('use_status')
        .add(_data);
  }
}
