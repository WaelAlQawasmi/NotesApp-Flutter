import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Serveses/Auth.dart' ;

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(19),
        child:Consumer<Auth>(builder: (context,auth,child){
          if(auth.authantucated){
            // Navigator.pushNamed(context, '/signup');
print(auth.authantucated);
          }
          return Form(
          key: _formKey,
          child: SingleChildScrollView(
          child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 100),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image(
          image: NetworkImage(
          "https://www.pngmart.com/files/7/Note-PNG-Clipart.png"),
          height: 150,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextFormField(
          validator: (value) {
          if (value == null || value.isEmpty) {
          return 'Please enter Username';
          }
          },
          controller: _username,
          decoration: InputDecoration(
          hintText: "username",
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextFormField(
          controller: _password,
          validator: (value) {
          if (value == null || value.isEmpty) {
          return 'Please enter Password';
          }
          return null;
          },
          decoration: InputDecoration(
          hintText: "Password",
          prefixIcon: Icon(Icons.password),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15))),
          ),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
          onPressed: () {
          Map user = {
          'email': _username.text,
          'password': _password.text,
          };
          if (_formKey.currentState!.validate()) {
          print(user);
          Provider.of<Auth>(context, listen: false).login(user);
          }
          },
          child: Text(
          "submit",
          style: TextStyle(fontSize: 18),
          ),
          style:
          ElevatedButton.styleFrom(minimumSize: Size(130, 40))),
          Padding(padding: EdgeInsets.all(5)),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Don't hava account?"),
          InkWell(
          child: Text(
          "  SignUp",
          style: TextStyle(color: Colors.green),
          ),
          onTap: () {
          Navigator.pushNamed(context, '/signup');
          },
          )
          ],
          )
          ],
          ),
          ),
          ),
          );
        },)
      ),
    );
  }
}
