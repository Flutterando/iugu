import 'dart:convert';

import 'package:flutter/foundation.dart';

class PaggedResponseMessage<T> {
  /// Total de items existentes
  int totalItems;

  /// Total de items retornados
  int get totalItemsReturned => items.length;

  /// Agência da Conta
  /// Formatos com validação automática(9999-D, 9999)
  List<T> items;

  PaggedResponseMessage({
    this.totalItems,
    this.items,
  });

  PaggedResponseMessage<T> copyWith({
    int totalItems,
    List<T> items,
  }) {
    return PaggedResponseMessage<T>(
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalItems': totalItems,
      'Items': items,
    };
  }

  factory PaggedResponseMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PaggedResponseMessage<T>(
      totalItems: map['totalItems'],
      items: map['Items'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaggedResponseMessage.fromJson(String source) =>
      PaggedResponseMessage.fromMap(json.decode(source));

  @override
  String toString() =>
      'PaggedResponseMessage(totalItems: $totalItems, items: $items)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaggedResponseMessage<T> &&
        o.totalItems == totalItems &&
        listEquals(o.items, items);
  }

  @override
  int get hashCode => totalItems.hashCode ^ items.hashCode;
}
