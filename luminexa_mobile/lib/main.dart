import 'package:firebase_core/firebase_core.dart';
import 'package:luminexa_mobile/configs/local_storage_config.dart';
import 'package:luminexa_mobile/enums/localTypes.dart';
import 'package:luminexa_mobile/models/themesModel.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/models/modeModel.dart';
import 'package:luminexa_mobile/models/notificationModel.dart';
import 'package:luminexa_mobile/models/scheduleModel.dart';
import 'package:luminexa_mobile/models/systemModel.dart';
import 'package:luminexa_mobile/providers/LedsProvider.dart';
import 'package:luminexa_mobile/providers/NotificationsProvider.dart';
import 'package:luminexa_mobile/providers/SchedulesProvider.dart';
import 'package:luminexa_mobile/providers/SystemsProvider.dart';
import 'package:luminexa_mobile/providers/ModesProvider.dart';
import 'package:luminexa_mobile/providers/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/screens/LandingPage.dart';
import 'package:luminexa_mobile/screens/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          theme: value.isDark ? CustomedTheme.dark : CustomedTheme.bright,
          debugShowCheckedModeBanner: false,
          home: _isloggedIn ? LandingPage() : LogIn(),
          onGenerateRoute: RouteManager.generateRoute,
        ),
      ),
    );
  }
}
