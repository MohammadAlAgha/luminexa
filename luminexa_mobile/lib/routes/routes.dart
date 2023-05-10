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
import 'package:luminexa_mobile/screens/notificationPage.dart';
import 'package:luminexa_mobile/screens/settingsPage.dart';
import 'package:luminexa_mobile/screens/systemPage.dart';
import 'package:luminexa_mobile/screens/viewUsersPage.dart';
import 'package:luminexa_mobile/screens/weatherPage.dart';

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
    dynamic _args(String argument) {
      if ((settings.arguments as Map)[argument] != null) {
        return (settings.arguments as Map)[argument];
      } else {
        throw Exception("No argument found");
      }
    }

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
          builder: (context) => SystemPage(
            systemId: (settings.arguments as Map)["systemId"],
            systemName: (settings.arguments as Map)["systemName"],
            isHost: (settings.arguments as Map)["isHost"],
          ),
        );
      //System Route

      case landingPage:
        return MaterialPageRoute(
          builder: (context) => LandingPage(
            isHost: (settings.arguments as Map)["isHost"],
          ),
        );
      //Landing Rourte

      case editLedPage:
        return MaterialPageRoute(
          builder: (context) => EditLeds(
            led: (settings.arguments as Map)["led"],
            systemId: (settings.arguments as Map)["systemId"],
            config: _args("config"),
          ),
        );
      //LEDs Routes

      case setModePage:
        return MaterialPageRoute(
          builder: (context) => SetModePage(
            systemId: (settings.arguments as Map)["systemId"],
          ),
        );
      //Modes Routes

      case setSchedulePage:
        return MaterialPageRoute(
          builder: (context) => SetSchedulePage(
            systemId: (settings.arguments as Map)["systemId"],
          ),
        );
      //Schedules Routes

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

      default:
        throw FormatException('Wrong Route');
    }
  }
}
