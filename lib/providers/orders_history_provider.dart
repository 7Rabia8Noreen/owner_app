import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:owner_app/models/orders_history_model.dart';
import 'package:owner_app/models/worker_details_model.dart';

import '../networks/network_client.dart';

class OrdersHistoryProvider with ChangeNotifier{
  
  NetworkClient networkClient = NetworkClient();

  List<OrdersHistory> _ordersHistory=[];

   get ordersHistory {
    return _ordersHistory;
  }

  Future<void> getOrdersHistory() async{

     final res = await networkClient.get(
      '/order_notification', {}
     );
      Logger().i(res.toString());
      Map<String, dynamic> mp = jsonDecode(res.toString());
      Logger().i(mp['code']);
       Logger().i(mp['data']['orderData']);
        
    _ordersHistory = (mp['data']['orderData'] as List).map((e) {
      

      OrdersHistory orders= OrdersHistory.fromJson(e);

      return OrdersHistory(
        status: orders.status,
         time_start: orders.time_start,
        //  time_end: orders.time_end,
           customers: orders.customers, 
           salons: orders.salons
           );
    }).toList();

    Logger().i(_ordersHistory.toString());

    

    notifyListeners();

  }
}