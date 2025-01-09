import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/riverpod/family_modifier.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifier(3));

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
