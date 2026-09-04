import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItinerariesRecord extends FirestoreRecord {
  ItinerariesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "days" field.
  int? _days;
  int get days => _days ?? 0;
  bool hasDays() => _days != null;

  // "interests" field.
  List<String>? _interests;
  List<String> get interests => _interests ?? const [];
  bool hasInterests() => _interests != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "rawResponse" field.
  String? _rawResponse;
  String get rawResponse => _rawResponse ?? '';
  bool hasRawResponse() => _rawResponse != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _city = snapshotData['city'] as String?;
    _days = castToType<int>(snapshotData['days']);
    _interests = getDataList(snapshotData['interests']);
    _language = snapshotData['language'] as String?;
    _rawResponse = snapshotData['rawResponse'] as String?;
    _createdAt = snapshotData['createdAt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('itineraries');

  static Stream<ItinerariesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItinerariesRecord.fromSnapshot(s));

  static Future<ItinerariesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItinerariesRecord.fromSnapshot(s));

  static ItinerariesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItinerariesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItinerariesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItinerariesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItinerariesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItinerariesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItinerariesRecordData({
  String? city,
  int? days,
  String? language,
  String? rawResponse,
  String? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city': city,
      'days': days,
      'language': language,
      'rawResponse': rawResponse,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItinerariesRecordDocumentEquality implements Equality<ItinerariesRecord> {
  const ItinerariesRecordDocumentEquality();

  @override
  bool equals(ItinerariesRecord? e1, ItinerariesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.city == e2?.city &&
        e1?.days == e2?.days &&
        listEquality.equals(e1?.interests, e2?.interests) &&
        e1?.language == e2?.language &&
        e1?.rawResponse == e2?.rawResponse &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ItinerariesRecord? e) => const ListEquality().hash([
        e?.city,
        e?.days,
        e?.interests,
        e?.language,
        e?.rawResponse,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is ItinerariesRecord;
}
