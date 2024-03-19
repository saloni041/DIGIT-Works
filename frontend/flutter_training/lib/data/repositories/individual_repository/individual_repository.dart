// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_training/models/individual/individual_model.dart';

import '../../../utils/global_variables.dart';

class IndividualRepository {
  final Dio _client;

  IndividualRepository(this._client);

  Future<IndividualModel> createIndividual({
    Map<String, String>? queryParameters,
    dynamic body,
    required String url,
  }) async {
    try {
      final response = await _client.post(url,
          queryParameters: queryParameters,
          data: body ?? {},
          options: Options(extra: {
            "accessToken": GlobalVariables.authToken,
            "userInfo": GlobalVariables.userRequestModel
            // "accessToken": "54433ff3-52a6-4ebc-8917-045619d08034"
          }));
      // print(response);

      return IndividualModelMapper.fromMap(
          response.data as Map<String, dynamic>);
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      print(ex); //I see a bad request error
      rethrow;
    }
  }

  Future<IndividualListModel> searchIndividuals({
    Map<String, dynamic>? queryParameters,
    dynamic body,
    required String url,
  }) async {
    try {
      final response = await _client.post(url,
          queryParameters: {
            ...?queryParameters,
            'offset': 0,
            'limit': 100,
          },
          data: body ?? {},
          options: Options(extra: {
            "accessToken": GlobalVariables.authToken,
          }));

      return IndividualListModelMapper.fromMap(
          response.data as Map<String, dynamic>);
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      rethrow;
    }
  }
}
