
import 'package:flutter/cupertino.dart';
import 'package:my_notes/Secreens/DioRequest.dart';

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

  void SignUp( Map creds) async {
   await DioRequest.Request().post('/signup',data: creds);
  }

}