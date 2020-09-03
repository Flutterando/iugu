import 'dart:convert';

/// <summary>
/// Requisição para a API de conta
/// </summary>
class AccountResponseMessage {
  /// Id da conta
  String accountId;

  /// Nome da conta
  String name;

  /// Token de produção
  String liveApiToken;

  /// Token de teste
  String testApiToken;

  /// Token do usuário, usado em algumas APIs específicas
  String userToken;

  AccountResponseMessage({
    this.accountId,
    this.name,
    this.liveApiToken,
    this.testApiToken,
    this.userToken,
  });

  AccountResponseMessage copyWith({
    String accountId,
    String name,
    String liveApiToken,
    String testApiToken,
    String userToken,
  }) {
    return AccountResponseMessage(
      accountId: accountId ?? this.accountId,
      name: name ?? this.name,
      liveApiToken: liveApiToken ?? this.liveApiToken,
      testApiToken: testApiToken ?? this.testApiToken,
      userToken: userToken ?? this.userToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'account_id': accountId,
      'name': name,
      'live_api_token': liveApiToken,
      'test_api_token': testApiToken,
      'user_token': userToken,
    };
  }

  factory AccountResponseMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AccountResponseMessage(
      accountId: map['account_id'],
      name: map['name'],
      liveApiToken: map['live_api_token'],
      testApiToken: map['test_api_token'],
      userToken: map['user_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountResponseMessage.fromJson(String source) =>
      AccountResponseMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AccountResponseMessage(accountId: $accountId, name: $name, liveApiToken: $liveApiToken, testApiToken: $testApiToken, userToken: $userToken)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AccountResponseMessage &&
        o.accountId == accountId &&
        o.name == name &&
        o.liveApiToken == liveApiToken &&
        o.testApiToken == testApiToken &&
        o.userToken == userToken;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        name.hashCode ^
        liveApiToken.hashCode ^
        testApiToken.hashCode ^
        userToken.hashCode;
  }
}
