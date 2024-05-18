import 'package:flutter/material.dart';
import 'package:quote_app/dummy_quote/model/dummy_model.dart';
import 'package:quote_app/dummy_quote/service/dummy_service.dart';

class DummyProvider extends ChangeNotifier {
  final IDummyService iDummyService;
  List<Quotes> item = [];
  bool isBool = false;

  DummyProvider(this.iDummyService) {
    _fetch();
  }

  void _changeLoading() {
    isBool = !isBool;
    notifyListeners();
  }

  Future<void> _fetch() async {
    _changeLoading();
    item = (await iDummyService.fetchDummyItem())?.quotes ?? [];
    _changeLoading();
  }
}
