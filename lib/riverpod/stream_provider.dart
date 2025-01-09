import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<List<int>>(
  (ref) async* {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(const Duration(seconds: 3));
      yield [i, i * 2, i * 3];
    }
  },
);
