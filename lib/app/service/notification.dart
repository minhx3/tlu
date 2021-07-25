import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

class NotificationFCB {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static NotificationFCB get instance => NotificationFCB();

  Future takeFCMTokenWhenAppLaunch() async {
    try {
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        saveUerTokenToSharedPreference();
        print('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        saveUerTokenToSharedPreference();
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> saveUerTokenToSharedPreference() async {
    _firebaseMessaging
        .getToken(vapidKey: Constant.firebaseCloudvapidKey)
        .then((val) async {
      print('Token: ' + val);
      Storage.setUserToken(val);
    });
  }

  Future<void> updateTokenToServer() async {
    _firebaseMessaging
        .getToken(vapidKey: Constant.firebaseCloudvapidKey)
        .then((val) async {
      print('Token: ' + val);
      Storage.setUserToken(val);
      String userID = Storage.getUserId();
    });
  }

  Future initLocalNotification() async {
    if (Platform.isIOS) {
      // set iOS Local notification.
      var initializationSettingsAndroid =
          AndroidInitializationSettings('icon_notification');
      var initializationSettingsIOS = IOSInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
      );
      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
      await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: _selectNotification);
    } else {
      var initializationSettingsAndroid =
          AndroidInitializationSettings('icon_notification');
      var initializationSettingsIOS = IOSInitializationSettings(
          onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
      await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: _selectNotification);
    }
  }

  Future _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {}

  Future _selectNotification(String payload) async {}

  Future sendNotification() async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=${Constant.firebaseCloudserverToken}',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': 'this is a body',
              'title': 'this is a title'
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            'to': '/topics/KTHVNVDXH_sub1',
          },
        ),
      );
      print(response);
    } catch (e) {
      print("error push notification");
    }
  }

  Future<void> sendNotificationMessageToPeerUser(
      {unReadMSGCount = 0,
      messageType,
      textFromTextField,
      myName,
      userId,
      chatroomId,
      myImageUrl}) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=${Constant.firebaseCloudserverToken}',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': messageType == 'raw' ? '$textFromTextField' : '',
              'title': 'Bạn có tin nhắn mới từ $myName',
              'badge': '$unReadMSGCount', //'$unReadMSGCount'
              "image": myImageUrl,
              "sound": "default",
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done',
              'chatroomid': chatroomId,
              'userImage': myImageUrl,
              'userName': myName,
              'userId': userId,
              'message':
                  messageType == 'raw' ? '$textFromTextField' : '(Photo)',
            },
            'to': '/topics/$chatroomId',
          },
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
