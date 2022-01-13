import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'fire_up_load.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:clay_containers/clay_containers.dart';

class dash extends StatefulWidget {
  const dash({Key? key}) : super(key: key);

  @override
  _dashState createState() => _dashState();
}

class _dashState extends State<dash> {
  final ref = FirebaseFirestore.instance.collection("user-data");
  int z = 0;
  @override
  int? nw;
  Future<void> refine() async {
    String? networth = await FirebaseApi.networth();
    setState(() {
      networth = networth;
    });
  }

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;

    var c = 1;

    var pending;

    return Material(
      color: Color(0xFF2D2F41),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClayContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedButton(
                  width: x / 4,
                  shape: BoxShape.rectangle,
                  color: Colors.greenAccent,
                  onPressed: () {
                    String man = FirebaseApi.networth() as String;
                    setState(() {
                      var ohio = man;
                    });
                    showTopSnackBar(
                      context,
                      const CustomSnackBar.success(
                        message: "bob",
                      ),
                    );
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
                Text(FirebaseApi.networth().toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (pending != null) Text("nothing"),
                        AnimatedButton(
                          width: x / 4,
                          shape: BoxShape.rectangle,
                          color: Colors.greenAccent,
                          onPressed: () {
                            setState(() {});
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
                      ],
                    ),
                    Column(
                      children: [
                        Text("nothing"),
                        AnimatedButton(
                          width: x / 4,
                          shape: BoxShape.rectangle,
                          color: Colors.greenAccent,
                          onPressed: () {},
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
                      ],
                    )
                  ],
                ),
              ],
            ),
            borderRadius: 35,
            height: .65 * y,
            width: .85 * x,
            color: Color(0xFF2D2F41),
          ),
        ],
      ),
    );
  }

  Word(String label, double sz) {
    return Text(
      label,
      style: GoogleFonts.montserrat(
        textStyle:
            const TextStyle(color: Colors.purpleAccent, letterSpacing: .5),
        fontSize: sz,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
