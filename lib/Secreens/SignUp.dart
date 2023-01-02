import 'package:flutter/material.dart';
import 'package:my_notes/Serveses/Auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _accountTypeController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var accountType = ['user', 'company', 'developer'];
  var selectedAcount;

  @override
  void initState() {}

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.greenAccent, width: 1)),
        title: Center(
            child: Text(
          "Sign up",
          style: TextStyle(color: Colors.black54),
        )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color(0xFFF1F8E9),
                      borderRadius: BorderRadius.circular(25)),
                  margin:
                      EdgeInsets.only(top: 20, bottom: 30, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(
                            "https://www.pngmart.com/files/7/Note-PNG-Clipart.png"),
                        height: 150,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Full name",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                        icon: Icon(Icons.type_specimen_sharp),
                        hint: Text("please select account "),
                        isExpanded: true,
                        items: accountType
                            .map((e) => DropdownMenuItem(
                                  child: Text("$e"),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedAcount = val;
                          });
                        },
                        value: selectedAcount,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      ElevatedButton(
                          onPressed: () {
                            Map user = {
                              'name': _nameController.text,
                              'email': _emailController.text,
                              'password': _passwordController.text,
                              'bio': selectedAcount,
                              'password_confirmation': _passwordController.text,
                            };
                            if (_formKey.currentState!.validate()) {
                              print(user);

                             Provider.of<Auth>(context,listen: false).SignUp(user);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFC8E6C9),
                              minimumSize: Size(380, 50)),
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.black54),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
