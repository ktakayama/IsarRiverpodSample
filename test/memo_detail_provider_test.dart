import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar_riverpod_sample/models/memo.dart';
import 'package:isar_riverpod_sample/providers/isar_provider.dart';
import 'package:isar_riverpod_sample/providers/memo_service_provider.dart';

import 'test_utils.dart';

void main() {
  test('memoDetailProvider test', () async {
    final container = await createContainer();

    expect(container.read(memoListProvider),
        const AsyncValue<List<Memo>>.loading());

    final service = await container.read(memoServiceProvider.future);
    final memo = await service.addMemo();

    expect((await container.read(memoDetailProvider(memo.id).future)).title,
        memo.title);

    const updatedTitle = 'updated';
    final isar = await container.read(isarProvider.future);
    await isar.writeTxn(() async {
      final update =
          Memo(title: updatedTitle, body: memo.body, updated: DateTime.now())
            ..id = memo.id;
      await isar.memos.put(update);
    });

    expect((await container.read(memoDetailProvider(memo.id).future)).title,
        updatedTitle);
  });
}
