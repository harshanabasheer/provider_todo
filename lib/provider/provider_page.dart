import 'package:flutter/cupertino.dart';

class Provider_class extends ChangeNotifier{
  String _itemText = '';
  String _itemIcon ='';
  String _innerItem='';
  List _items = [];
  List _itemsIcon=[];
  List _innerItems=[];
  String get itemText => _itemText;
  String get itemIcon => _itemIcon;
  String get itemList =>_innerItem;
  List get items => _items;
  List get itemsIcon=>_itemsIcon;
  List get itemsList=>_innerItems;


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
    _items.add(_itemText);
    _itemText = '';
    _itemsIcon.add(_itemIcon);
    _itemIcon='';
    _innerItems.add(_innerItem);
    _innerItem='';
    notifyListeners();
  }
  bool icn_change(String icnName){
    final favIcn=_innerItems.contains(icnName);
    return favIcn;
  }
}