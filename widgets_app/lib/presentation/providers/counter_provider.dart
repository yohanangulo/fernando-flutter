import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  CounterNotifier();

  void increment() => state++;
  void decrement() => state--;

  @override
  int build() => 0;
}

final counterProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);
