import 'package:chefs_book/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefs_book/data/data.dart';

final chefsProvider = FutureProvider<List<User>>((ref) async {
  return await availableChefs; // Asynchronous fetch of chefs
});
