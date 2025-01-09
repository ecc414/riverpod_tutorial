import 'package:flutter_riverpod/flutter_riverpod.dart';

// 사용되고 데이터가 캐싱되지 않고 삭제되어야할 때 사용
final autoDisposeModifier = FutureProvider.autoDispose<List<int>>(
  (ref) async {
    await Future.delayed(const Duration(seconds: 3));
    return [1,2,3,4,5];
  },
);
