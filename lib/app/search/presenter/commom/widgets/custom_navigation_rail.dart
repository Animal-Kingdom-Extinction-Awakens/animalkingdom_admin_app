import 'package:flutter/material.dart';

class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: 0,
      leading: const Padding(
        padding: EdgeInsets.only(top: 24, bottom: 32),
        child: Column(
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
          ],
        ),
      ),
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.pets),
          label: Text('Animal'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.psychology),
          label: Text('Add'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.category),
          label: Text('Add'),
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
