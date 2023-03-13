import 'package:flutter_test/flutter_test.dart';
import 'package:isar_riverpod_sample/providers/memo_service_provider.dart';

import 'test_utils.dart';

void main() {
  test('memoListProvider stream test', () async {
    final container = await createContainer();

    final provider = container.read(memoListProvider.stream);
    container.listen(memoListProvider, (prev, value) {});

    expectLater(
      provider.map((e) => e.length),
      emitsInOrder([0, 1, 2, 3, 4, 3]),
    );

    await container.pump();

    final service = await container.read(memoServiceProvider.future);
    await service.addMemo();
    await service.addMemo();
    await service.addMemo();
    final memo = await service.addMemo();
    await service.removeMemo(memo.id);
  });

  test('memoListProvider future test', () async {
    final container = await createContainer();

    final service = await container.read(memoServiceProvider.future);

    await service.addMemo();
    expect((await container.read(memoListProvider.future)).length, 1);

    await service.addMemo();
    expect((await container.read(memoListProvider.future)).length, 2);

    final memo = await service.addMemo();
    expect((await container.read(memoListProvider.future)).length, 3);

    await service.removeMemo(memo.id);
    expect((await container.read(memoListProvider.future)).length, 2);
  });
}
