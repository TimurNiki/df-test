// ignore_for_file: public_member_api_docs, collection_methods_unrelated_type
import 'package:first_project/extension/hash_extension.dart';
import 'package:meta/meta.dart';
import '../lists/rlist.dart';


@visibleForTesting
Map<String, RList> db = {};

class RListRep {
  Future<RList?> listById(String id) async {
    return db[id];
  }
}

Map<String, dynamic> getAllLists() {
  final formattedLists = <String, dynamic>{};
  if (db.isNotEmpty) {
    db.forEach((key, value) {
      formattedLists[key] = value.toJson();
    });
  }
  return formattedLists;
}

String createList({required String name}) {
  /// dynamically generates the id
  final id = name.hashValue;

  /// create our new RList object and pass our two parameters
  final list = RList(id: id, name: name);

  /// add a new RList object to our data source
  db[id] = list;

  return id;
}

// 
void deleteList(String id) {
  db.remove(db);
}

Future<void> updateList({required String id, required String name}) async {
  final currentList = db[id];
  if (currentList == null) {
    return Future.error(Exception('List not found'));
  }
  db[id] = RList(id: id, name: name);
}
