import 'package:firebase_messaging/firebase_messaging.dart';

import '../export_shared.dart';
import 'local_notification_service.dart';

class FirebaseNotification {
  setUpFirebase() async {
    LocalNotificationService.initialize();
    await FirebaseMessaging.instance.subscribeToTopic('all');
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    await FirebaseMessaging.instance.getToken().then((value) {
      firebaseToken = value;
      print("firebaseToken:      $firebaseToken");
    });
    FirebaseMessaging.onMessage.listen((event) => onMessage(event));

    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        print(routeFromMessage + "getInitialMessage");
        //Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      print(routeFromMessage + " onMessageOpenedApp");
      //   Navigator.of(context).pushNamed(routeFromMessage);
    });
  }

  Future<dynamic> onMessage(RemoteMessage message) async {
    final notification = message.notification;
    if (notification != null) {
      final body = notification.body;
      final title = notification.title;
      if (body != null && title != null) {
        print("onMessage");
        //  AppToast.showMessage(message: title + "\n" + body);
        LocalNotificationService.display(message);
      }
    }
  }
}
