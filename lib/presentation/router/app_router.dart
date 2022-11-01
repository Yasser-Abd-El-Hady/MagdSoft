import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/verification/verification_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/view/help/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product/product_screen.dart';
import '../screens/shared/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case verifyScreen:
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case helpScreen:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case productScreen:
        return MaterialPageRoute(
            builder: (_) =>
                ProductScreen(product: settings.arguments as ProductModel));
      default:
        return null;
    }
  }
}
