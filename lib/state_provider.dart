import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeNumProvider = StateProvider<int>((ref) {
  return 0;
});

final subNumProvider = StateProvider<int>((ref) {
  return 0;
});