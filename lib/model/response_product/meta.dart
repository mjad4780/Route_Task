import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  const Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Meta) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      createdAt.hashCode ^
      updatedAt.hashCode ^
      barcode.hashCode ^
      qrCode.hashCode;
}
