import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RespostasRecord extends FirestoreRecord {
  RespostasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "resposta" field.
  String? _resposta;
  String get resposta => _resposta ?? '';
  bool hasResposta() => _resposta != null;

  // "lista" field.
  List<String>? _lista;
  List<String> get lista => _lista ?? const [];
  bool hasLista() => _lista != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _resposta = snapshotData['resposta'] as String?;
    _lista = getDataList(snapshotData['lista']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('respostas');

  static Stream<RespostasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RespostasRecord.fromSnapshot(s));

  static Future<RespostasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RespostasRecord.fromSnapshot(s));

  static RespostasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RespostasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RespostasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RespostasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RespostasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RespostasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRespostasRecordData({
  int? id,
  String? resposta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'resposta': resposta,
    }.withoutNulls,
  );

  return firestoreData;
}

class RespostasRecordDocumentEquality implements Equality<RespostasRecord> {
  const RespostasRecordDocumentEquality();

  @override
  bool equals(RespostasRecord? e1, RespostasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.resposta == e2?.resposta &&
        listEquality.equals(e1?.lista, e2?.lista);
  }

  @override
  int hash(RespostasRecord? e) =>
      const ListEquality().hash([e?.id, e?.resposta, e?.lista]);

  @override
  bool isValidKey(Object? o) => o is RespostasRecord;
}
