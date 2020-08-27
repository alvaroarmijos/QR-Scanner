import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_reader_app/src/models/scans_model.dart';


class MapaPage extends StatelessWidget {

  MapController mapController = new MapController();

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.my_location),
          onPressed: (){
            mapController.move(scan.geteLatLng(), 15.0);
          },
          )
        ],
      ),
      body: _crearFlutterMap(scan),
    );
  }

  Widget _crearFlutterMap (ScanModel scan) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: scan.geteLatLng(),
        zoom: 15.0
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan),
      ],
    );
  }

  _crearMapa(){
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
        additionalOptions: {
          'accessToken':'pk.eyJ1IjoibGFsbzE1OTUiLCJhIjoiY2tlYnpld3NwMGRzYTJycWoyYTVtdWVreCJ9.MGsBl32jaDqIrUmetLuB0A',
          'id': 'mapbox/streets-v11'
        }
    );
  }

  _crearMarcadores(ScanModel scan){

    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 120.0,
          height: 120.0,
          point: scan.geteLatLng(),
          builder: (context) => Container(
            child: Icon(
              Icons.location_on,
              size: 55.0,
              color: Theme.of(context).primaryColor,),
          )
        )
      ]
    );
  }
}
