import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FactRecord extends FirestoreRecord {
  FactRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "deck_id" field.
  int? _deckId;
  int get deckId => _deckId ?? 0;
  bool hasDeckId() => _deckId != null;

  // "card_id" field.
  int? _cardId;
  int get cardId => _cardId ?? 0;
  bool hasCardId() => _cardId != null;

  // "trilha_id" field.
  int? _trilhaId;
  int get trilhaId => _trilhaId ?? 0;
  bool hasTrilhaId() => _trilhaId != null;

  void _initializeFields() {
    _status = castToType<int>(snapshotData['status']);
    _deckId = castToType<int>(snapshotData['deck_id']);
    _cardId = castToType<int>(snapshotData['card_id']);
    _trilhaId = castToType<int>(snapshotData['trilha_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fact');

  static Stream<FactRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FactRecord.fromSnapshot(s));

  static Future<FactRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FactRecord.fromSnapshot(s));

  static FactRecord fromSnapshot(DocumentSnapshot snapshot) => FactRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FactRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FactRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FactRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FactRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFactRecordData({
  int? status,
  int? deckId,
  int? cardId,
  int? trilhaId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'deck_id': deckId,
      'card_id': cardId,
      'trilha_id': trilhaId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FactRecordDocumentEquality implements Equality<FactRecord> {
  const FactRecordDocumentEquality();

  @override
  bool equals(FactRecord? e1, FactRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.deckId == e2?.deckId &&
        e1?.cardId == e2?.cardId &&
        e1?.trilhaId == e2?.trilhaId;
  }

  @override
  int hash(FactRecord? e) =>
      const ListEquality().hash([e?.status, e?.deckId, e?.cardId, e?.trilhaId]);

  @override
  bool isValidKey(Object? o) => o is FactRecord;
}
