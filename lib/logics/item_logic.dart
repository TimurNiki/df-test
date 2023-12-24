// ignore_for_file: public_member_api_docs
import 'package:first_project/extension/hash_extension.dart';
import '../items/item_rep.dart';

final itemDb = <String, Item>{};

/// Repository class for Item
///
final class ItemRepository {
  /// Check in the internal data source for an item with the given [id
  Future<Item?> itemById(String id) async {
    return itemDb[id];
  }

  /// Get all the items from the data source
  Map<String, dynamic> getAllItems() {
    final formattedItems = <String, dynamic>{};

    if (itemDb.isNotEmpty) {
      itemDb.forEach((key, value) {
        formattedItems[key] = value.toJson();
      });
    }

    return formattedItems;
  }

  /// Get items by list id
  Map<String, dynamic> getItemsByList(String listid) {
    final formattedItems = <String, dynamic>{};
    if (itemDb.isNotEmpty) {
      itemDb.forEach((key, value) {
        if (value.listid == listid) {
          formattedItems[key] = value.toJson();
        }
      });
    }
    return formattedItems;
  }

  /// Create a new item with a given information
  String createItem({
    required String name,
    required String listid,
    required String description,
    required bool status,
  }) {
    /// dynamically generates the id
    final id = name.hashValue;

    /// create our new iTEM object and pass ALL THE parameters
    final item = Item(
        id: id,
        name: name,
        listid: listid,
        description: description,
        status: status);

    /// add a new list object to our data source
    itemDb[id] = item;

    return id;
  }

  /// Deletes the item object with the given [id]
  void deleteItem(String id) {
    itemDb.remove(id);
  }

  /// Update operation
  Future<void> updateItem({
    required String id,
    required String name,
    required String listid,
    required String description,
    required bool status,
  }) async {
    final currentItem = itemDb[id];

    if (currentItem == null) {
      return Future.error(Exception('Item not found'));
    }

    itemDb[id] = Item(
      id: id,
      name: name,
      listid: listid,
      description: description,
      status: status,
    );
  }
}
