import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ObjetivosRecord extends FirestoreRecord {
  ObjetivosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_obj" field.
  String? _idObj;
  String get idObj => _idObj ?? '';
  bool hasIdObj() => _idObj != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _idObj = snapshotData['id_obj'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('objetivos');

  static Stream<ObjetivosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ObjetivosRecord.fromSnapshot(s));

  static Future<ObjetivosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ObjetivosRecord.fromSnapshot(s));

  static ObjetivosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ObjetivosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ObjetivosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ObjetivosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ObjetivosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ObjetivosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createObjetivosRecordData({
  String? idObj,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_obj': idObj,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ObjetivosRecordDocumentEquality implements Equality<ObjetivosRecord> {
  const ObjetivosRecordDocumentEquality();

  @override
  bool equals(ObjetivosRecord? e1, ObjetivosRecord? e2) {
    return e1?.idObj == e2?.idObj && e1?.name == e2?.name;
  }

  @override
  int hash(ObjetivosRecord? e) =>
      const ListEquality().hash([e?.idObj, e?.name]);

  @override
  bool isValidKey(Object? o) => o is ObjetivosRecord;
}
