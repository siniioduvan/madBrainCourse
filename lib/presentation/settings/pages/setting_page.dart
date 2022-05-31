import 'package:film/components/button/primary_button.dart';
import 'package:film/components/locals/locals.dart';
import 'package:film/presentation/settings/bloc/setting_bloc.dart';
import 'package:film/presentation/settings/bloc/setting_event.dart';
import 'package:film/presentation/settings/bloc/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const path = '/settings';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingBloc>(
        lazy: false,
        create: (_) => SettingBloc()
          ..add(
            LoadNameEvent(),
          ),
        child: const SettingsPageContent());
  }
}

class SettingsPageContent extends StatefulWidget {
  const SettingsPageContent({Key? key}) : super(key: key);

  @override
  State<SettingsPageContent> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.settingsTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SettingBloc, SettingState>(
                buildWhen: (oldState, newState) =>
                    oldState.name != newState.name,
                builder: (context2, state) {
                  return Text(state.name ?? '');
                }),
            PrimaryButton(context.locale.settingsGetName, onPressed: () {
              context.read<SettingBloc>().add(LoadNameEvent());
            }),
            PrimaryButton(context.locale.settingsSaveName,
                onPressed: () => context
                    .read<SettingBloc>()
                    .add(const SaveNameEvent(name: 'Иван Васильевич'))),
            PrimaryButton(context.locale.settingsClearName,
                onPressed: () =>
                    context.read<SettingBloc>().add(ClearNameEvent())),
            ElevatedButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(Icons.exit_to_app),
                  Text(context.locale.settingsExit),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(Icons.arrow_back),
                  Text(context.locale.settingsBack),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
