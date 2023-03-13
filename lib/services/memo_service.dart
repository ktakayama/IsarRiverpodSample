import 'dart:math';

import 'package:isar/isar.dart';
import 'package:isar_riverpod_sample/models/memo.dart';

class MemoService {
  const MemoService(this.isar);
  final Isar isar;

  Stream<Memo> watchMemo(Id id) async* {
    final query = isar.memos.where().idEqualTo(id);

    await for (final results in query.watch(fireImmediately: true)) {
      if (results.isNotEmpty) {
        yield results.first;
      }
    }
  }

  Stream<List<Memo>> watchAllMemos() async* {
    final query = isar.memos.where().sortByUpdated().build();

    await for (final results in query.watch(fireImmediately: true)) {
      if (results.isNotEmpty) {
        yield results;
      }
    }
  }

  addMemo() async {
    final randomString = Random().nextInt(10000).toString();
    final title = 'title$randomString';
    final memo = Memo(title: title, body: 'body', updated: DateTime.now());
    await isar.writeTxn(() async {
      await isar.memos.put(memo);
    });
  }

  removeMemo(int id) async {
    await isar.writeTxn(() async {
      await isar.memos.delete(id);
    });
  }
}
