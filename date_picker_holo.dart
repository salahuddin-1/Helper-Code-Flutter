import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandimarket/src/resources/navigation.dart';
import 'package:sizer/sizer.dart';

pickADate(context) async {
  var datePicked = await DatePicker.showSimpleDatePicker(
    context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2100),
    dateFormat: "dd-MMMM-yyyy",
    looping: false,
    itemTextStyle: GoogleFonts.raleway(
      fontWeight: FontWeight.w400,
    ),
  );
}
