import 'package:flutter/material.dart';

class PaymentsController extends ChangeNotifier {
  bool processing = false;

  Future<void> pay(Function onSuccess) async {
    processing = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    processing = false;
    notifyListeners();
    onSuccess();
  }
}
