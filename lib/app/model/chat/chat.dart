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
  Timestamp dateCreated;
  String uidFrom;
  String uidTo;
  String text;

  Chat({
    this.id,
    this.dateCreated,
    this.uidFrom,
    this.uidTo,
    this.text,
  });

//fromDocumentSnapshot
  Chat.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    dateCreated = documentSnapshot.data()["dateCreated"];
    uidFrom = documentSnapshot.data()["uidFrom"];
    uidTo = documentSnapshot.data()["uidTo"];
    text = documentSnapshot.data()["message"];
  }

//toString
  @override
  String toString() {
    return '''Chat: {dateCreated = ${this.dateCreated},uidFrom = ${this.uidFrom},uidTo = ${this.uidTo},message = ${this.text}}''';
  }

//fromJson
  Chat.fromJson(Map<String, dynamic> json) {
    dateCreated = json['dateCreated'];
    uidFrom = json['uidFrom'];
    uidTo = json['uidTo'];
    text = json['message'];
  }

//toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['dateCreated'] = this.dateCreated;
    data['uidFrom'] = this.uidFrom;
    data['uidTo'] = this.uidTo;
    data['message'] = this.text;
    return data;
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

  Future<String> addchat({Chat chat, groupId}) {
    final _data = {
      "dateCreated": Timestamp.now(),
      "uidFrom": chat.uidFrom,
      "uidTo": chat.uidTo,
      "message": chat.text,
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

  void updatechat({Chat chat}) {
    _firestore
        .collection("chat")
        .doc(chat.id)
        .update({
          "uidFrom": chat.uidFrom,
          "uidTo": chat.uidTo,
          "message": chat.text,
        })
        .then((value) => print('success'))
        .catchError((err) {
          print(err.text);
          print(err.code);
        });
  }

  void deleteChat({String id}) {
    _firestore
        .collection("chat")
        .doc(id)
        .delete()
        .then((value) => print('success'))
        .catchError((err) {
      print(err.text);
      print(err.code);
    });
  }
}
