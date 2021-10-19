import 'dart:io';
import 'package:factory_method/factories/android_dialog.dart';
import 'package:factory_method/factories/dialog_action.dart';
import 'package:factory_method/factories/i_dialog.dart';
import 'package:factory_method/factories/ios_dialog.dart';
import 'package:flutter/material.dart';

class DialogFactory {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> showAlertDialog<T>(
      {Widget? title, Widget? content, List<DialogAction>? actions}) {
    IDialog dialogData;

    if (Platform.isIOS) {
      dialogData = IosDialog();
    } else {
      dialogData = AndroidDialog();
    }

    return showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (context) => dialogData.create(
        context,
        title ?? const Text('Não Informado'),
        content ?? const Text('Não Informado'),
        actions ?? [],
      ),
    );
  }
}
