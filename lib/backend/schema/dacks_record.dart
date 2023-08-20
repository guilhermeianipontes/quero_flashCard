import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DacksRecord extends FirestoreRecord {
  DacksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_dack" field.
  int? _idDack;
  int get idDack => _idDack ?? 0;
  bool hasIdDack() => _idDack != null;

  // "id_perguntas" field.
  List<String>? _idPerguntas;
  List<String> get idPerguntas => _idPerguntas ?? const [];
  bool hasIdPerguntas() => _idPerguntas != null;

  // "id_respostas" field.
  List<String>? _idRespostas;
  List<String> get idRespostas => _idRespostas ?? const [];
  bool hasIdRespostas() => _idRespostas != null;

  void _initializeFields() {
    _idDack = castToType<int>(snapshotData['id_dack']);
    _idPerguntas = getDataList(snapshotData['id_perguntas']);
    _idRespostas = getDataList(snapshotData['id_respostas']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dacks');

  static Stream<DacksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DacksRecord.fromSnapshot(s));

  static Future<DacksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DacksRecord.fromSnapshot(s));

  static DacksRecord fromSnapshot(DocumentSnapshot snapshot) => DacksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DacksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DacksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DacksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DacksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDacksRecordData({
  int? idDack,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_dack': idDack,
    }.withoutNulls,
  );

  return firestoreData;
}

class DacksRecordDocumentEquality implements Equality<DacksRecord> {
  const DacksRecordDocumentEquality();

  @override
  bool equals(DacksRecord? e1, DacksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idDack == e2?.idDack &&
        listEquality.equals(e1?.idPerguntas, e2?.idPerguntas) &&
        listEquality.equals(e1?.idRespostas, e2?.idRespostas);
  }

  @override
  int hash(DacksRecord? e) =>
      const ListEquality().hash([e?.idDack, e?.idPerguntas, e?.idRespostas]);

  @override
  bool isValidKey(Object? o) => o is DacksRecord;
}
