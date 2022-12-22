import 'dart:developer';

import 'package:api_flutter/constants/api_constants.dart';
import 'package:api_flutter/models/address_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  Future<AddressModel?> getAddress({required String cep}) async {
    try {
      var response = await Dio().get(ApiConstants.urlBase(cep));

      if (response.statusCode == 200) {
        return AddressModel.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }

    return null;
  }
}
