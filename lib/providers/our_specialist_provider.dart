import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:owner_app/models/worker_details_model.dart';

import '../networks/network_client.dart';

class OurSpecialistProvider with ChangeNotifier{
  
  NetworkClient networkClient = NetworkClient();

  List<WorkersDetails> _workerDetails=[];

   get workerDetails {
    return _workerDetails;
  }

  Future<void> getWorkersDetails() async{

     final res = await networkClient.get(
      '/salon_workers', {}
     );
      Logger().i(res.toString());
      Map<String, dynamic> mp = jsonDecode(res.toString());
      Logger().i(mp['code']);
       Logger().i(mp['data']['salonWorkers']);

    _workerDetails = (mp['data']['salonWorkers'] as List).map((e) {
      

      WorkersDetails workers= WorkersDetails.fromJson(e);

      return WorkersDetails(
        name: workers.name, 
        image: workers.image,
         speciality: workers.speciality,
          avalaibily_time: workers.avalaibily_time, 
          salary: workers.salary, 
          salons: workers.salons
          );
    }).toList();

    Logger().i(_workerDetails.toString());

    

    notifyListeners();

  }
}