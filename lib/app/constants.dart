import 'package:flutter/material.dart';

LinearGradient linearGrad = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.red[300], Colors.red[800]]
);

LinearGradient linearGrad2 = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.blue[200], Colors.blue[800]]
);

// Colors that we use in our app
const kPrimaryColor = Colors.red; // Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;
