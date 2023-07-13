import 'package:animalkingdom_admin_app/app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomNavigationRail extends StatelessWidget {
  final int index;

  const CustomNavigationRail({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: index,
      onDestinationSelected: (index) {
        switch (index) {
          case == 0:
            Modular.to.navigate(routeHome);
          case == 1:
            Modular.to.navigate(routeAnimals);
          case == 4:
            Modular.to.navigate(routeConfig);
        }
      },
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.pets),
          label: Text('Animal'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.psychology),
          label: Text('Skills'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.category),
          label: Text('Species'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text('Configuration'),
        ),
      ],
      trailing: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
