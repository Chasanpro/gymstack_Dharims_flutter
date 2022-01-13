import 'package:animated_button/animated_button.dart';
import 'package:dharims/panel.dart';
import 'package:flutter/material.dart';
import 'package:proste_route_animation/proste_route_animation.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  loginState createState() => loginState();
}

class loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    final double x = MediaQuery.of(context).size.width;
    final double y = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      bottom: true,
      minimum: const EdgeInsets.all(0.0),
      child: Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 156, 243, .75),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    height: y / 2,
                    width: x * .95,
                    child: Image.asset("assets/logo.jpg"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/india.jpg"),
                    ),
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: y * .4,
                child: Column(
                  children: [
                    Text(
                      'Dharims ',
                      style: GoogleFonts.montserrat(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .5),
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Fitnesszone ',
                      style: GoogleFonts.montserrat(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .5),
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'The Muscle Town ',
                      style: GoogleFonts.montserrat(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .5),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: .025 * y,
                    ),
                    Text(
                      'Developed by Chaianya Damarasingu',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.blueGrey[400], letterSpacing: .5),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: .125 * y,
                    ),
                    AnimatedButton(
                      shape: BoxShape.rectangle,
                      color: Colors.greenAccent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const panel()));
                      },
                      child: Text(
                        'DIVE IN ',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.black, letterSpacing: .5),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
