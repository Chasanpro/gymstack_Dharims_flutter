import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:dharims/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class find extends StatefulWidget {
  const find({Key? key}) : super(key: key);

  @override
  _findState createState() => _findState();
}

class _findState extends State<find> {
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    var sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
    var sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
    var sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
    var mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
    var fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];

    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: SfDateRangePicker(
              initialSelectedDate: DateTime.now(),
              showTodayButton: true,
              selectionMode: DateRangePickerSelectionMode.single,
              selectionShape: DateRangePickerSelectionShape.rectangle,
     
              showActionButtons: true,
            ),
            height: y / 3,
            width: x / 1.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Word(String label) {
    return Text(
      // ignore: unnecessary_string_interpolations
      '$label',
      style: GoogleFonts.montserrat(
        textStyle: const TextStyle(color: Colors.black, letterSpacing: .5),
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
