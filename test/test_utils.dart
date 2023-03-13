import 'dart:io';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import 'package:isar_riverpod_sample/models/memo.dart';
import 'package:isar_riverpod_sample/providers/isar_provider.dart';

Future<ProviderContainer> createContainer(
    {List<Override> overrides = const []}) async {
  final evacuation = HttpOverrides.current;
  HttpOverrides.global = null;
  await Isar.initializeIsarCore(download: true);
  HttpOverrides.global = evacuation;

  final random = Random().nextInt(10000).toString();

  final isar = await Isar.open(
    [MemoSchema],
    name: 'test_${random}_tmp',
  );

  final container = ProviderContainer(
      overrides: overrides + [isarProvider.overrideWith((ref) => isar)]);
  addTearDown(() async {
    await isar.close(deleteFromDisk: true);
    container.dispose();
  });

  return container;
}
