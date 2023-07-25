import 'package:animalkingdom_admin_app/src/interactor/atoms/configuration_atom.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/app_page_template.dart';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage>
    with AppPageTemplate {
  @override
  Widget build(BuildContext context) {
    final themeMode = context.select(() => themeModeAtom.value);

    void _changeThemeMode(Set<ThemeMode> p1) {
      changeThemeModeAction.value = p1.first;
    }

    return template(
      page: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Configuration Page'),
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
            selected: {themeMode},
            onSelectionChanged: _changeThemeMode,
          ),
        ],
      ),
      index: 4,
    );
  }
}
