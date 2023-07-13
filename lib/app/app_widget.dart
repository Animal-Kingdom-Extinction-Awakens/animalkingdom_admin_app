import 'package:animalkingdom_admin_app/app/atoms/configuration_atom.dart';
import 'package:animalkingdom_admin_app/app/ui/themes/themes.dart';
import 'package:animalkingdom_admin_app/app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(routeHome);
    context.select(() => [themeModeAtom.value]);

    return MaterialApp.router(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      themeMode: themeModeAtom.value,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
