
import 'package:flutter/material.dart';

class DialogAction<T> {

  T child;
  VoidCallback onPressed;

  DialogAction({
    required this.child,
    required this.onPressed,
  });
  
  
}
