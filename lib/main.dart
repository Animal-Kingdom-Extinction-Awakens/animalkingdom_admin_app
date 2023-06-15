import 'package:animalkingdom_admin_app/app/app_module.dart';
import 'package:animalkingdom_admin_app/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

void main() => runApp(
      RxRoot(
        child: ModularApp(
          module: AppModule(),
          child: const AppWidget(),
        ),
      ),
    );
