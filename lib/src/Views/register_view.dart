
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_health/src/Views/login_view.dart';
import 'package:mind_health/src/Utils/firebase.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseService _dbService = DatabaseService();
  bool _isLoading = false;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      // Implement login logic
      final String username = _usernameController.text;
      final String password = _passwordController.text;
      print('Username: $username');
      print('Password: $password');
      try {
        final user = await _dbService.registerWithEmail(username, password);
        if (user != null) {
          // Si el registro es exitoso, redirigir al usuario a la página de inicio de sesión
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
          print('Registration successful');
        } else {
          _showErrorDialog('Failed to register. Please check your details and try again.');
        }
      } catch (e) {
        _showErrorDialog('An error occurred. Please try again later.');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
      // TODO: agregar la lógica para registrar un usuario con Firebase.
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error', style: GoogleFonts.poppins()),
          content: Text(message, style: GoogleFonts.poppins()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: GoogleFonts.poppins()),
            ),
          ],
        );
      },
    );
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
              'assets/images/register.png',
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
                    "Register.",
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
                          labelText: "Username",
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
                        onPressed: _register,
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
                        children: [
                          Text("Do you already have an account?", style: GoogleFonts.poppins( fontSize: 16 )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => LoginPage())
                                );
                              },
                              style: TextButton.styleFrom(
                                minimumSize: const Size.fromHeight(40),
                              ),
                              child: Text("Login", style: GoogleFonts.poppins( fontSize: 16, color: Colors.blue ))
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
