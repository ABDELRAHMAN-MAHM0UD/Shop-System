class Sale{
  String name;
  int wholePrice;
  int sellingPrice;
  int installment = 35;
  DateTime date = DateTime.now();


  Sale({required this.name, required this.wholePrice,
    required this.sellingPrice, required this.date, required this.installment});


  int get cashEarn => sellingPrice - wholePrice;
  int get totalEarnForDevice => ((sellingPrice*installment/100)+cashEarn).toInt();
  Map<String ,dynamic> toJson(){
    final map = <String,dynamic> {};
    map['name'] = name;
    map['wholePrice'] = wholePrice;
    map['sellingPrice'] = sellingPrice;
    map['installment'] = installment;
    map['date'] = date.toIso8601String();
    return map;
  }
  factory Sale.fromJson(Map<String, dynamic> json) {
    return Sale(
      name: json['name'] ?? 'Unknown',
      wholePrice: (json['wholePrice'] ?? 0),
      sellingPrice: (json['sellingPrice'] ?? 0),
      installment: (json['installment'?? 35]),
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
    );
  }



}