import 'package:flutter/cupertino.dart';

Container colorLinear(widget) {
  return Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color.fromARGB(255, 56, 128, 167), Color(0xFF21A8A8)])),
    child: widget,
  );
}
