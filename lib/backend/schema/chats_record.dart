import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creador" field.
  DocumentReference? _creador;
  DocumentReference? get creador => _creador;
  bool hasCreador() => _creador != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "ultimoMensaje" field.
  String? _ultimoMensaje;
  String get ultimoMensaje => _ultimoMensaje ?? '';
  bool hasUltimoMensaje() => _ultimoMensaje != null;

  void _initializeFields() {
    _creador = snapshotData['creador'] as DocumentReference?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _ultimoMensaje = snapshotData['ultimoMensaje'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? creador,
  DateTime? fecha,
  String? ultimoMensaje,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creador': creador,
      'fecha': fecha,
      'ultimoMensaje': ultimoMensaje,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    return e1?.creador == e2?.creador &&
        e1?.fecha == e2?.fecha &&
        e1?.ultimoMensaje == e2?.ultimoMensaje;
  }

  @override
  int hash(ChatsRecord? e) =>
      const ListEquality().hash([e?.creador, e?.fecha, e?.ultimoMensaje]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
