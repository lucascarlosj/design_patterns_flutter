import 'package:composite_pattern/feed/ifeed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Feed implements Ifeed {
  final String text;
  final DateTime date;

  Feed({required this.text}) : date = DateTime.now();

  @override
  Widget render() {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: renderContent(),
    );
  }

  @override
  Widget renderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
        renderBottom()
      ],
    );
  }

  @override
  Widget renderBottom() {
    return Column(
      children: [
        const SizedBox(height: 5),
        Text('Enviado em ${DateFormat('dd/MM/yyyy').format(date)}')
      ],
    );
  }
}
