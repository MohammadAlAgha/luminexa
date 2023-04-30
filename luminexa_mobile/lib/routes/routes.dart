import 'package:flutter/material.dart';
import 'package:luminexa_mobile/screens/AllNotifications.dart';
import 'package:luminexa_mobile/screens/ConsumptionPage.dart';
import 'package:luminexa_mobile/screens/LandingPage.dart';
import 'package:luminexa_mobile/screens/Login.dart';
import 'package:luminexa_mobile/screens/SchedulePage.dart';
import 'package:luminexa_mobile/screens/SetModePage.dart';
import 'package:luminexa_mobile/screens/SetSchedulePage.dart';
import 'package:luminexa_mobile/screens/SignUp.dart';
import 'package:luminexa_mobile/screens/editLedPage.dart';
import 'package:luminexa_mobile/screens/ledPage.dart';
import 'package:luminexa_mobile/screens/modePage.dart';
import 'package:luminexa_mobile/screens/notificationPage.dart';
import 'package:luminexa_mobile/screens/settingsPage.dart';
import 'package:luminexa_mobile/screens/systemPage.dart';
import 'package:luminexa_mobile/screens/viewUsersPage.dart';
import 'package:luminexa_mobile/screens/weatherPage.dart';
import 'package:luminexa_mobile/widgets/barChart/consumptionGraph.dart';

class RouteManager {
  static const String login = '/login';
  static const String signUp = '/signUp';

  static const String systemPage = '/systemPage';

  static const String landingPage = '/landingPage';

  static const String ledsPage = '/ledPage';
  static const String editLedPage = '/editLedPage';

  static const String modePage = '/modePage';
  static const String setModePage = '/setModePage';

  static const String schedulePage = '/schedulePage';
  static const String setSchedulePage = '/setSchedulePage';

  static const String notificationsPage = '/notificationsPage';
  static const String allNotifications = '/allNotifications';

  static const String settingsPage = '/settingsPage';

  static const String weatherPage = '/weatherPage';

  static const String consumptionPage = '/comnsumptionPage';
  static const String viewUsersPage = '/viewUsersPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (context) => LogIn(),
        );

      case signUp:
        return MaterialPageRoute(
          builder: (context) => SignUp(),
        );
      //Auth Routes

      case systemPage:
        return MaterialPageRoute(
          builder: (context) => SystemPage(),
        );
      //System Route

      case landingPage:
        return MaterialPageRoute(
          builder: (context) => LandingPage(),
        );
      //Landing Rourte

      case ledsPage:
        return MaterialPageRoute(
          builder: (context) => LedsPage(),
        );

      case editLedPage:
        return MaterialPageRoute(
          builder: (context) => EditLeds(),
        );
      //LEDs Routes

      case modePage:
        return MaterialPageRoute(
          builder: (context) => ModePage(),
        );

      case setModePage:
        return MaterialPageRoute(
          builder: (context) => SetModePage(),
        );
      //Modes Routes

      case schedulePage:
        return MaterialPageRoute(
          builder: (context) => SchedulePage(),
        );

      case setSchedulePage:
        return MaterialPageRoute(
          builder: (context) => SetSchedulePage(),
        );
      //Schedules Routes

      case notificationsPage:
        return MaterialPageRoute(
          builder: (context) => NotificationsPage(),
        );

      case allNotifications:
        return MaterialPageRoute(
          builder: (context) => AllNotifications(),
        );
      //Notifications Routes

      case settingsPage:
        return MaterialPageRoute(
          builder: (context) => SettingsPage(),
        );
      //settings Routes

      case weatherPage:
        return MaterialPageRoute(
          builder: (context) => WeatherPage(),
        );
      //Weather Routes

      case consumptionPage:
        return MaterialPageRoute(
          builder: (context) => ConsumptionPage(),
        );

      case viewUsersPage:
        return MaterialPageRoute(
          builder: (context) => ViewUsers(),
        );
      //Host Routes

      default:
        throw FormatException('Wrong Route');
    }
  }
}
