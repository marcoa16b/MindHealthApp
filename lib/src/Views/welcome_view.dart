
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_health/src/Views/login_view.dart';


/// Pagina principal, esta pagina necesita tener una logica para verificar si el
/// usuario esta autenticado, si lo esta, necesita redirigir a la ventana de Home
///
/// Tambien podria hacerse en `main.dart`... tipo una verificacion de si esta
/// autenticado muestra Home y si no muestra Wellcome.
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/images/wellcome.png',
              width: 430,
              height: 406,
              fit: BoxFit.cover
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text("Start your therapy today.", style: GoogleFonts.indieFlower(
              fontSize: 40,
            )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text("Mental health is important and we help you take care of it.", style: GoogleFonts.poppins(
              fontSize: 16,
            )),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage())
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(48),
                  backgroundColor: Color.fromRGBO(12, 11, 61, 1),
                  foregroundColor: Colors.white,
                ),
                child: Text("Login", style: GoogleFonts.poppins( fontSize: 24 )),
              )
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: OutlinedButton(
                onPressed: () {
                  print("Register button pressed");
                },
                child: Text("Register", style: GoogleFonts.poppins( fontSize: 24 )),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(48),
                  foregroundColor: Color.fromRGBO(12, 11, 61, 1),

                ),
              )
          ),
        ],
      ),
    );
  }

}