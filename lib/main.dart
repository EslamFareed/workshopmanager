import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workshopmanager/Core/constant/constant.dart';
import 'package:workshopmanager/custom_bloc_observer.dart';
import 'package:workshopmanager/workshop.dart';
import 'Core/utils/app_colors.dart';
import 'di.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging fireBaseMessaging = FirebaseMessaging.instance;

  deviceToken = await fireBaseMessaging.getToken();

  await fireBaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  await initDependencyInjection();

  await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingOnBackground);
  FirebaseMessaging.onMessage.listen((event) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 10,
      channelKey: 'basic_channel',
      actionType: ActionType.Default,
      title: event.notification!.title,
      body: event.notification!.body,
      wakeUpScreen: true,
      criticalAlert: true,
    ));
  });

  Bloc.observer = CustomBlocObserver();

  runApp(const WorkshopManager());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primary,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingOnBackground(event) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: 10,
    channelKey: 'basic_channel',
    actionType: ActionType.Default,
    title: event.notification!.title,
    body: event.notification!.body,
    wakeUpScreen: true,
    criticalAlert: true,
  ));
}
