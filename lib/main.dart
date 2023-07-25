import 'package:animalkingdom_admin_app/src/app_module.dart';
import 'package:animalkingdom_admin_app/src/app_widget.dart';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() => runApp(
      RxRoot(
        child: ModularApp(
          module: AppModule(),
          child: const AppWidget(),
        ),
      ),
    );
