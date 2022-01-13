import 'dart:io';

import 'package:animated_button/animated_button.dart';
import 'package:dharims/Firebase/Dash.dart';
import 'package:dharims/Firebase/Delete.dart';
import 'package:dharims/Firebase/create.dart';
import 'package:dharims/Firebase/find.dart';
import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'styles.dart';
import 'package:google_fonts/google_fonts.dart';

class panel extends StatefulWidget {
  const panel({Key? key}) : super(key: key);

  @override
  _panelState createState() => _panelState();
}

class _panelState extends State<panel> {
  get bgclr => null;

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Material(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(63, 51, 81, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: y / 30,
              ),
              ClayContainer(
                borderRadius: 20,
                color: const Color.fromRGBO(63, 51, 81, 1),
                height: y / 3,
                width: x * .85,
                curveType: CurveType.none,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedButton(
                        duration: 200,
                        height: y / 3,
                        color: Color.fromRGBO(233, 166, 166, 1),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const create()));
                        },
                        child: Word("ADD_NEW"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedButton(
                        duration: 200,
                        height: y / 3,
                        color: Color.fromRGBO(233, 166, 166, 1),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const dash()));
                        },
                        child: Word("CASH-FLOW"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedButton(
                        duration: 200,
                        height: y / 3,
                        color: Color.fromRGBO(233, 166, 166, 1),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const delete()));
                        },
                        child: Word("DASH-BOARD"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedButton(
                        duration: 200,
                        height: y / 3,
                        color: Color.fromRGBO(233, 166, 166, 1),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const find()));
                        },
                        child: Word("Monthly-List"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: y / 20,
              ),
              AnimatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  color: Colors.pinkAccent,
                  child: Word("Exit")),
              SizedBox(
                height: y / 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Word(String label) {
  return Text(
    '$label',
    style: GoogleFonts.montserrat(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: .5),
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  );
}
