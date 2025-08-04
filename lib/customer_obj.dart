class CustomerObj{
  String name;
  String pageNumber;
  CustomerObj({required this.name, required this.pageNumber});

  static List<CustomerObj> customersList = [];

  Map<String ,dynamic> toJson(){
    final map = <String,dynamic> {};
    map['name'] = name;
    map['pageNumber'] = pageNumber;
    return map;
  }
  factory CustomerObj.fromJson(Map<String, dynamic> json) {
    return CustomerObj(
      name: json['name'] ?? 'Unknown',
      pageNumber: json['pageNumber']
    );
  }

}