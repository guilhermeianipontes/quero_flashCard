import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrilhaRecord extends FirestoreRecord {
  TrilhaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_trilha" field.
  int? _idTrilha;
  int get idTrilha => _idTrilha ?? 0;
  bool hasIdTrilha() => _idTrilha != null;

  // "ids_decks" field.
  List<int>? _idsDecks;
  List<int> get idsDecks => _idsDecks ?? const [];
  bool hasIdsDecks() => _idsDecks != null;

  void _initializeFields() {
    _idTrilha = castToType<int>(snapshotData['id_trilha']);
    _idsDecks = getDataList(snapshotData['ids_decks']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trilha');

  static Stream<TrilhaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrilhaRecord.fromSnapshot(s));

  static Future<TrilhaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrilhaRecord.fromSnapshot(s));

  static TrilhaRecord fromSnapshot(DocumentSnapshot snapshot) => TrilhaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrilhaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrilhaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrilhaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrilhaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrilhaRecordData({
  int? idTrilha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_trilha': idTrilha,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrilhaRecordDocumentEquality implements Equality<TrilhaRecord> {
  const TrilhaRecordDocumentEquality();

  @override
  bool equals(TrilhaRecord? e1, TrilhaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idTrilha == e2?.idTrilha &&
        listEquality.equals(e1?.idsDecks, e2?.idsDecks);
  }

  @override
  int hash(TrilhaRecord? e) =>
      const ListEquality().hash([e?.idTrilha, e?.idsDecks]);

  @override
  bool isValidKey(Object? o) => o is TrilhaRecord;
}
