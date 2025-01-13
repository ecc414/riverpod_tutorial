import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension DisposeTextExtension on Ref {
  cacheFor(Duration duration) {
    final link = keepAlive();

    final timer = Timer(duration, () {
      print('timer done');
      link.close();
    });

    onDispose(timer.cancel);
  }
}