class OrdersHistory{
  final String status;
  final String time_start;
  //final String time_end;
  
  final Map<String, dynamic> customers;
  final Map<String, dynamic> salons;

  OrdersHistory({required this.status,required this.time_start,required this.customers,required this.salons});

  factory OrdersHistory.fromJson(Map<String, dynamic> json){
      return OrdersHistory(
        status: json['status'],
         time_start: json['time_start'],
        //  time_end: json['time_end'],
           customers: json['customers'],
            salons: json['salons'],
            );
  }
}