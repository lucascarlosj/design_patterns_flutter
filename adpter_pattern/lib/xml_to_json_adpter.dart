import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class XmlToJsonAdpter {

  static Map<String, dynamic> adpter(String xml) {
    var xmlParser = Xml2Json();
    xmlParser.parse(xml);
    return json.decode(xmlParser.toParker());
  }
}
