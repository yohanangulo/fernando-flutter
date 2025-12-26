import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  static const String name = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return const _UiControlsView();
  }
}

enum Transportation { car, boat, plane, submarine }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ui Controls')),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          SwitchListTile(
            value: isDeveloperMode,
            title: const Text('Developer mode'),
            subtitle: const Text('Activar modo desarrollador'),
            onChanged: (value) => setState(() {
              isDeveloperMode = value;
            }),
          ),
          ExpansionTile(
            title: const Text('Vehiculo de transporte'),
            subtitle: Text(selectedTransportation.name),
            children: [
              RadioGroup<Transportation>(
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                  selectedTransportation = value!;
                }),
                child: Column(
                  children: Transportation.values
                      .map(
                        (t) => RadioListTile(
                          value: t,
                          title: Text(
                            t.name[0].toUpperCase() + t.name.substring(1),
                          ),
                          subtitle: Text('Travel by ${t.name}'),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          CheckboxListTile(
            title: const Text('Desayuno'),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
              wantsBreakfast = value ?? false;
            }),
          ),
          CheckboxListTile(
            title: const Text('Almuerzo'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
              wantsLunch = value ?? false;
            }),
          ),
          CheckboxListTile(
            title: const Text('Cena'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
              wantsDinner = value ?? false;
            }),
          ),
        ],
      ),
    );
  }
}
