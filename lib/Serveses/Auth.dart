
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_notes/Secreens/DioRequest.dart';
import 'package:my_notes/User.dart';

class Auth extends ChangeNotifier{
   User ?_user;

  bool _isLogin=false;
  bool get authantucated=>_isLogin;
  String  ?_token;

  void login(Map Card) async{
    try{
      Response response= await DioRequest.Request().post('/login',data: Card);
      print(response.data.toString());
      // this._token=response.data.toString();
      _isLogin=true;
      notifyListeners();
    }
    catch (e){
      print(e);
    }

  }
  void logout(){
    _isLogin=false;
    notifyListeners();
  }

  void SignUp( Map creds) async {
    var req= await DioRequest.Request().post('/register',data: creds);
     print(req);
    _isLogin=true;
    notifyListeners();
  }

}