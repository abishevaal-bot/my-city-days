import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItineraryDaysRecord extends FirestoreRecord {
  ItineraryDaysRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itineraryId" field.
  String? _itineraryId;
  String get itineraryId => _itineraryId ?? '';
  bool hasItineraryId() => _itineraryId != null;

  // "dayNumber" field.
  int? _dayNumber;
  int get dayNumber => _dayNumber ?? 0;
  bool hasDayNumber() => _dayNumber != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  bool hasSubtitle() => _subtitle != null;

  void _initializeFields() {
    _itineraryId = snapshotData['itineraryId'] as String?;
    _dayNumber = castToType<int>(snapshotData['dayNumber']);
    _title = snapshotData['title'] as String?;
    _subtitle = snapshotData['subtitle'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('itinerary_days');

  static Stream<ItineraryDaysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItineraryDaysRecord.fromSnapshot(s));

  static Future<ItineraryDaysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItineraryDaysRecord.fromSnapshot(s));

  static ItineraryDaysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItineraryDaysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItineraryDaysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItineraryDaysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItineraryDaysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItineraryDaysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItineraryDaysRecordData({
  String? itineraryId,
  int? dayNumber,
  String? title,
  String? subtitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itineraryId': itineraryId,
      'dayNumber': dayNumber,
      'title': title,
      'subtitle': subtitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItineraryDaysRecordDocumentEquality
    implements Equality<ItineraryDaysRecord> {
  const ItineraryDaysRecordDocumentEquality();

  @override
  bool equals(ItineraryDaysRecord? e1, ItineraryDaysRecord? e2) {
    return e1?.itineraryId == e2?.itineraryId &&
        e1?.dayNumber == e2?.dayNumber &&
        e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle;
  }

  @override
  int hash(ItineraryDaysRecord? e) => const ListEquality()
      .hash([e?.itineraryId, e?.dayNumber, e?.title, e?.subtitle]);

  @override
  bool isValidKey(Object? o) => o is ItineraryDaysRecord;
}
