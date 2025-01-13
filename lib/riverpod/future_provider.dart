import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/extension/ref_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'future_provider.g.dart';

// final futureProvider = FutureProvider<List<int>>((ref) async{
//
//   await Future.delayed(const Duration(seconds: 2));
//
//   ref.cacheFor(const Duration(seconds: 5));
//
//   // throw Exception("This is an error");
//
//   return [1,2,3,4,5];
// });


@riverpod
Future<List<int>> future(Ref ref) async{
  await Future.delayed(const Duration(seconds: 2));

  ref.cacheFor(const Duration(seconds: 5));

  // throw Exception("This is an error");

  return [1,2,3,4,5];
}