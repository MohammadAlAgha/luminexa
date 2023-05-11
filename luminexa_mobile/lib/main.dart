import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:luminexa_mobile/FireBaseNotifications/localNotifications.dart';
import 'package:luminexa_mobile/configs/local_storage_config.dart';
import 'package:luminexa_mobile/enums/localTypes.dart';
import 'package:luminexa_mobile/models/themesModel.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/models/modeModel.dart';
import 'package:luminexa_mobile/models/notificationModel.dart';
import 'package:luminexa_mobile/models/scheduleModel.dart';
import 'package:luminexa_mobile/models/systemModel.dart';
import 'package:luminexa_mobile/models/userModel.dart';
import 'package:luminexa_mobile/providers/HostProvider.dart';
import 'package:luminexa_mobile/providers/LedsProvider.dart';
import 'package:luminexa_mobile/providers/NotificationsProvider.dart';
import 'package:luminexa_mobile/providers/SchedulesProvider.dart';
import 'package:luminexa_mobile/providers/SystemsProvider.dart';
import 'package:luminexa_mobile/providers/ModesProvider.dart';
import 'package:luminexa_mobile/providers/ThemeProvider.dart';
import 'package:luminexa_mobile/providers/UserProvider.dart';
import 'package:luminexa_mobile/providers/WeatherProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/screens/LandingPage.dart';
import 'package:luminexa_mobile/screens/Login.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.notification!.body);
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isloggedIn = false;
  bool _isDark = false;

  void logInChecker() async {
    final token = await getLocal(type: LocalTypes.String, key: "access_token");

    setState(() {
      _isloggedIn = (token != null); //false or true;
    });
  }

  Future<void> getTheme() async {
    final check = await ThemeProvider.getTheme();
    setState(() {
      _isDark = check;
    });
  }

  @override
  void initState() {
    super.initState();
    logInChecker();

    FirebaseMessaging.instance.getInitialMessage().then((event) {
      print("New message from terminated");
      print(event?.notification?.title);
      print(event?.notification?.body);
    });

    FirebaseMessaging.onMessage.listen(
      (event) {
        print("New message on foreground");
        print(event.notification?.title);
        print(event.notification?.body);
        LocalNotificationService.showMessageOnForeground(event);
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) {
        print("New message from background");
        print(event.notification?.title);
        print(event.notification?.body);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                UserProvider(user: User(name: "", email: "", isHost: false))),
        ChangeNotifierProvider(
            create: (context) => HostProvider(systemUsers: [])),
        ChangeNotifierProvider(
            create: (context) => ModesProvider(modes: <Mode>[])),
        ChangeNotifierProvider(
            create: (context) => SchedulesProvider(schedules: <Schedule>[])),
        ChangeNotifierProvider(
            create: (context) => SystemsProvider(systems: <System>[])),
        ChangeNotifierProvider(
            create: (context) => LedsProvider(leds: <Led>[])),
        ChangeNotifierProvider(
            create: (context) =>
                NotificationsProvider(notifications: <Notifications>[])),
        ChangeNotifierProvider(
            create: (context) => ThemeProvider(isDark: _isDark)),
        ChangeNotifierProvider(
            create: (context) => WeatherProvider(
                temp: "",
                wind: "",
                status: "",
                humidity: "",
                sunRise: DateTime.now(),
                sunSet: DateTime.now())),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          theme: value.isDark ? CustomedTheme.dark : CustomedTheme.bright,
          debugShowCheckedModeBanner: false,
          home: LogIn(),
          onGenerateRoute: RouteManager.generateRoute,
        ),
      ),
    );
  }
}
