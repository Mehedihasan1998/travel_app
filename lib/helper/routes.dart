import 'package:get/get.dart';
import 'package:travel_app/screens/account_screen/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:travel_app/screens/account_screen/login.dart';
import 'package:travel_app/screens/account_screen/register.dart';
import 'package:travel_app/screens/main_screens/home.dart';
import 'package:travel_app/screens/splash_screen.dart';

class TripRoutes{
  static const Duration _duration = Duration(milliseconds: 300);
  static const String initial = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String fpMail = '/forgetPasswordMail';



  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen(), transition: Transition.rightToLeft, transitionDuration: _duration),
    GetPage(name: login, page: () => const LogIn(), transition: Transition.rightToLeft, transitionDuration: _duration),
    GetPage(name: home, page: () => const HomePage(), transition: Transition.rightToLeft, transitionDuration: _duration),
    GetPage(name: register, page: () => const Register(), transition: Transition.rightToLeft, transitionDuration: _duration),
    GetPage(name: fpMail, page: () => ForgetPasswordMail(), transition: Transition.rightToLeft, transitionDuration: _duration),
  ];
}