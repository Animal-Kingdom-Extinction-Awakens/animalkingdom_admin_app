import 'package:animalkingdom_admin_app/app/ui/views/widgets/app_page_template.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AppPageTemplate {
  @override
  Widget build(BuildContext context) {
    return template(
      page: Center(
        child: Text(
          'Home Page',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      index: 0,
    );
  }
}
