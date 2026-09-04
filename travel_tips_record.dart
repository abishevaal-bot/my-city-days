import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TravelTipsRecord extends FirestoreRecord {
  TravelTipsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itineraryId" field.
  String? _itineraryId;
  String get itineraryId => _itineraryId ?? '';
  bool hasItineraryId() => _itineraryId != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  void _initializeFields() {
    _itineraryId = snapshotData['itineraryId'] as String?;
    _text = snapshotData['text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('travel_tips');

  static Stream<TravelTipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TravelTipsRecord.fromSnapshot(s));

  static Future<TravelTipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TravelTipsRecord.fromSnapshot(s));

  static TravelTipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TravelTipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TravelTipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TravelTipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TravelTipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TravelTipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTravelTipsRecordData({
  String? itineraryId,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itineraryId': itineraryId,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class TravelTipsRecordDocumentEquality implements Equality<TravelTipsRecord> {
  const TravelTipsRecordDocumentEquality();

  @override
  bool equals(TravelTipsRecord? e1, TravelTipsRecord? e2) {
    return e1?.itineraryId == e2?.itineraryId && e1?.text == e2?.text;
  }

  @override
  int hash(TravelTipsRecord? e) =>
      const ListEquality().hash([e?.itineraryId, e?.text]);

  @override
  bool isValidKey(Object? o) => o is TravelTipsRecord;
}
