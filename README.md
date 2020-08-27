# QR Scanner
Aplicación en Flutter que lee **códigos QR**. Lanza la cámara para tomar un código, leerlo, reaccionar en base al código y almacenar la información en una base de datos interna (**SQLite**) que se tiene en el dispositivo.

<p>
    <img src="https://res.cloudinary.com/dzgd10ssq/image/upload/v1598568801/Apps/eeijgnmyianpubgsp6ec.jpg" width="200"/ hspace="5"> 
    <img src="https://res.cloudinary.com/dzgd10ssq/image/upload/v1598568801/Apps/aqxvbhcz3wndjkn3d2xc.jpg" width="200"/ hspace="5">
    <img src="https://res.cloudinary.com/dzgd10ssq/image/upload/v1598568802/Apps/fb4mkxzcg8cvd7p73we2.jpg" width="200"/ hspace="5">
    <img src="https://res.cloudinary.com/dzgd10ssq/image/upload/v1598570572/Apps/mbztkwycynnvkmncjujb.gif" width="190px"/>  </div>
</p>


# Comenzando 🚀

Estas instrucciones te permitirán obtener una copia de la aplicacion para propósitos de desarrollo y pruebas.

## Pre-requisitos 📋

Que plugins necesitas para el funcionamiento de la aplicacion
- [Barcode Scanner](https://pub.dev/packages/barcode_scan#-installing-tab- "Barcode Scanner")
- [sqflite](https://pub.dev/packages/sqflite#-readme-tab- "sqflite")
- [path_provider](https://pub.dev/packages/path_provider#-installing-tab- "path_provider")
- [url_launcher](https://pub.dev/packages/url_launcher "url_launcher")
- [flutter_map](https://pub.dev/packages/flutter_map#-installing-tab- "flutter_map")

También necesitas un api key de [mapbox](https://www.mapbox.com/ "mapbox"). Una vez tengas generada la api key de mapbox, la agregas en **/lib/src/pages/mapa_page.dart**
```
_crearMapa(){
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
        additionalOptions: {
          'accessToken':'Aqui va api-key',
          'id': 'mapbox/streets-v11'
        }
    );
  }
  ```
  
  # Ejecutando las pruebas ⚙️
  
  Para probar la app se debe ejecutar en un dispositivo real. Además, utilice [Generador QR-Code](https://www.qrcode.es/es/generador-qr-code/ "Generador QR-Code") para generar códigos QR de webs y mapas.
  
  # Construido con 🛠️
  - [Flutter](https://flutter.dev/ "flutter")
  - [Android Studio](https://developer.android.com/studio "Android Studio")
  - [Mapbox](https://www.mapbox.com/ "mapbox")
