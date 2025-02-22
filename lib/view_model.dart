import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_management_system/sale.dart';

class ViewModel {
  List<Sale> salesList = [];

  ViewModel() {
    loadItems(); // Load items when ViewModel is created
  }

  Future<void> addItem(Sale soledItem) async {
    salesList.add(soledItem);
    await saveItems(); // Save updated list
    print("Item Added");
    print("sales list >>>>>>");
    for(int i = 0; i< salesList.length;i++){
      print(" ${salesList[i].name } >>>"
          "${salesList[i].wholePrice}>>>"
          "${salesList[i].sellingPrice}>>>"
          " %${salesList[i].installment} "
          " \$\$\$\$\$\$ ${salesList[i].totalEarnForDevice}");

    }
  }

  Future<void> saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList =
    salesList.map((soled) => soled.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await prefs.setString("soledItems", jsonString);
  }

  Future<void> loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString("soledItems");

    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        final List<dynamic> jsonList = jsonDecode(jsonString);

        salesList = jsonList
            .map((item) => Sale.fromJson(item as Map<String, dynamic>))
            .toList();
      } catch (e) {
        print("Error decoding JSON: $e");
        salesList = [];
      }
    } else {
      salesList = [];
    }
  }

  Future<void> removeItem(int index) async {
    final prefs = await SharedPreferences.getInstance();

    // Ensure the index is valid
    if (index < 0 || index >= salesList.length) return;

    // Remove the item from the list
    salesList.removeAt(index);

    // Save the updated list
    final List<Map<String, dynamic>> jsonList =
    salesList.map((soled) => soled.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await prefs.setString("soledItems", jsonString);
  }


}
