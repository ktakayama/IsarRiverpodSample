import 'package:flutter_test/flutter_test.dart';
import 'package:isar_riverpod_sample/models/memo.dart';
import 'package:isar_riverpod_sample/providers/isar_provider.dart';
import 'package:isar_riverpod_sample/providers/memo_service_provider.dart';

import 'test_utils.dart';

void main() {
  test('memoServiceProvider add test', () async {
    final container = await createContainer();

    final service = await container.read(memoServiceProvider.future);
    final memo = await service.addMemo();

    final isar = await container.read(isarProvider.future);
    final inserted = await isar.memos.get(memo.id);
    expect(memo.title, inserted?.title);
  });
}
