import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier{
  bool _isLogin=false;
  bool get authantucated=>_isLogin;
  void login(Map Card){
    _isLogin=true;
    notifyListeners();
  }
  void logout(){
    _isLogin=false;
    notifyListeners();
  }

}