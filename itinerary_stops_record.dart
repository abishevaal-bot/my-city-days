import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItineraryStopsRecord extends FirestoreRecord {
  ItineraryStopsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "mapsUrl" field.
  String? _mapsUrl;
  String get mapsUrl => _mapsUrl ?? '';
  bool hasMapsUrl() => _mapsUrl != null;

  void _initializeFields() {
    _dayId = snapshotData['dayId'] as String?;
    _time = snapshotData['time'] as String?;
    _name = snapshotData['name'] as String?;
    _note = snapshotData['note'] as String?;
    _mapsUrl = snapshotData['mapsUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('itinerary_stops');

  static Stream<ItineraryStopsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItineraryStopsRecord.fromSnapshot(s));

  static Future<ItineraryStopsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItineraryStopsRecord.fromSnapshot(s));

  static ItineraryStopsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItineraryStopsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItineraryStopsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItineraryStopsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItineraryStopsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItineraryStopsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItineraryStopsRecordData({
  String? dayId,
  String? time,
  String? name,
  String? note,
  String? mapsUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dayId': dayId,
      'time': time,
      'name': name,
      'note': note,
      'mapsUrl': mapsUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItineraryStopsRecordDocumentEquality
    implements Equality<ItineraryStopsRecord> {
  const ItineraryStopsRecordDocumentEquality();

  @override
  bool equals(ItineraryStopsRecord? e1, ItineraryStopsRecord? e2) {
    return e1?.dayId == e2?.dayId &&
        e1?.time == e2?.time &&
        e1?.name == e2?.name &&
        e1?.note == e2?.note &&
        e1?.mapsUrl == e2?.mapsUrl;
  }

  @override
  int hash(ItineraryStopsRecord? e) => const ListEquality()
      .hash([e?.dayId, e?.time, e?.name, e?.note, e?.mapsUrl]);

  @override
  bool isValidKey(Object? o) => o is ItineraryStopsRecord;
}
