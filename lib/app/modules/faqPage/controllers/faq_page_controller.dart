import 'package:get/get.dart';

class FaqPageController extends GetxController {
  final List<Item> data = generateItems(8);

  void onExpansionCallback(int index, bool isExpanded) {
    data[index].isExpanded = isExpanded;
    update(); // Ensure to call update to rebuild the widget
  }

  // onTap method for ExpansionPanel body
  void onPanelTap(Item item) {
    data.removeWhere((Item currentItem) => item == currentItem);
    update(); // Ensure to call update to rebuild the widget
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
