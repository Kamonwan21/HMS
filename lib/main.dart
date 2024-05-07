import 'package:flutter/material.dart';
import 'package:flutter_application_1/HMS.dart';
import 'package:http/http.dart' as http;
import 'models/User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  late List<User> loginResult;

  Future<void> loginState(username, password) async {
    var parameter = {"username": username, "password": password};
    var uri = Uri.http("10.11.11.112:3000", "users", parameter);
    var resp = await http.get(uri);
    loginResult = userFromJson(resp.body);
    if (loginResult.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username or password invalid')),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HMSScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Center(child: Image.asset('images/login.png', height: 80)),
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                usernameInputField(),
                SizedBox(
                  height: 20.0,
                ),
                passwordInputField(),
                SizedBox(
                  height: 40.0,
                ),
                submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget usernameInputField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Input your HN",
        icon: Icon(Icons.people),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required!";
        }
        return null;
      },
      onSaved: (newValue) => username = newValue!,
    );
  }

  Widget passwordInputField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Input your last four IDs",
        icon: Icon(Icons.lock),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required!";
        }
        return null;
      },
      onSaved: (newValue) => password = newValue!,
    );
  }

  Widget submitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();
            await loginState(username, password);
            print("$username $password");
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        child: Text(
          "LOGIN",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
