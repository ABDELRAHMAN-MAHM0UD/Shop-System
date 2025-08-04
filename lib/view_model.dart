import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_management_system/sale.dart';

import 'customer_obj.dart';

class ViewModel {
  List<Sale> salesList = [];

  ViewModel() {
    loadItems(); // Load items when ViewModel is created
  }

  Future<void>  addCustomer(CustomerObj customer)async{
    CustomerObj.customersList.add(customer);
    print("customer Added");
    final cus_prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList =
    CustomerObj.customersList.map((custom) => custom.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await cus_prefs.setString("cus_prefs", jsonString);
  }

  Future<void> loadCustomer() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString("cus_prefs");

    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        final List<dynamic> jsonList = jsonDecode(jsonString);

        CustomerObj.customersList = jsonList
            .map((item) => CustomerObj.fromJson(item as Map<String, dynamic>))
            .toList();
      } catch (e) {
        print("Error decoding JSON: $e");
        CustomerObj.customersList = [];
      }
    } else {
      CustomerObj.customersList = [];
    }
  }

  Future<void> removeCustomer(int index) async {
    final prefs = await SharedPreferences.getInstance();
    // Ensure the index is valid
    if (index < 0 || index >= CustomerObj.customersList.length) return;
    // Remove the item from the list
    CustomerObj.customersList.removeAt(index);
    // Save the updated list
    final List<Map<String, dynamic>> jsonList =
    CustomerObj.customersList.map((cutom) => cutom.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await prefs.setString("cus_prefs", jsonString);
  }

  Future<void> addItem(Sale soledItem) async {
    salesList.add(soledItem);
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList =
    salesList.map((soled) => soled.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await prefs.setString("soledItems", jsonString);  }

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
