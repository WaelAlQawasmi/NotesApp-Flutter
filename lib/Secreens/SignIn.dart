import 'package:flutter/material.dart';
import 'package:my_notes/Secreens/Dashboard.dart';
import 'package:provider/provider.dart';

import '../Serveses/Auth.dart';

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
    Widget child;
    if (Provider.of<Auth>(context, listen: false).authantucated) {
      print(Provider.of<Auth>(context, listen: false).authantucated);
      child = Dashboard();
    } else {
      print(Provider.of<Auth>(context, listen: false).authantucated);

      child = Scaffold(
          body: Container(
        padding: EdgeInsets.all(19),
        child: Form(
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

                          Provider.of<Auth>(context, listen: false).login(user);
                          print(user.values);
                        }
                        setState(() {});
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
        ),
      ));
    }
    return child;
  }
}
