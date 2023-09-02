import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MensajeRecord extends FirestoreRecord {
  MensajeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "esUsuario" field.
  bool? _esUsuario;
  bool get esUsuario => _esUsuario ?? false;
  bool hasEsUsuario() => _esUsuario != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _texto = snapshotData['texto'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _esUsuario = snapshotData['esUsuario'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('mensaje')
          : FirebaseFirestore.instance.collectionGroup('mensaje');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('mensaje').doc();

  static Stream<MensajeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MensajeRecord.fromSnapshot(s));

  static Future<MensajeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MensajeRecord.fromSnapshot(s));

  static MensajeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MensajeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MensajeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MensajeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MensajeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MensajeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMensajeRecordData({
  String? texto,
  DateTime? fecha,
  bool? esUsuario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'texto': texto,
      'fecha': fecha,
      'esUsuario': esUsuario,
    }.withoutNulls,
  );

  return firestoreData;
}

class MensajeRecordDocumentEquality implements Equality<MensajeRecord> {
  const MensajeRecordDocumentEquality();

  @override
  bool equals(MensajeRecord? e1, MensajeRecord? e2) {
    return e1?.texto == e2?.texto &&
        e1?.fecha == e2?.fecha &&
        e1?.esUsuario == e2?.esUsuario;
  }

  @override
  int hash(MensajeRecord? e) =>
      const ListEquality().hash([e?.texto, e?.fecha, e?.esUsuario]);

  @override
  bool isValidKey(Object? o) => o is MensajeRecord;
}
