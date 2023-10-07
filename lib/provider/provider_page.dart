import 'package:flutter/cupertino.dart';

class Provider_class extends ChangeNotifier {
  String _itemText = '';
  String _itemIcon = '';
  String _innerItem = '';
  List category = [];
  List<bool> itemChecked = [];

  String get itemText => _itemText;
  String get itemIcon => _itemIcon;
  String get itemList => _innerItem;

  void updateItemText(String newText) {
    _itemText = newText;
    notifyListeners();
  }

  void updateItemIcon(String newIcon) {
    _itemIcon = newIcon;
    notifyListeners();
  }

  void updateItemList(String newItemList) {
    _innerItem = newItemList;
    notifyListeners();
  }

  void addItem() {
    category.add({
      "name": itemText,
      "icon": itemIcon,
      "task": [],
    });
    notifyListeners();
  }
  void addList(int index) {
    category[index]["task"].add(itemList);
    itemChecked.add(false);
    notifyListeners();
  }
  void toggleItemChecked(int index) {
    itemChecked[index] = !itemChecked[index];
    notifyListeners();
  }
  int countCheckedItems() {
    return itemChecked.where((isChecked) => isChecked).length;
  }
  int countUncheckedItems() {
    return itemChecked.where((isChecked) => !isChecked).length;
  }
  int countCheckedItemsForGridItem(int index) {
    if (index >= 0 && index < category.length) {
      return category[index]["task"].where((item) => item["isChecked"]).length;
    } else {
      return 0;
    }
  }
  int countUncheckedItemsForGridItem(int index) {
    if (index >= 0 && index < category.length) {
      return category[index]["task"].where((item) => !item["isChecked"]).length;
    } else {
      return 0;
    }
  }


}
