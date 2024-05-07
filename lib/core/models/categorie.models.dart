// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Categorie {
   int id;
   String libelle;
    Categorie({
    required this.id,
    required this.libelle,
  });

  Categorie copyWith({
    int? id,
    String? libelle,
  }) {
    return Categorie(
      id: id ?? this.id,
      libelle: libelle ?? this.libelle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'libelle': libelle,
    };
  }

  factory Categorie.fromMap(Map<String, dynamic> map) {
    return Categorie(
      id: map['id'] as int,
      libelle: map['libelle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorie.fromJson(String source) => Categorie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Categorie(id: $id, libelle: $libelle)';

  @override
  bool operator ==(covariant Categorie other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.libelle == libelle;
  }

  @override
  int get hashCode => id.hashCode ^ libelle.hashCode;
}
