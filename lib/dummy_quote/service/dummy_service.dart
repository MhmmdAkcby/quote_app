import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quote_app/dummy_quote/model/dummy_model.dart';

abstract class IDummyService {
  IDummyService(this.dio);
  final Dio dio;

  Future<DummyModel?> fetchDummyItem();
}

enum _QuotesPath { quotes }

class DummyService extends IDummyService {
  DummyService(super.dio);

  @override
  Future<DummyModel?> fetchDummyItem() async {
    try {
      final response = await dio.get('/${_QuotesPath.quotes.name}');
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return DummyModel.fromJson(jsonBody);
        }
      }
    } on DioException catch (exception) {
      _DioException()._showExcepiton(exception, this);
    }
    return null;
  }
}

class _DioException {
  void _showExcepiton<T>(DioException exception, T type) {
    if (kDebugMode) {
      print(exception.message);
      print(type);
      print('------------------------------------');
    }
  }
}
