import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('built!!');

    // select로 원하는 값만 선택 가능
    final state = ref.watch(selectProvider.select((value) => value.checked));

    ref.listen(selectProvider.select((value) => value.count), (previous, next) {
      print('previous: $previous, next: $next');
    });


    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.toString()),
          // Text(ref.watch(selectProvider).count.toString()),
          ElevatedButton(
            onPressed: () => ref.read(selectProvider.notifier).toggleChecked(),
            child: const Text("check toggle"),
          ),
          ElevatedButton(
            onPressed: () => ref.read(selectProvider.notifier).countUp(),
            child: const Text("count up"),
          )
        ],
      ),
    );
  }
}