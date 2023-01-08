import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotifyHelper{


   FlutterLocalNotificationsPlugin
  flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  initializeNotification() async {
    tz.initializeTimeZones();
 final DarwinInitializationSettings initializationSettingsIOS =
     DarwinInitializationSettings(
         requestSoundPermission: false,
         requestBadgePermission: false,
         requestAlertPermission: false,
         onDidReceiveLocalNotification: onDidReceiveLocalNotification
     );


 final AndroidInitializationSettings initializationSettingsAndroid =
     AndroidInitializationSettings("app_icon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
       iOS: initializationSettingsIOS,
       android:initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: selectNotification,
       // onSelectNotification: selectNotification
       );

  }
 tz.TZDateTime dateTime= tz.TZDateTime.utc(2023,1,9,12,20);


 
   scheduledNotification() async {

    
     await flutterLocalNotificationsPlugin.zonedSchedule(
         0,
         'Turn Reminder',
         'Your turn is after 10 minutes next',        
         //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),  
         dateTime.subtract(Duration(minutes: 10))    , 
         const NotificationDetails(
             android: AndroidNotificationDetails(
              'your channel id',
                 'your channel name', 
               channelDescription:   'your channel description')),
         androidAllowWhileIdle: true,
         uiLocalNotificationDateInterpretation:
             UILocalNotificationDateInterpretation.absoluteTime);

   }

  displayNotification({required String title, required String body}) async {
    print("doing test");
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name',channelDescription:  'your channel description',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics =  DarwinNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'It could be anything you pass',
    );
  }

   void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future selectNotification(NotificationResponse payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
     Get.to(()=>Container(color: Colors.white,));
  }

  Future onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
      
       Get.dialog(Text('Welcome to flutter'));

     }
}