import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/riverpod/state_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen> with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(numberProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(
      numberProvider,
      (previous, next) {
        if (previous != next) {
          controller.animateTo(next);
        }
      },
    );

    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: List.generate(
          controller.length,
          (index) => Column(
            children: [
              Text(index.toString()),
              ElevatedButton(
                onPressed: () => ref.read(numberProvider.notifier).update((state) => state <= 0 ? state : state - 1),
                child: const Text("previous"),
              ),
              ElevatedButton(
                onPressed: () => ref.read(numberProvider.notifier).update((state) => state + 1 >= controller.length ? state : state + 1),
                child: const Text("next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
