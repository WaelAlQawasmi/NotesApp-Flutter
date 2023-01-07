
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_notes/Secreens/DioRequest.dart';

import '../User.dart';


class Auth extends ChangeNotifier{
  UserInfo ?  _user;

  bool _isLogin=false;
  UserInfo? get User=>_user;
  bool get authantucated=>_isLogin;
  String  ?_token;

  void login(Map Card) async{
    try{
      Response response= await DioRequest.Request().post('/login',data: Card);
       print("object");
      this.valadateToken(response.data);
      print(response.data);
      notifyListeners();
    }
    catch (e){
      print(e);
    }

  }

   void valadateToken(var token) async{
    if(token==null){
      print(" null 000");
      return;
    }

      try{
      print('Bearer $token');
        Response response= await DioRequest.Request().get('/user',options: Options(headers: {'Authorization':'Bearer $token'}));

         this._user=UserInfo.fromJson(response.data);

         this._isLogin=true;




        notifyListeners();
      }
      catch(e){

    print(e);
    }
     notifyListeners();
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