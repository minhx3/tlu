import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphx/graphx.dart';
import 'package:path/path.dart' as p;
import 'package:thanglong_university/app/model/chat/base_model.dart';
import 'package:thanglong_university/app/views/views/loader.dart';

enum CrudState { add, update, delete }

typedef List<T> ListQuery<T extends BaseModel>(QuerySnapshot query);
typedef T SingleQuery<T extends BaseModel>(QuerySnapshot query);

class FirebaseService<T extends BaseModel> extends GetxService {
  String firebaseErrors(String errorCode) {
    String message;
    switch (errorCode) {
      case 'not-found':
        message = 'The Document is not found.';
        break;
      case 'object-not-found':
        message = 'Could not find the file or the photo.';
        break;
      default:
        message = 'Oops! Something went wrong. Try again later.';
        break;
    }

    return message;
  }

  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> crud(
    CrudState crudState, {
    Map<String, dynamic> data,
    @required String collection,
    @required T model,
    bool wantLoading = true,
    String id,
  }) async {
    if (crudState != CrudState.delete && data == null)
      return Future.error(
        'Bạn cần cung cấp dữ liệu',
      );
    if (crudState == CrudState.delete && id == null)
      return Future.error(
        'Bạn cần cung cấp dữ liệu gì đó',
      );
    if (wantLoading) {
      trace(wantLoading);
      await showLoadingWithProggress(
        wantProggress: false,
      );
      return await _crud(
        crudState,
        collection,
        data,
        model,
        id,
      );
    } else {
      return await _crud(
        crudState,
        collection,
        data,
        model,
        id,
      );
    }
  }

  Future<String> _crud(
    CrudState crudState,
    String collection,
    Map<String, dynamic> data,
    T model,
    String id,
  ) async {
    try {
      String _crudMessege = '';
      switch (crudState) {
        case CrudState.add:
          _crudMessege = 'Added';
          await _firestore
              .collection(collection)
              .doc(id)
              .collection(id)
              .add(data);
          break;
        case CrudState.update:
          _crudMessege = 'Updated';
          await _firestore.collection(collection).doc(model.id).update(data);
          break;
        case CrudState.delete:
          _crudMessege = 'Deleted';
          await _firestore.collection(collection).doc(id).delete();
          break;
        default:
      }
      return "Successfully $_crudMessege";
    } on FirebaseException catch (e) {
      return firebaseErrors(e.code);
    }
  }

  Stream<List<T>> getListStream(
          {ListQuery<T> returnVal, String collection, String id}) =>
      _firestore
          .collection(collection)
          .doc(id)
          .collection(id)
          .orderBy('dateCreated', descending: true)
          .snapshots()
          .map((QuerySnapshot query) => returnVal(query));

  Stream<T> getSingleStream([SingleQuery<T> returnVal, String collection]) =>
      _firestore
          .collection(collection)
          .snapshots()
          .map((QuerySnapshot query) => returnVal(query));

  Future<void> uploadFile({
    String fileName,
    String fileURL,
    String child,
  }) async {
    final File _file = File(fileURL);
    await _getRef(
      fileName,
      child,
    ).putFile(_file);
  }

  Future<void> deleteFile({
    String fileName,
    String child,
  }) async {
    await _getRef(
      fileName,
      child,
    ).delete();
  }

  Reference _getRef(
    String fileName,
    String child,
  ) {
    String _fileName = p.basename(fileName);
    final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
    final Reference _ref = _firebaseStorage.ref().child('/$child/$_fileName');
    return _ref;
  }

  Future<String> getDownloadURL({
    String child,
    String fileName,
  }) async {
    return await _getRef(
      fileName,
      child,
    ).getDownloadURL();
  }
}

abstract class FirebaseCollections {
  static const USER = 'users';
  static const CHAT = 'chats';
}
