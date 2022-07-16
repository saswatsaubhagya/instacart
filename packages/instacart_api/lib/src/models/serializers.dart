import 'package:json_annotation/json_annotation.dart';

class BoolSerializer extends JsonConverter<bool, String?> {
  const BoolSerializer();

  @override
  bool fromJson(String? json) {
    if (json == null) {
      return false;
    } else {
      if (json.isNotEmpty) {
        if (json == '0') {
          return false;
        } else if (json == '1') {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
  }

  @override
  String toJson(bool object) => object ? '1' : '0';
}

class IntSerializer extends JsonConverter<int, String?> {
  const IntSerializer();
  @override
  int fromJson(String? json) {
    return int.tryParse(json ?? '500') ?? 500;
  }

  @override
  String? toJson(int object) {
    return object.toString();
  }
}

class BundlePidsSerializer extends JsonConverter<List<String>, String?> {
  const BundlePidsSerializer();
  @override
  List<String> fromJson(String? json) {
    if (json == null) {
      return const [];
    } else if (json.isEmpty) {
      return const [];
    } else {
      return json.split(',');
    }
  }

  @override
  String toJson(List<String> object) {
    return object.join(',');
  }
}

class DoubleSerializer extends JsonConverter<double?, String?> {
  const DoubleSerializer();

  @override
  double? fromJson(String? json) {
    if (json != null) {
      return double.tryParse(json);
    } else {
      return null;
    }
  }

  @override
  String? toJson(double? object) => object.toString();
}
