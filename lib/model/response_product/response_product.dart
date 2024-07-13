import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'response_product.g.dart';

@JsonSerializable()
class ResponseProduct {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  const ResponseProduct({this.products, this.total, this.skip, this.limit});

  factory ResponseProduct.fromJson(Map<String, dynamic> json) {
    return _$ResponseProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseProductToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseProduct) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      products.hashCode ^ total.hashCode ^ skip.hashCode ^ limit.hashCode;
}
