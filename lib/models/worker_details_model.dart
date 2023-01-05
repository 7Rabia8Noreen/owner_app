import 'package:flutter/material.dart';
import 'package:owner_app/models/salons_model.dart';

class WorkersDetails{
  final String name;
  final String image;
  final String speciality;
  final String avalaibily_time;
  final String salary;
  final Map<String, dynamic> salons;

  WorkersDetails({required this.name,required this.image,required this.speciality,required this.avalaibily_time,required this.salary,required this.salons});

   factory WorkersDetails.fromJson(Map<String, dynamic> json) {
    return WorkersDetails(
      name: json['name'], 
      image: json['image'],
       speciality: json['speciality'], 
       avalaibily_time: json['avalaibily_time'],
        salary: json['salary'],
         salons: json['salons']
         );
  }
}