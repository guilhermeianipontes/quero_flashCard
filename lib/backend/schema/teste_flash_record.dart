import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TesteFlashRecord extends FirestoreRecord {
  TesteFlashRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "pergunta" field.
  String? _pergunta;
  String get pergunta => _pergunta ?? '';
  bool hasPergunta() => _pergunta != null;

  // "resposta" field.
  String? _resposta;
  String get resposta => _resposta ?? '';
  bool hasResposta() => _resposta != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _pergunta = snapshotData['pergunta'] as String?;
    _resposta = snapshotData['resposta'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testeFlash');

  static Stream<TesteFlashRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TesteFlashRecord.fromSnapshot(s));

  static Future<TesteFlashRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TesteFlashRecord.fromSnapshot(s));

  static TesteFlashRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TesteFlashRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TesteFlashRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TesteFlashRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TesteFlashRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TesteFlashRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTesteFlashRecordData({
  int? id,
  String? pergunta,
  String? resposta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'pergunta': pergunta,
      'resposta': resposta,
    }.withoutNulls,
  );

  return firestoreData;
}

class TesteFlashRecordDocumentEquality implements Equality<TesteFlashRecord> {
  const TesteFlashRecordDocumentEquality();

  @override
  bool equals(TesteFlashRecord? e1, TesteFlashRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.pergunta == e2?.pergunta &&
        e1?.resposta == e2?.resposta;
  }

  @override
  int hash(TesteFlashRecord? e) =>
      const ListEquality().hash([e?.id, e?.pergunta, e?.resposta]);

  @override
  bool isValidKey(Object? o) => o is TesteFlashRecord;
}
