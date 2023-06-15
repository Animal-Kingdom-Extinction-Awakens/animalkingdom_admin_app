import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
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
          ),
          const VerticalDivider(thickness: 1, width: 1),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Home Page'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
