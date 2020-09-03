import 'dart:convert';

class SimpleResponseMessage {
  /// Result of request

  bool success;
  SimpleResponseMessage({
    this.success,
  });

  SimpleResponseMessage copyWith({
    bool success,
  }) {
    return SimpleResponseMessage(
      success: success ?? this.success,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
    };
  }

  factory SimpleResponseMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SimpleResponseMessage(
      success: map['success'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SimpleResponseMessage.fromJson(String source) =>
      SimpleResponseMessage.fromMap(json.decode(source));

  @override
  String toString() => 'SimpleResponseMessage(success: $success)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SimpleResponseMessage && o.success == success;
  }

  @override
  int get hashCode => success.hashCode;
}
