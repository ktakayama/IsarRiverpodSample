import 'package:isar/isar.dart';

part 'memo.g.dart';

@collection
class Memo {
  Memo({
    required this.title,
    required this.body,
    required this.updated,
  })  : id = Isar.autoIncrement,
        created = DateTime.now();

  Id id;

  final String title;
  final String body;

  final DateTime created;
  final DateTime updated;

  String fullTitle() {
    return 'ID: $id: title';
  }
}
