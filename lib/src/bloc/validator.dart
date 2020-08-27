
import 'dart:async';
import 'dart:math';

import 'package:qr_reader_app/src/models/scans_model.dart';

class Validators {

  final validarGeo = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink){

      final geoScans = scans.where((element) => element.tipo == 'geo').toList();
      sink.add(geoScans);
    }
  );

  final validarHttp = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
      handleData: (scans, sink){

        final geoScans = scans.where((element) => element.tipo == 'http').toList();
        sink.add(geoScans);
      }
  );

}