import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/service/firebase.dart';

import 'base_model.dart';

class Chat extends BaseModel {
  String id;
  Timestamp dateCreated;
  String uidFrom;
  String uidTo;
  String message;

  Chat({
    this.id,
    this.dateCreated,
    this.uidFrom,
    this.uidTo,
    this.message,
  });

//fromDocumentSnapshot
  Chat.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    dateCreated = documentSnapshot.data()["dateCreated"];
    uidFrom = documentSnapshot.data()["uidFrom"];
    uidTo = documentSnapshot.data()["uidTo"];
    message = documentSnapshot.data()["message"];
  }

//toString
  @override
  String toString() {
    return '''Chat: {dateCreated = ${this.dateCreated},uidFrom = ${this.uidFrom},uidTo = ${this.uidTo},message = ${this.message}}''';
  }

//fromJson
  Chat.fromJson(Map<String, dynamic> json) {
    dateCreated = json['dateCreated'];
    uidFrom = json['uidFrom'];
    uidTo = json['uidTo'];
    message = json['message'];
  }

//toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['dateCreated'] = this.dateCreated;
    data['uidFrom'] = this.uidFrom;
    data['uidTo'] = this.uidTo;
    data['message'] = this.message;
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
        List<Chat> retVal = List();
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
      "message": chat.message,
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
          "message": chat.message,
        })
        .then((value) => print('success'))
        .catchError((err) {
          print(err.message);
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
      print(err.message);
      print(err.code);
    });
  }
}
