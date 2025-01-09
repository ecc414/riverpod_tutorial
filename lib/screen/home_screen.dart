import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/riverpod/state_provider.dart';
import 'package:riverpod_tutorial/screen/auto_dispose_modifier_screen.dart';
import 'package:riverpod_tutorial/screen/family_modiifier_screen.dart';
import 'package:riverpod_tutorial/screen/future_provider_screen.dart';
import 'package:riverpod_tutorial/screen/state_provider_screen.dart';
import 'package:riverpod_tutorial/screen/state_notifier_provider_screen.dart';
import 'package:riverpod_tutorial/screen/stream_provider_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

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
              "Home",
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
              onPressed: () => ref.read(numberProvider.notifier).state = ref.read(numberProvider.notifier).state - 1,
              child: const Text("DOWN"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StateProviderScreen())),
              child: const Text("state provider page"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StateNotifierProviderScreen())),
              child: const Text("state notifier provider page"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FutureProviderScreen())),
              child: const Text("future provider page"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StreamProviderScreen())),
              child: const Text("stream provider page"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FamilyModifierScreen())),
              child: const Text("family modifier page"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AutoDisposeModifierScreen())),
              child: const Text("auto dispose modifier page"),
            ),
          ],
        ),
      ),
    );
  }
}
