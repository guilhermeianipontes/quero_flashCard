import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TemasRecord extends FirestoreRecord {
  TemasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "objetivo_id" field.
  String? _objetivoId;
  String get objetivoId => _objetivoId ?? '';
  bool hasObjetivoId() => _objetivoId != null;

  // "tema" field.
  String? _tema;
  String get tema => _tema ?? '';
  bool hasTema() => _tema != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _objetivoId = snapshotData['objetivo_id'] as String?;
    _tema = snapshotData['tema'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('temas');

  static Stream<TemasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TemasRecord.fromSnapshot(s));

  static Future<TemasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TemasRecord.fromSnapshot(s));

  static TemasRecord fromSnapshot(DocumentSnapshot snapshot) => TemasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TemasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TemasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TemasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TemasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTemasRecordData({
  int? id,
  String? objetivoId,
  String? tema,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'objetivo_id': objetivoId,
      'tema': tema,
    }.withoutNulls,
  );

  return firestoreData;
}

class TemasRecordDocumentEquality implements Equality<TemasRecord> {
  const TemasRecordDocumentEquality();

  @override
  bool equals(TemasRecord? e1, TemasRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.objetivoId == e2?.objetivoId &&
        e1?.tema == e2?.tema;
  }

  @override
  int hash(TemasRecord? e) =>
      const ListEquality().hash([e?.id, e?.objetivoId, e?.tema]);

  @override
  bool isValidKey(Object? o) => o is TemasRecord;
}
