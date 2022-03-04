import 'package:dio/dio.dart';
import 'dart:io';
import 'package:dio_projects/core/network/project_network_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './ricky_morties.dart';
import 'model/character_model.dart';

abstract class RickyMortiesViewModel extends State<RickyMorties> {
  final Dio dio = ProjectNetworkManager.instance.dio;
  List<CharacterModel> models=[];
  Future<void> fetchAllData() async {
    final response = await dio.get(ServicePath.CHARACTER.rawValue);
    if(response.statusCode == HttpStatus.ok){
      final data = response.data;
      if(data is Map<String, dynamic>){
        final baseCharacterModel=BaseResponseCharacter.fromJson(data);
        models = baseCharacterModel.results ?? [];
      }else if(data is List){
        models=data.map((e) => CharacterModel.fromJson(e)).toList();
      }
    }
    setState(() {
      
    });
  }
}

enum ServicePath { CHARACTER }

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.CHARACTER:
        return '/character';
    }
  }
}
