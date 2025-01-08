import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Seceond Page",
              textAlign: TextAlign.center,
            ),
            Text(
              provider.toString(),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () => ref.read(numberProvider.notifier).update((state) => state + 1),
              child: const Text("UP"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
