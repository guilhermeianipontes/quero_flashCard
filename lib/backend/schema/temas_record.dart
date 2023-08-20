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

  // "id_tema" field.
  int? _idTema;
  int get idTema => _idTema ?? 0;
  bool hasIdTema() => _idTema != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idTema = castToType<int>(snapshotData['id_tema']);
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('temas')
          : FirebaseFirestore.instance.collectionGroup('temas');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('temas').doc();

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
  int? idTema,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_tema': idTema,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class TemasRecordDocumentEquality implements Equality<TemasRecord> {
  const TemasRecordDocumentEquality();

  @override
  bool equals(TemasRecord? e1, TemasRecord? e2) {
    return e1?.idTema == e2?.idTema && e1?.name == e2?.name;
  }

  @override
  int hash(TemasRecord? e) => const ListEquality().hash([e?.idTema, e?.name]);

  @override
  bool isValidKey(Object? o) => o is TemasRecord;
}
