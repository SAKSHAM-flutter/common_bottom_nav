
import 'package:common_bottom_nav/bottom_navigation/bottom_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation/bottom_screen.dart';

class RouteHelper {
  static Map<String, WidgetBuilder> createRoutes() {
    BottomViewModel bottomViewModel = BottomViewModel();
    return {


      BottomScreenView.route: (_) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: bottomViewModel),
          // ChangeNotifierProvider(create: (_) => HomeViewModel()),
          // ChangeNotifierProvider(create: (_) => NotificationViewModel()),
          // ChangeNotifierProvider(create: (_) => ProfileViewModel()),
          // ChangeNotifierProvider(create: (_) => SearchViewModel()),
          // ChangeNotifierProvider(create: (_) => ChangePasswordViewModel()),
          // ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ],
        child: const BottomScreenView(),
      ),
    };
  }
}