import 'dart:convert';

class Logs {
  /// Descrição da Entrada de Log
  String description;

  /// Anotações da Entrada de Log
  String notes;

  Logs({
    this.description,
    this.notes,
  });

  Logs copyWith({
    String description,
    String notes,
  }) {
    return Logs(
      description: description ?? this.description,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'notes': notes,
    };
  }

  factory Logs.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Logs(
      description: map['description'],
      notes: map['notes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Logs.fromJson(String source) => Logs.fromMap(json.decode(source));

  @override
  String toString() => 'Logs(description: $description, notes: $notes)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Logs && o.description == description && o.notes == notes;
  }

  @override
  int get hashCode => description.hashCode ^ notes.hashCode;
}
