import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    initializeNotification();
  }


  //inisialisasi notifikasi
  void initializeNotification () {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
      
    const DarwinInitializationSettings iosInitializationSettings =
      DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
      InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings,
      );
    
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint('Notification clicked : ${response.payload}');
      },
    );
  }

  //fungsi untuk menampilkan fungsi
  Future<void> showNotification() async{
    const AndroidNotificationDetails androidDetails =
      AndroidNotificationDetails(
        'channel_id', 
        'channel_name',
        channelDescription: 'This is the channel description',
        sound: RawResourceAndroidNotificationSound('notif'),
        importance: Importance.high,
        priority: Priority.high,
      );

      const NotificationDetails notificationDetails =
        NotificationDetails(
          android: androidDetails,
          iOS: DarwinNotificationDetails(),
        );
      
      await flutterLocalNotificationsPlugin.show(
        0, 'Halo', 'Ini adalah notifikasi lokal',
        notificationDetails,
        payload: 'Payload Data',
      );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: showNotification,
           child: const Text('Tampilkan Notifikasi')
        ),
      ),
    );
  }
}