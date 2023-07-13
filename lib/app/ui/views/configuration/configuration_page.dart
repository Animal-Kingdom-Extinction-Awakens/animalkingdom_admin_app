import 'package:animalkingdom_admin_app/app/atoms/configuration_atom.dart';
import 'package:animalkingdom_admin_app/app/ui/views/widgets/app_page_template.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage>
    with AppPageTemplate {
  @override
  Widget build(BuildContext context) {
    context.select(() => [themeModeAtom.value]);

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
            selected: {themeModeAtom.value},
            onSelectionChanged: _changeThemeMode,
          ),
        ],
      ),
      index: 4,
    );
  }
}
