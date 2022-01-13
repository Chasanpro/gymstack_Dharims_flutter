import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class delete extends StatefulWidget {
  const delete({Key? key}) : super(key: key);
  @override
  _deleteState createState() => _deleteState();
}

DateTime now =
    DateTime.parse(DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()));

class _deleteState extends State<delete> {
  final ref = FirebaseFirestore.instance.collection("user-data");
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    var sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
    var sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
    var sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
    var mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
    var fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
    var yc = y / 4.55;
    var xc = x * .395;
    return Material(
      color: Color(0xFF2D2F41),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Scaffold(
          backgroundColor: Color(0xFF2D2F41),
          body: Container(
            child: StreamBuilder(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          DateTime dt2 =
                              DateTime.parse(snapshot.data?.docs[index]['dop']);
                          var diff = now.difference(now);
                          int rd = diff.inDays;

                          int value = 28 *
                              int.parse(snapshot.data?.docs[index]['months']);
                          int d = value - rd;
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.network(
                                      snapshot.data?.docs[index]['image_url'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                  ),
                                  width: xc,
                                  height: yc,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Word(snapshot.data?.docs[index]
                                        ['full_name']),
                                    Word(snapshot.data?.docs[index]
                                        ['phone_num']),
                                    Word('DAYS LEFT:: $d'),
                                  ],
                                )
                              ],
                            ),
                            width: x * .8,
                            height: y / 4.55,
                            margin: const EdgeInsets.only(bottom: 32),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: sunset,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24)),
                            ),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
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
