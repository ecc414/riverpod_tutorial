import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/model/check_model.dart';

final itemListStateNotifierProvider = StateNotifierProvider<ItemListStateNotifier, List<CheckModel>>((ref) => ItemListStateNotifier(ref));

class ItemListStateNotifier extends StateNotifier<List<CheckModel>> {
  ItemListStateNotifier(this.ref)
      : super([
          CheckModel(name: "라면", checked: false, count: 5),
          CheckModel(name: "연필", checked: true, count: 4),
          CheckModel(name: "책상", checked: false, count: 2),
          CheckModel(name: "노트북", checked: true, count: 7),
          CheckModel(name: "키보드", checked: false, count: 12),
        ]){
    link = ref.keepAlive();
  }

  final Ref ref;
  late final KeepAliveLink link;

  void toggleCheck(String name) {
    state = state.map<CheckModel>((e) => e.name == name ? e.copyWith(checked: !e.checked) : e).toList();
  }

  void close () {
    print("closed!!");
    link.close();
  }
}
