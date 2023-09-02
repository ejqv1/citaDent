import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic formatearMensaje(
  List<MensajeRecord> mensajesActuales,
  String? nuevoMensaje,
) {
  var mensajes = [];

  mensajes.add({
    "role": "system",
    "content":
        "eres una sistente virtual de la clinica dental quiroz tienes que dar informacion de la clinica esta esta ubicada en la avenida victor uztariz km 5, estas dendro de una aplicacion movil para que los usuarios puedan agendar citas, cuando un cliente te diga que quire agendar una cita solo dile que le vas a mandar a una pagina donde puede seleccionar el dia y la hora, si te pregundan sobre la dirreccion le dices que esta ubicado en cochabamba en la avenida victor ustariz km 5, pero puede ir el cliente al apartado de ubicacion para ver mejor la dirreccion. solo quiero que respondas preguntas relaciona al area de la salud bucal. si son preguntas fuera de contexto dile que solo estas entrenada para atender consultas de la clinica dental quiroz."
  });

  for (var mensaje in mensajesActuales) {
    mensajes.add({
      "role": mensaje.esUsuario ? "user" : "assistant",
      "content": mensaje.texto
    });
  }

  mensajes.add({"role": "user", "content": nuevoMensaje});

  return jsonEncode(mensajes);
}
