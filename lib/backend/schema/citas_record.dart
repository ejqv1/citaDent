import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitasRecord extends FirestoreRecord {
  CitasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "motivo" field.
  String? _motivo;
  String get motivo => _motivo ?? '';
  bool hasMotivo() => _motivo != null;

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "creador" field.
  DocumentReference? _creador;
  DocumentReference? get creador => _creador;
  bool hasCreador() => _creador != null;

  void _initializeFields() {
    _fecha = snapshotData['fecha'] as DateTime?;
    _motivo = snapshotData['motivo'] as String?;
    _estado = snapshotData['estado'] as bool?;
    _creador = snapshotData['creador'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('citas');

  static Stream<CitasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitasRecord.fromSnapshot(s));

  static Future<CitasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitasRecord.fromSnapshot(s));

  static CitasRecord fromSnapshot(DocumentSnapshot snapshot) => CitasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitasRecordData({
  DateTime? fecha,
  String? motivo,
  bool? estado,
  DocumentReference? creador,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha': fecha,
      'motivo': motivo,
      'estado': estado,
      'creador': creador,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitasRecordDocumentEquality implements Equality<CitasRecord> {
  const CitasRecordDocumentEquality();

  @override
  bool equals(CitasRecord? e1, CitasRecord? e2) {
    return e1?.fecha == e2?.fecha &&
        e1?.motivo == e2?.motivo &&
        e1?.estado == e2?.estado &&
        e1?.creador == e2?.creador;
  }

  @override
  int hash(CitasRecord? e) =>
      const ListEquality().hash([e?.fecha, e?.motivo, e?.estado, e?.creador]);

  @override
  bool isValidKey(Object? o) => o is CitasRecord;
}
