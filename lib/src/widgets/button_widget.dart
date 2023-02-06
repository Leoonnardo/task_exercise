import 'package:flutter/material.dart';

Padding buttonWidget(text, color, funcion) {
    return Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: (() => funcion()),
                child: Container(
                  color: color,
                  width: 150,
                  height: 50,
                  child: Center(
                      child: Text(text,
                          textAlign: TextAlign.center, style: const TextStyle(color: Colors.white))),
                ),
              ),
            );
  }