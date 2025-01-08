import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<List<int>>((ref) async{
  await Future.delayed(const Duration(seconds: 2));

  // throw Exception("This is an error");

  return [1,2,3,4,5];
});