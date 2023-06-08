import 'package:flutter/material.dart';
import 'package:shoponline/screens/login_screen.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignupState extends State<Signup> {
  void validator() {
    final FormState? _form = _formkey.currentState;
    if (_form != null && _form.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 250.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 350,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "Please Fill UserName";
                          } else if (value!.length < 6) {
                            return "UserName Is Too Short";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            // Kiểm tra null và chuỗi rỗng
                            return "Please Fill Email";
                          } else if (!regExp.hasMatch(value)) {
                            return "Email Is Invaild";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "Please Fill Phone Number";
                          } else if (value!.length < 10) {
                            return " Phone Number Must Be 10";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Phone",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        obscureText: obserText,
                        validator: (value) {
                          if (value == "") {
                            return "Please Fill Password";
                          } else if (value!.length < 8) {
                            return "Password Is Too Short";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                              obserText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () {
                              validator();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const ));
                            },
                            child: const Text('Signup')),
                      ),
                      Row(
                        children: <Widget>[
                          Text('I Have Already An Account!'),
                          SizedBox(
                            width: 18,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
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
