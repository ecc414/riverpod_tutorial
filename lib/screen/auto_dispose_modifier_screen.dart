import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/riverpod/auto_dispose_modifier.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifier);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          state.when(
            data: (data) => Text(data.toString(), textAlign: TextAlign.center,),
            error: (err, stack) => Text(err.toString(), textAlign: TextAlign.center,),
            loading: () => const Center(child: CircularProgressIndicator(),),
          ),
        ],
      ),
    );
  }
}
