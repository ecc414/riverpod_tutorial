import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/riverpod/provider.dart';
import 'package:riverpod_tutorial/riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterStateProvider);
    final filteredItemListState = ref.watch(filteredItemListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Screen"),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => Filter.values
                .map(
                  (filter) => PopupMenuItem(
                    value: filter,
                    child: Text(filter.name),
                  ),
                )
                .toList(),
          onSelected: (value) => ref.read(filterStateProvider.notifier).update((state) => value)
          ),
        ],
      ),
      body: ListView(
        children: filteredItemListState
            .map(
              (e) => CheckboxListTile(
                title: Text("${e.name}, ${e.count}"),
                value: e.checked,
                onChanged: (_) => ref.read(itemListStateNotifierProvider.notifier).toggleCheck(e.name),
              ),
            )
            .toList(),
      ),
    );
  }
}
