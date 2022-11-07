import 'package:flutter/material.dart';


class FormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKeyProvider = new GlobalKey<FormState>();

  String email    = '';
  String password = '';
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  
  bool isValidForm() {
    print(formKeyProvider.currentState?.validate());
    print('$email - $password');
    return formKeyProvider.currentState?.validate() ?? false;
  }

}