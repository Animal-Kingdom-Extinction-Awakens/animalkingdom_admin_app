import 'package:animalkingdom_admin_app/app/ui/views/widgets/custom_navigation_rail.dart';
import 'package:flutter/material.dart';

mixin AppPageTemplate {
  Widget template({
    required Widget page,
    required int index,
  }) {
    return Scaffold(
      body: Row(
        children: [
          CustomNavigationRail(index: index),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: page,
          ),
        ],
      ),
    );
  }
}
