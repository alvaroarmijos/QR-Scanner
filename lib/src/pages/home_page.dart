import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_reader_app/src/bloc/scan_bloc.dart';
import 'package:qr_reader_app/src/models/scans_model.dart';
import 'package:qr_reader_app/src/pages/direcciones_page.dart';
import 'package:qr_reader_app/src/pages/mapas_pages.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_reader_app/src/utils/utils.dart' as utils;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();

  int currentIndex=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scaner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansBloc.borrarScanTodos,
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR(BuildContext context) async {


    String  futureString;

    try{
      futureString = await BarcodeScanner.scan();
    } catch (e){
      futureString = e.toString();
    }



    if (futureString != null){
      final scan = ScanModel(valor: futureString);
      scansBloc.agregarScan(scan);

      if (Platform.isIOS){
        Future.delayed(Duration(milliseconds: 750));
        utils.AbrirScan(context, scan);
      } else {
        utils.AbrirScan(context, scan);
      }


    }
  }

  Widget _callPage(int paginaActual){
    switch(paginaActual){
      case 0: return MapasPage();
      case 1: return DireccionesPage();
      default:
        return MapasPage();


    }
  }

  Widget _crearBottomNavigationBar(){

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5),
            title: Text('Direcciones')
        ),
      ],
    );

  }
}
