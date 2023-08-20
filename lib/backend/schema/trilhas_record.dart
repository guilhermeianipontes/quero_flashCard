import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrilhasRecord extends FirestoreRecord {
  TrilhasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_trilha" field.
  int? _idTrilha;
  int get idTrilha => _idTrilha ?? 0;
  bool hasIdTrilha() => _idTrilha != null;

  // "objetivo" field.
  String? _objetivo;
  String get objetivo => _objetivo ?? '';
  bool hasObjetivo() => _objetivo != null;

  // "tema" field.
  String? _tema;
  String get tema => _tema ?? '';
  bool hasTema() => _tema != null;

  void _initializeFields() {
    _idTrilha = castToType<int>(snapshotData['id_trilha']);
    _objetivo = snapshotData['objetivo'] as String?;
    _tema = snapshotData['tema'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Trilhas');

  static Stream<TrilhasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrilhasRecord.fromSnapshot(s));

  static Future<TrilhasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrilhasRecord.fromSnapshot(s));

  static TrilhasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TrilhasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrilhasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrilhasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrilhasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrilhasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrilhasRecordData({
  int? idTrilha,
  String? objetivo,
  String? tema,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_trilha': idTrilha,
      'objetivo': objetivo,
      'tema': tema,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrilhasRecordDocumentEquality implements Equality<TrilhasRecord> {
  const TrilhasRecordDocumentEquality();

  @override
  bool equals(TrilhasRecord? e1, TrilhasRecord? e2) {
    return e1?.idTrilha == e2?.idTrilha &&
        e1?.objetivo == e2?.objetivo &&
        e1?.tema == e2?.tema;
  }

  @override
  int hash(TrilhasRecord? e) =>
      const ListEquality().hash([e?.idTrilha, e?.objetivo, e?.tema]);

  @override
  bool isValidKey(Object? o) => o is TrilhasRecord;
}
