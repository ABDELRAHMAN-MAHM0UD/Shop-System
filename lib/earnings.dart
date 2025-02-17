import 'package:flutter/material.dart';
import 'package:shop_management_system/sale.dart';
import 'package:shop_management_system/view_model.dart';

class Earnings extends StatefulWidget {
  const Earnings({super.key});
  static const String routeName = "Earnings";

  @override
  _EarningsState createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  late ViewModel viewModel;
  bool isLoading = true; // Track loading state
  int monthlyEarnings = 0; // Store monthly earnings
  int yearlyEarnings = 0; // Store yearly earnings

  List<Sale> get filteredSales {
    return viewModel.salesList.where((sale) {
      return sale.date.year == selectedYear;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    viewModel = ViewModel();
    _loadData(); // Load data when the screen is first created
  }

  // Load data asynchronously
  Future<void> _loadData() async {
    await viewModel.loadItems(); // Wait for data to load
    setState(() {
      isLoading = false; // Update loading state
      _recalculateEarnings(); // Recalculate earnings when data is loaded
    });
  }

  // Recalculate earnings when month or year changes
  void _recalculateEarnings() {
    setState(() {
      monthlyEarnings = calculateEarnings();
      yearlyEarnings = calculateYearlyEarnings();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Show loading indicator while data is being loaded
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff0f0c29),
              Color(0xff302b63),
              Color(0xff24243e),],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height * 0.06),
              Text(
                "الأرباح",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: height * .08),
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _showMonthYearPicker(context);
                        },
                        child: Text(
                          'اختر الشهر و العام',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800,
                              color:Color(0xff0f0c29) ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * .12),
                    Text(
                      textAlign: TextAlign.right,
                      " : أرباح شهر $selectedMonth/$selectedYear",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: 18, top: 20),
                        child: Text(
                          textAlign: TextAlign.center,
                          monthlyEarnings.toString(),
                          style: TextStyle(
                            color: Color(0xff00a00e),
                            fontSize: 32,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * .12),
                    Text(
                      textAlign: TextAlign.right,
                      " : أرباح العام $selectedYear",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(right: 18, top: 20,bottom: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          textAlign: TextAlign.center,
                          yearlyEarnings.toString(),
                          style: TextStyle(
                            color: Color(0xff00a00e),
                            fontSize: 32,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Table(
                      border: TableBorder.all(
                        color: Colors.white, // White grid lines
                        width: 0.9,
                      ),
                      children: [
                        // Header Row
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.transparent, // Transparent background for header
                          ),
                          children: [
                            Text(
                              "إجمالي الربح",
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "سعر البيع",
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "التاريخ",
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "اسم الجهاز",
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "م", // Numbering Column
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        // Data Rows
                        for (var i = 0; i < filteredSales.length; i++)
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.transparent, // Transparent background for data rows
                            ),
                            children: [
                              Text(
                                filteredSales[i].totalEarnForDevice.toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                filteredSales[i].sellingPrice.toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${filteredSales[i].date.day}/${filteredSales[i].date.month}",
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                filteredSales[i].name,
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                (i + 1).toString(), // Row numbering
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(height: height * 0.03),


                  ],
                ),
              ),




            ],
          ),
        ),
      ),

    );

  }


  int calculateEarnings() {
    double monthRevenue = 0;
    for (int i = 0; i < viewModel.salesList.length; i++) {
      if (viewModel.salesList[i].date.month == selectedMonth &&
          viewModel.salesList[i].date.year == selectedYear) {
        monthRevenue += viewModel.salesList[i].totalEarnForDevice;
      }
    }
    return monthRevenue.toInt();
  }

  int calculateYearlyEarnings() {
    double yearlyRevenue = 0;
    for (int i = 0; i < viewModel.salesList.length; i++) {
      if (viewModel.salesList[i].date.year == selectedYear) {
        yearlyRevenue += viewModel.salesList[i].totalEarnForDevice;
      }
    }
    return yearlyRevenue.toInt();
  }

  Future<void> _showMonthYearPicker(BuildContext context) async {
    final DateTime now = DateTime.now();
    int tempSelectedYear = selectedYear;
    int tempSelectedMonth = selectedMonth;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("اختر الشهر والعام"),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Year Picker
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<int>(
                          value: tempSelectedYear,
                          items: List.generate(101, (index) => 2000 + index)
                              .map((year) {
                            return DropdownMenuItem<int>(
                              value: year,
                              child: Text(year.toString(),
                                style: TextStyle(color: Colors.black),),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              tempSelectedYear = value!;
                            });
                          },
                        ),
                        Text(" العام", style: TextStyle(fontSize: 22)),
                      ],
                    ),
                    // Month Picker
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<int>(
                          value: tempSelectedMonth,
                          items: List.generate(12, (index) => index + 1)
                              .map((month) {
                            return DropdownMenuItem<int>(
                              value: month,
                              child: Text(month.toString(),
                                  style: TextStyle(color: Colors.black)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              tempSelectedMonth = value!;
                            });
                          },
                        ),
                        Text(" الشهر", style: TextStyle(fontSize: 22)),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);

                    // Update state when the user selects a new month/year
                    setState(() {
                      selectedYear = tempSelectedYear;
                      selectedMonth = tempSelectedMonth;

                      // Recalculate earnings after month/year change
                      _recalculateEarnings();
                    });
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
