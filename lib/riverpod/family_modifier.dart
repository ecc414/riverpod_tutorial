import 'package:flutter_riverpod/flutter_riverpod.dart';

// family modifier는 프로바이더 생성 시 변수를 받아 프로바이더 내부에서 활용해야할때 사용
final familyModifier = FutureProvider.family<List<int>, int>(
  (ref, data) async {
    await Future.delayed(const Duration(seconds: 3));
    return List.generate(5, (index) => index * data);
  },
);
