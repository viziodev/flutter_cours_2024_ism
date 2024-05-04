// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Categorie {
   final int id;
   final String libelle;
    final String icon;
  Categorie({
    required this.id,
    required this.libelle,
    required this.icon,
  });


  Categorie copyWith({
    int? id,
    String? libelle,
    String? icon,
  }) {
    return Categorie(
      id: id ?? this.id,
      libelle: libelle ?? this.libelle,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'libelle': libelle,
      'icon': icon,
    };
  }

  factory Categorie.fromMap(Map<String, dynamic> map) {
    return Categorie(
      id: map['id'] as int,
      libelle: map['libelle'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorie.fromJson(String source) => Categorie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Categorie(id: $id, libelle: $libelle, icon: $icon)';

  @override
  bool operator ==(covariant Categorie other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.libelle == libelle &&
      other.icon == icon;
  }

  @override
  int get hashCode => id.hashCode ^ libelle.hashCode ^ icon.hashCode;
}
