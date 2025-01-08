import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListProvider = ref.watch(itemListStateNotifierProvider);

    return Scaffold(
      body: ListView(
        children: itemListProvider.map(
          (e) => CheckboxListTile(
            title: Text("${e.name}, ${e.count}"),
            value: e.checked,
            onChanged: (_) => ref.read(itemListStateNotifierProvider.notifier).toggleCheck(e.name),
          ),
        ).toList(),
      ),
    );
  }
}
