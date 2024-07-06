
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_health/src/Views/register_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Implement login logic
      final String username = _usernameController.text;
      final String password = _passwordController.text;
      print('Username: $username');
      print('Password: $password');
      // TODO: agregar la lógica de autenticación con Firebase.
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(232, 236, 244, 1),
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login.png',
              width: 430,
              height: 473,
              fit: BoxFit.cover
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Transform.translate(
                  offset: Offset(0, -30),
                  child: Text(
                    "Login.",
                    style: GoogleFonts.indieFlower(
                      fontSize: 62,
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -30),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter an email";
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a password";
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          backgroundColor: const Color.fromRGBO(12, 11, 61, 1),
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Login", style: GoogleFonts.poppins( fontSize: 24 )),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                      child: Wrap(
                        spacing: 0.8,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: [
                          Text("You do not have an account?", style: GoogleFonts.poppins( fontSize: 16 )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => RegisterPage())
                                );
                              },
                              style: TextButton.styleFrom(
                                minimumSize: const Size.fromHeight(40),
                              ),
                              child: Text("Sign up", style: GoogleFonts.poppins( fontSize: 16, color: Colors.blue ))
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      )
    );
  }

}
