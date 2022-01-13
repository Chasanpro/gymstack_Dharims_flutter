import 'dart:io';

import 'package:clay_containers/widgets/clay_container.dart';
import 'package:dharims/Firebase/Dash.dart';
import 'package:dharims/panel.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
import 'package:animated_button/animated_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'fire_up_load.dart';
import 'package:flutter_native_image/flutter_native_image.dart';

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

class create extends StatefulWidget {
  const create({Key? key}) : super(key: key);

  @override
  _createState createState() => _createState();
}

class _createState extends State<create> {
  String? name, ph, comment, pic, m, a;

  String? dop, doj;
  File? imageFile;
  File? target_file;
  File? file;
  String file_path = "No file selected";
  bool buttonenabled = false;
  late String payment;
  Object? dropdownValue;
  ImagePicker picker = ImagePicker();

  get isSelected => null;
  @override
  void initState() {
    super.initState();
    ImagePicker picker = ImagePicker();
  }

  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [true, false];
    String _uploadedFileURL;

    double x = MediaQuery.of(context).size.width;

    double y = MediaQuery.of(context).size.height;
    final iskeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Material(
      color: const Color(0xFF2D2F41),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: y / 2),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: y / 20,
              ),
              InkWell(
                onTap: () async {
                  String now =
                      DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
                  print(now);
                  dop = now;
                  doj = now;
                  PickImage();
                },
                child: Column(
                  children: [
                    if (!iskeyboard)
                      Column(
                        children: [
                          if (file != null)
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.hardEdge,
                                child: Image.file(
                                  File(file!.path),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              height: y / 4,
                              width: x * .45,
                            ),
                          if (file == null)
                            ClayContainer(
                              borderRadius: 20,
                              color: Color(0xFF2D2F41),
                              height: y / 4,
                              width: x * .45,
                            ),
                        ],
                      )
                  ],
                ),
              ),
              SizedBox(
                height: y / 25,
              ),
              Text(
                file_path,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.lightBlueAccent, letterSpacing: .5),
                  fontSize: 5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: y / 25,
              ),
              AnimatedButton(
                width: x / 4,
                shape: BoxShape.rectangle,
                color: Colors.orangeAccent,
                onPressed: () {
                  Future<String> nothing = upload_image();
                },
                child: Text(
                  'Confirm ',
                  style: GoogleFonts.montserrat(
                    textStyle:
                        const TextStyle(color: Colors.black, letterSpacing: .5),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: y / 25,
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        textAlign: TextAlign.center,
                        maxLength: 20,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Name'),
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            ph = value;
                          });
                        },
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Phone Number'),
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            m = value;
                          });
                        },
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Number of Months'),
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            a = value;
                            setState(() {
                              buttonenabled = true;
                            });
                          });
                        },
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            iconColor: Colors.deepOrangeAccent,
                            border: InputBorder.none,
                            hintText: 'Amount'),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                height: y / 2.5,
                width: x * .85,
              ),
              SizedBox(
                height: y / 25,
              ),
              SizedBox(
                height: y / 25,
              ),
              AnimatedButton(
                width: x / 4,
                enabled: buttonenabled,
                shape: BoxShape.rectangle,
                color: Colors.pinkAccent,
                onPressed: () async {
                  print(name);
                  print(dop);
                  print(m);
                  print(doj);
                  print(a);
                  print(ph);
                  print(doj);
                  print(
                      FirebaseApi.write(name!, ph!, pic!, dop!, doj!, m!, a!));
                  showTopSnackBar(
                    context,
                    const CustomSnackBar.success(
                      message: "New User Sucessfully Added",
                    ),
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const panel()));

                  if (imageFile != null) return;
                },
                child: Text(
                  'DIVE IN ',
                  style: GoogleFonts.montserrat(
                    textStyle:
                        const TextStyle(color: Colors.black, letterSpacing: .5),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: y / 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  PickImage() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false, allowCompression: true, type: FileType.image);
    if (result == null) return;
    final path = result.files.single.path!;

    file = await FlutterNativeImage.compressImage(path,
        quality: 50, targetWidth: 240, targetHeight: 320);

    updatestate();
  }

  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  Future<String> upload_image() async {
    if (file == null) return "Nothing";
    String filename = basename(file!.path);
    final destination = 'Avatars/$filename';
    String url = await FirebaseApi.upget(destination, file!);

    print(url);
    setState(() {
      pic = url;
    });
    return "non nullable return ";
  }

  void updatestate() {
    setState(() {
      file!;
    });
  }
}
