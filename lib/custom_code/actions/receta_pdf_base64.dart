// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http; // Para descargar la imagen
import 'package:image/image.dart' as img; // Para procesar la imagen
import 'dart:typed_data'; // Para manejar los bytes
import 'dart:convert'; // Para la codificación base64

Future<String> recetaPdfBase64(
  String? logourl,
  String? nombreMedico,
  String? nombrePaciente,
  String? edadPaciente,
  String? fechaConsulta,
  String? telefono,
  String? direccion,
  List<String>? certificadoPor,
  List<String>? cedulas,
  List<String>? medicamentos,
) async {
  // Descargar la imagen desde la URL
  final response = await http.get(Uri.parse(logourl!));
  final Uint8List imageBytes = response.bodyBytes;

  // Decodificar la imagen
  img.Image? originalImage = img.decodeImage(imageBytes);

  // Inicializar una variable para guardar el PDF como base64
  String pdfBase64 = '';

  if (originalImage != null) {
    // Redimensionar y comprimir la imagen
    img.Image resizedImage = img.copyResize(originalImage, width: 100);
    Uint8List compressedBytes = Uint8List.fromList(
      img.encodeJpg(resizedImage, quality: 85),
    );

    // Crear la imagen comprimida para el PDF
    final compressedImage = pw.MemoryImage(compressedBytes);

    // Crear el documento PDF
    final pdf = pw.Document();

    // Añadir página al documento
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Container(
            padding: pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Container(
                      width: 100,
                      height: 100,
                      decoration: pw.BoxDecoration(
                        shape: pw.BoxShape
                            .circle, // Hace que el contenedor sea circular
                        image: pw.DecorationImage(
                          image: compressedImage,
                          fit: pw.BoxFit
                              .cover, // Ajusta la imagen para cubrir el círculo
                        ),
                      ),
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(nombreMedico!,
                            style: pw.TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Container(
                      width: 200,
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(width: 1),
                        borderRadius: pw.BorderRadius.circular(10),
                      ),
                      child: pw.Column(
                        children: [
                          pw.SizedBox(height: 5),
                          pw.Text(
                            'Cédulas profesionales:',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 12),
                          ),
                          pw.SizedBox(height: 5),
                          pw.ListView.builder(
                            itemCount: cedulas!.length,
                            itemBuilder: (context, tareasIndex) {
                              final tareasItem = cedulas![tareasIndex];
                              return pw.Text(tareasItem);
                            },
                          ),
                          pw.SizedBox(height: 5),
                        ],
                      ),
                    ),
                    pw.Container(
                      width: 200,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 5),
                          pw.Text(
                            'Certificado por:',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 12),
                          ),
                          pw.SizedBox(height: 5),
                          pw.ListView.builder(
                            itemCount: certificadoPor!.length,
                            itemBuilder: (context, tareasIndex) {
                              final tareasItem = certificadoPor![tareasIndex];
                              return pw.Text(tareasItem);
                            },
                          ),
                          pw.SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Nombre: ' + nombrePaciente!),
                    pw.Text('Edad: ' + edadPaciente!),
                    pw.Text('Fecha: ' + fechaConsulta!),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Container(
                  height: 350,
                  width: 800,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(width: 1),
                    borderRadius: pw.BorderRadius.circular(10),
                  ),
                  child: pw.Padding(
                    padding: pw.EdgeInsets.all(20),
                    child: pw.ListView.builder(
                      itemCount: medicamentos!.length,
                      itemBuilder: (context, tareasIndex) {
                        final tareasItem1 = medicamentos![tareasIndex];
                        return pw.Align(
                          alignment: pw.Alignment
                              .centerLeft, // CAMBIO 2: Alinear medicamentos a la izquierda
                          child: pw.Text(tareasItem1),
                        );
                      },
                    ),
                  ),
                ),
                pw.SizedBox(height: 20), // Reduced space for tighter layout
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Dirección: ' + (direccion ?? 'No disponible')),
                    pw.Text('Teléfono: ' + (telefono ?? 'No disponible')),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    // Guardar el PDF como bytes
    final Uint8List pdfBytes = await pdf.save();

    // Convertir los bytes a Base64
    pdfBase64 = base64Encode(pdfBytes);
  }

  // Retornar el PDF como string en formato base64
  return pdfBase64;
}
