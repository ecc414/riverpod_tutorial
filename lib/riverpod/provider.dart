import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/riverpod/state_notifier_provider.dart';

final filteredItemListProvider = Provider(
  (ref) {
    final filterState = ref.watch(filterStateProvider);
    final itemListState = ref.watch(itemListStateNotifierProvider);

    if (filterState == Filter.all) {
      return itemListState;
    }

    return itemListState.where((item) => item.checked == (filterState == Filter.checked)).toList();
  },
);

enum Filter {
  checked,
  notChecked,
  all,
}

final filterStateProvider = StateProvider<Filter>((ref) => Filter.all);
