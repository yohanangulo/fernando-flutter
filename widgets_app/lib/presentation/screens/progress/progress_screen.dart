import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const String name = 'progress_screen';

  @override
  Widget build(BuildContext context) {
    return const _ProgressView();
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text('Circular Progress Indicators'),
            SizedBox(height: 10),
            CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Colors.black45,
            ),
            SizedBox(height: 20),
            Text('Circular Progress Controlado'),
            SizedBox(height: 10),
            _ControlledProgressIndicator()
          ],
        ),
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 50),
      builder: (context, asyncSnapshot) {
        final progress = asyncSnapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeWidth: 2,
                backgroundColor: Colors.black45,
              ),
              const SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progress))
            ],
          ),
        );
      },
    );
  }
}
