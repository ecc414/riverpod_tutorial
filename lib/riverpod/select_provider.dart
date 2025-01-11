import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/model/check_model.dart';

final selectProvider = StateNotifierProvider<SelectProvider, CheckModel>(
  (ref) => SelectProvider(),
);

class SelectProvider extends StateNotifier<CheckModel> {
  SelectProvider()
      : super(
          CheckModel(
            name: "김치",
            checked: false,
            count: 2,
          ),
        );

  void toggleChecked() {
    state = state.copyWith(checked: !state.checked);
  }

  void countUp() {
    state = state.copyWith(count: state.count + 1);
  }
}
