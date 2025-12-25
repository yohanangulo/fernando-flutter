import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return const _ButtonsView();
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen '),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              // elevated
              ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
              const ElevatedButton(onPressed: null, child: Text('Elevated')),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_rounded),
                label: const Text('Elevated icon'),
              ),

              // filled
              FilledButton(onPressed: () {}, child: const Text('Filled')),
              FilledButton.icon(
                label: const Text('Filled icon'),
                onPressed: () {},
                icon: const Icon(Icons.accessibility_new),
              ),
              FilledButton.tonalIcon(
                label: const Text('Filled tonal icon'),
                onPressed: () {},
                icon: const Icon(Icons.accessibility_new),
              ),

              // Outlined
              OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
              OutlinedButton.icon(
                onPressed: () {},
                label: const Text('Outlined'),
                icon: const Icon(Icons.terminal),
              ),

              // Text
              TextButton(onPressed: () {}, child: const Text('Text')),
              TextButton.icon(
                onPressed: () {},
                label: const Text('Text'),
                icon: const Icon(Icons.terminal),
              ),

              // Icon
              IconButton(onPressed: () {}, icon: const Icon(Icons.terminal)),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.terminal),
              ),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.terminal),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.terminal),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(colors.primary),
                  iconColor: WidgetStateProperty.all(Colors.white),
                ),
              ),

              // Custom
              const CustomButton(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.pop,
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom Button', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
