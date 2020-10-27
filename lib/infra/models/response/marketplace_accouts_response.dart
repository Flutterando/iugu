import 'dart:convert';

class MarketplaceAccountsResponse {
  int totalItems;

  List<MarketPlaceAccountItem> accounts;

  MarketplaceAccountsResponse({
    this.totalItems,
    this.accounts,
  });

  MarketplaceAccountsResponse copyWith({
    int totalItems,
    List<MarketPlaceAccountItem> accounts,
  }) {
    return MarketplaceAccountsResponse(
      totalItems: totalItems ?? this.totalItems,
      accounts: accounts ?? this.accounts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalItems': totalItems,
      'items': accounts?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory MarketplaceAccountsResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MarketplaceAccountsResponse(
      totalItems: map['totalItems'],
      accounts: List<MarketPlaceAccountItem>.from(
          map['items']?.map((x) => MarketPlaceAccountItem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketplaceAccountsResponse.fromJson(String source) =>
      MarketplaceAccountsResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'MarketplaceAccoutsResponse(totalItems: $totalItems, accounts: $accounts)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MarketplaceAccountsResponse && o.totalItems == totalItems;
  }

  @override
  int get hashCode => totalItems.hashCode ^ accounts.hashCode;
}

class MarketPlaceAccountItem {
  String id;
  String name;
  bool verified;

  MarketPlaceAccountItem({
    this.id,
    this.name,
    this.verified,
  });

  MarketPlaceAccountItem copyWith({
    String id,
    String name,
    bool verified,
  }) {
    return MarketPlaceAccountItem(
      id: id ?? this.id,
      name: name ?? this.name,
      verified: verified ?? this.verified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'verified': verified,
    };
  }

  factory MarketPlaceAccountItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MarketPlaceAccountItem(
      id: map['id'],
      name: map['name'],
      verified: map['verified'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketPlaceAccountItem.fromJson(String source) =>
      MarketPlaceAccountItem.fromMap(json.decode(source));

  @override
  String toString() =>
      'MarketPlaceAccountItem(id: $id, name: $name, verified: $verified)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MarketPlaceAccountItem &&
        o.id == id &&
        o.name == name &&
        o.verified == verified;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ verified.hashCode;
}
