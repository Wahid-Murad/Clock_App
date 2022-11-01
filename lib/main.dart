import 'package:clock_app/homepage.dart';
import 'package:clock_app/views/enums.dart';
import 'package:clock_app/views/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid = AndroidInitializationSettings("");
  var initializationSettingsIOS=IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (int id,String ? title,String ? body,String ? payload) async{});
    var initializationSettings=InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIOS);

    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification:(String ? payload)async{
    //   if(payload!=null){
    //     debugPrint("Notification payload: "+payload);
    //   }
    // });

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(MenuType.clock),
        child: HomePage(),
      ),
    ),
  );
}

IOSInitializationSettings({required bool requestAlertPermission, required bool requestBadgePermission, required bool requestSoundPermission, required Future<Null> Function(int id, String? title, String? body, String? payload) onDidReceiveLocalNotification}) {
}

// IOSInitializationSettings({required bool requestAlertPermission, required bool requestBadgePermission, required bool requestSoundPermission, required Future<Null> Function(int id, String? title, String? body, String? payload) onDidReceiveLocalNotification}) {
// }
