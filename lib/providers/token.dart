import 'package:flutter/widgets.dart';

class Token extends ChangeNotifier{
  String? token;

  String? get tokeis => token;

   tokis(String? value){
    token = value;
    notifyListeners();
  }

}