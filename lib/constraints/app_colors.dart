import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final backgroundProvider = StateProvider((ref) => Colors.indigo);
final textColorProvider = StateProvider((ref) => Colors.white);
final accentColorProvider = StateProvider((ref) => Colors.amber);
