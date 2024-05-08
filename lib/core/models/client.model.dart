// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClientModel {
     int id;
     String nomComplet;
     String telephone;
    ClientModel({
    required this.id,
    required this.nomComplet,
    required this.telephone,
  });

  ClientModel copyWith({
    int? id,
    String? nomComplet,
    String? telephone,
  }) {
    return ClientModel(
      id: id ?? this.id,
      nomComplet: nomComplet ?? this.nomComplet,
      telephone: telephone ?? this.telephone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nomComplet': nomComplet,
      'telephone': telephone,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] as int,
      nomComplet: map['nomComplet'] as String,
      telephone: map['telephone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) => ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ClientModel(id: $id, nomComplet: $nomComplet, telephone: $telephone)';

  @override
  bool operator ==(covariant ClientModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nomComplet == nomComplet &&
      other.telephone == telephone;
  }

  @override
  int get hashCode => id.hashCode ^ nomComplet.hashCode ^ telephone.hashCode;
}
