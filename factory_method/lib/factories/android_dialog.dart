import 'package:factory_method/factories/dialog_action.dart';
import 'package:factory_method/factories/i_dialog.dart';
import 'package:flutter/material.dart';

class AndroidDialog implements IDialog {
  @override
  Widget create(BuildContext context, Widget title, Widget content,
      List<DialogAction> actions) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions.map((a) {
        return ElevatedButton(onPressed: a.onPressed, child: a.child);
      }).toList(),
    );
  }
}
