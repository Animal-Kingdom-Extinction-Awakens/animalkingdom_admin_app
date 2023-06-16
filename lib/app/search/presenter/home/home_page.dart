import 'package:animalkingdom_admin_app/app/search/presenter/atoms/app_atom.dart';
import 'package:animalkingdom_admin_app/app/search/presenter/commom/widgets/custom_navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.select(() => [themeModeAtom.value]);

    void _changeThemeMode(Set<ThemeMode> p1) {
      changeThemeModeAction.value = p1.first;
    }

    return Scaffold(
      body: Row(
        children: [
          const CustomNavigationRail(),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Home Page'),
                SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment(
                      value: ThemeMode.system,
                      label: Text('Sistema'),
                    ),
                    ButtonSegment(
                      value: ThemeMode.light,
                      label: Text('Claro'),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      label: Text('Escuro'),
                    ),
                  ],
                  selected: {themeModeAtom.value},
                  onSelectionChanged: _changeThemeMode,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
