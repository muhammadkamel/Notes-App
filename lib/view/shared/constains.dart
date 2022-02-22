import 'package:flutter/material.dart';

const outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2,
    color: Color(0xFFE9E9E9),
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(7),
  ),
);
const inputDecoration = InputDecoration(
  border: outlineInputBorder,
  errorBorder: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  disabledBorder: outlineInputBorder,
  focusedErrorBorder: outlineInputBorder,
);

const String baseUrl = "http://192.236.155.173:55886";
