import 'dart:convert' as convert show json;

extension ResponseX on String {
  Map<String, dynamic> get json => convert.json.decode(this);
}

extension JsonX on Map<String, dynamic> {
  String get jsonString => convert.json.encode(this);
}
