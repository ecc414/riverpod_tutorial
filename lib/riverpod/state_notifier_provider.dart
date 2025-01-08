import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/model/check_model.dart';

final itemListStateNotifierProvider = StateNotifierProvider<ItemListStateNotifier, List<CheckModel>>((ref) => ItemListStateNotifier());

class ItemListStateNotifier extends StateNotifier<List<CheckModel>> {
  ItemListStateNotifier()
      : super([
          CheckModel(name: "라면", checked: false, count: 5),
          CheckModel(name: "연필", checked: false, count: 4),
          CheckModel(name: "책상", checked: false, count: 2),
          CheckModel(name: "노트북", checked: false, count: 7),
          CheckModel(name: "키보드", checked: false, count: 12),
        ]);

  void toggleCheck(String name) {
    state = state.map<CheckModel>((e) => e.name == name ? e.copyWith(checked: !e.checked) : e).toList();
  }
}
