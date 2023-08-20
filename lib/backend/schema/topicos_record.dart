import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopicosRecord extends FirestoreRecord {
  TopicosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "tema_id" field.
  String? _temaId;
  String get temaId => _temaId ?? '';
  bool hasTemaId() => _temaId != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _name = snapshotData['name'] as String?;
    _temaId = snapshotData['tema_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topicos');

  static Stream<TopicosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopicosRecord.fromSnapshot(s));

  static Future<TopicosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopicosRecord.fromSnapshot(s));

  static TopicosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TopicosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopicosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopicosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopicosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopicosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopicosRecordData({
  int? id,
  String? name,
  String? temaId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'tema_id': temaId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TopicosRecordDocumentEquality implements Equality<TopicosRecord> {
  const TopicosRecordDocumentEquality();

  @override
  bool equals(TopicosRecord? e1, TopicosRecord? e2) {
    return e1?.id == e2?.id && e1?.name == e2?.name && e1?.temaId == e2?.temaId;
  }

  @override
  int hash(TopicosRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.temaId]);

  @override
  bool isValidKey(Object? o) => o is TopicosRecord;
}
