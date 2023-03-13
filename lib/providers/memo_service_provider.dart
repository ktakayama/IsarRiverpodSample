import 'package:isar_riverpod_sample/models/memo.dart';
import 'package:isar_riverpod_sample/providers/isar_provider.dart';
import 'package:isar_riverpod_sample/services/memo_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar/isar.dart';

part 'memo_service_provider.g.dart';

@Riverpod(keepAlive: true)
Future<MemoService> memoService(MemoServiceRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return MemoService(isar);
}

@riverpod
Stream<Memo> memoDetail(MemoDetailRef ref, Id id) async* {
  final service = await ref.watch(memoServiceProvider.future);
  yield* service.watchMemo(id);
}

@riverpod
Stream<List<Memo>> memoList(MemoListRef ref) async* {
  final service = await ref.watch(memoServiceProvider.future);
  yield* service.watchAllMemos();
}
