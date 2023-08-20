import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlashcardsRecord extends FirestoreRecord {
  FlashcardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "deck_id" field.
  int? _deckId;
  int get deckId => _deckId ?? 0;
  bool hasDeckId() => _deckId != null;

  // "flashcard_id" field.
  int? _flashcardId;
  int get flashcardId => _flashcardId ?? 0;
  bool hasFlashcardId() => _flashcardId != null;

  // "goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  bool hasGoal() => _goal != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "subtopic" field.
  String? _subtopic;
  String get subtopic => _subtopic ?? '';
  bool hasSubtopic() => _subtopic != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "seed_deck_id" field.
  String? _seedDeckId;
  String get seedDeckId => _seedDeckId ?? '';
  bool hasSeedDeckId() => _seedDeckId != null;

  // "seed_flashcard_id" field.
  int? _seedFlashcardId;
  int get seedFlashcardId => _seedFlashcardId ?? 0;
  bool hasSeedFlashcardId() => _seedFlashcardId != null;

  void _initializeFields() {
    _deckId = castToType<int>(snapshotData['deck_id']);
    _flashcardId = castToType<int>(snapshotData['flashcard_id']);
    _goal = snapshotData['goal'] as String?;
    _subject = snapshotData['subject'] as String?;
    _subtopic = snapshotData['subtopic'] as String?;
    _question = snapshotData['question'] as String?;
    _answer = snapshotData['answer'] as String?;
    _seedDeckId = snapshotData['seed_deck_id'] as String?;
    _seedFlashcardId = castToType<int>(snapshotData['seed_flashcard_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('flashcards');

  static Stream<FlashcardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FlashcardsRecord.fromSnapshot(s));

  static Future<FlashcardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FlashcardsRecord.fromSnapshot(s));

  static FlashcardsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FlashcardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FlashcardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FlashcardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FlashcardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FlashcardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFlashcardsRecordData({
  int? deckId,
  int? flashcardId,
  String? goal,
  String? subject,
  String? subtopic,
  String? question,
  String? answer,
  String? seedDeckId,
  int? seedFlashcardId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'deck_id': deckId,
      'flashcard_id': flashcardId,
      'goal': goal,
      'subject': subject,
      'subtopic': subtopic,
      'question': question,
      'answer': answer,
      'seed_deck_id': seedDeckId,
      'seed_flashcard_id': seedFlashcardId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FlashcardsRecordDocumentEquality implements Equality<FlashcardsRecord> {
  const FlashcardsRecordDocumentEquality();

  @override
  bool equals(FlashcardsRecord? e1, FlashcardsRecord? e2) {
    return e1?.deckId == e2?.deckId &&
        e1?.flashcardId == e2?.flashcardId &&
        e1?.goal == e2?.goal &&
        e1?.subject == e2?.subject &&
        e1?.subtopic == e2?.subtopic &&
        e1?.question == e2?.question &&
        e1?.answer == e2?.answer &&
        e1?.seedDeckId == e2?.seedDeckId &&
        e1?.seedFlashcardId == e2?.seedFlashcardId;
  }

  @override
  int hash(FlashcardsRecord? e) => const ListEquality().hash([
        e?.deckId,
        e?.flashcardId,
        e?.goal,
        e?.subject,
        e?.subtopic,
        e?.question,
        e?.answer,
        e?.seedDeckId,
        e?.seedFlashcardId
      ]);

  @override
  bool isValidKey(Object? o) => o is FlashcardsRecord;
}
