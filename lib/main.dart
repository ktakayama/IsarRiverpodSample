import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_riverpod_sample/providers/memo_service_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootWidghet(),
    );
  }
}

class RootWidghet extends ConsumerWidget {
  const RootWidghet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IsarRiverpodSample'),
      ),
      body: const MemoListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref
            .read(memoServiceProvider.future)
            .then((service) => service.addMemo()),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MemoListWidget extends ConsumerWidget {
  const MemoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memos = ref.watch(memoListProvider).value;

    if (memos == null) {
      return const SizedBox();
    }

    return ListView.builder(
      itemCount: memos.length,
      itemBuilder: (context, index) {
        final memo = memos[index];
        return Dismissible(
          key: Key(memo.id.toString()),
          onDismissed: (_) {
            ref
                .read(memoServiceProvider.future)
                .then((service) => service.removeMemo(memo.id));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${memo.fullTitle()} dismissed'),
              ),
            );
          },
          child: ListTile(
            title: Text(memo.fullTitle()),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => MemoDetailWidget(memo.id)),
            ),
          ),
        );
      },
    );
  }
}

class MemoDetailWidget extends ConsumerWidget {
  const MemoDetailWidget(
    this.id, {
    super.key,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memo = ref.watch(memoDetailProvider(id)).value;

    if (memo == null) {
      return const SizedBox();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(memo.fullTitle()),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(memo.body),
                Text('created: ${memo.created.toString()}'),
                Text('updated: ${memo.updated.toString()}'),
              ],
            ),
          ),
        ));
  }
}
