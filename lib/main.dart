import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.Dart';
import 'package:proyect/manipulacionBD.dart';
import 'dart:async';

import 'definicionBD.dart';

void main(){

    WidgetsFlutterBinding.ensureInitialized();
    final ManipulacionBD bdmain = ManipulacionBD();

    runApp(MyApp());

}

var ancho=0.175,alto=0.194;
var estado=false;
var volteadas=0;

var ANumeros = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];

var Respuestas=[AssetImage('assets/1.jpg'),AssetImage('assets/2.jpg'),
  AssetImage('assets/3.jpg'),AssetImage('assets/4.jpg'),
  AssetImage('assets/5.jpg'),AssetImage('assets/6.jpg'),
  AssetImage('assets/7.jpg'),AssetImage('assets/8.jpg'),
  AssetImage('assets/9.jpg'),AssetImage('assets/10.jpg'),
  AssetImage('assets/11.jpg'),AssetImage('assets/12.jpg'),
  AssetImage('assets/13.jpg'),AssetImage('assets/14.jpg'),
  AssetImage('assets/15.jpg'),AssetImage('assets/16.jpg'),];

var NumRandom = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
var Estados =[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
var i,j,k;
var par=0,impar=0,turno=0,pares=0,Num1=0,Num2=0,extra=0,res=0,bandera=0;
var random = new Random();

_MyHomePageState nosequesoy = new _MyHomePageState();
final ManipulacionBD bd = ManipulacionBD();

AssetImage assetImage1 = AssetImage('assets/m.jpg');
AssetImage assetImage2 = AssetImage('assets/m.jpg');
AssetImage assetImage3 = AssetImage('assets/m.jpg');
AssetImage assetImage4 = AssetImage('assets/m.jpg');
AssetImage assetImage5 = AssetImage('assets/m.jpg');
AssetImage assetImage6 = AssetImage('assets/m.jpg');
AssetImage assetImage7 = AssetImage('assets/m.jpg');
AssetImage assetImage8 = AssetImage('assets/m.jpg');
AssetImage assetImage9 = AssetImage('assets/m.jpg');
AssetImage assetImage10 = AssetImage('assets/m.jpg');
AssetImage assetImage11 = AssetImage('assets/m.jpg');
AssetImage assetImage12 = AssetImage('assets/m.jpg');
AssetImage assetImage13 = AssetImage('assets/m.jpg');
AssetImage assetImage14 = AssetImage('assets/m.jpg');
AssetImage assetImage15 = AssetImage('assets/m.jpg');
AssetImage assetImage16 = AssetImage('assets/m.jpg');

int _index=0;
final List<Escenas> escenas=[];

class Escenas{
  String Dialogo;
  String Fondo;
  String Render;
  String Npersonaje;
  String Eleccion;
  Escenas(this.Dialogo,this.Fondo,this.Render,this.Npersonaje,this.Eleccion);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage3(title: 'Animaliak',),
    );
  }
}

class FirstRoute extends StatefulWidget {

  FirstRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _First createState() => _First();

}

class _First extends State<FirstRoute>{

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/fondo1.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.greenAccent,
                    child: Text('Historia'),
                    onPressed: () {
                      nosequesoy.shuffle(NumRandom);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage2(title: 'Memorama')),
                      );
                    },
                  ),
                  RaisedButton(
                    color: Colors.greenAccent,
                    child: Text('Creditos'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage3(title: 'Memorama')),
                      );
                    },
                  ),
                ],)
          ),
        ],
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState(){
    super.initState();
    shuffle(NumRandom);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  var memo='assets/m.jpg';
  var good='assets/good.jpg';

  void shuffle(List list, [int start = 0, int end]) {

    if (end == null) end = list.length;
    int length = end - start;
    while (length > 1) {
      int pos = random.nextInt(length);
      length--;
      var tmp1 = list[start + pos];
      list[start + pos] = list[start + length];
      list[start + length] = tmp1;
    }

    Estados =[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
    pares=0;
    cerradas();

  }
  void cerradas(){
    assetImage1 = AssetImage(memo);
    assetImage2 = AssetImage(memo);
    assetImage3 = AssetImage(memo);
    assetImage4 = AssetImage(memo);
    assetImage5 = AssetImage(memo);
    assetImage6 = AssetImage(memo);
    assetImage7 = AssetImage(memo);
    assetImage8 = AssetImage(memo);
    assetImage9 = AssetImage(memo);
    assetImage10 = AssetImage(memo);
    assetImage11 = AssetImage(memo);
    assetImage12 = AssetImage(memo);
    assetImage13 = AssetImage(memo);
    assetImage14 = AssetImage(memo);
    assetImage15 = AssetImage(memo);
    assetImage16 = AssetImage(memo);
  }

  void im (var status){
    setState(() {
      if(Estados[status]==1){
        switch (status) {
          case 0:assetImage1 = Respuestas[NumRandom[0]];break;
          case 1:assetImage2 = Respuestas[NumRandom[1]];break;
          case 2:assetImage3 = Respuestas[NumRandom[2]];break;
          case 3:assetImage4 = Respuestas[NumRandom[3]];break;
          case 4:assetImage5 = Respuestas[NumRandom[4]];break;
          case 5:assetImage6 = Respuestas[NumRandom[5]];break;
          case 6:assetImage7 = Respuestas[NumRandom[6]];break;
          case 7:assetImage8 = Respuestas[NumRandom[7]];break;
          case 8:assetImage9 = Respuestas[NumRandom[8]];break;
          case 9:assetImage10 = Respuestas[NumRandom[9]];break;
          case 10:assetImage11 = Respuestas[NumRandom[10]];break;
          case 11:assetImage12 = Respuestas[NumRandom[11]];break;
          case 12:assetImage13 = Respuestas[NumRandom[12]];break;
          case 13:assetImage14 = Respuestas[NumRandom[13]];break;
          case 14:assetImage15 = Respuestas[NumRandom[14]];break;
          case 15:assetImage16 = Respuestas[NumRandom[15]];break;
        }
      }

    });
  }

  void juego(id){
    setState(() {
      if (Estados[id]==1){
        extra = NumRandom[id];
        if (NumRandom[id]%2==1) {turno++;
        if(Num1==0){
          Num1 = ANumeros[id];impar = extra;
          if (turno==2) {res=impar-par;}
        }
        else{
          Num2 = ANumeros[id];
          res=impar-extra;
        }

        }else{turno++;
        if(Num2==0){
          Num2 = ANumeros[id];par = extra;
          if (turno==2) {res=impar-par;}
        }
        else{
          Num1=ANumeros[id];
          res=par-extra;
        }
        }

        void bFunc(N){
          switch(N){
            case 0:assetImage1 = AssetImage(memo);break;
            case 1:assetImage2 = AssetImage(memo);break;
            case 2:assetImage3 = AssetImage(memo);break;
            case 3:assetImage4 = AssetImage(memo);break;
            case 4:assetImage5 = AssetImage(memo);break;
            case 5:assetImage6 = AssetImage(memo);break;
            case 6:assetImage7 = AssetImage(memo);break;
            case 7:assetImage8 = AssetImage(memo);break;
            case 8:assetImage9 = AssetImage(memo);break;
            case 9:assetImage10 = AssetImage(memo);break;
            case 10:assetImage11 = AssetImage(memo);break;
            case 11:assetImage12 = AssetImage(memo);break;
            case 12:assetImage13 = AssetImage(memo);break;
            case 13:assetImage14 = AssetImage(memo);break;
            case 14:assetImage15 = AssetImage(memo);break;
            case 15:assetImage16 = AssetImage(memo);break;
          }
        }

        void aFunc(N){
          switch(N){
            case 0:assetImage1 = AssetImage(good);break;
            case 1:assetImage2 = AssetImage(good);break;
            case 2:assetImage3 = AssetImage(good);break;
            case 3:assetImage4 = AssetImage(good);break;
            case 4:assetImage5 = AssetImage(good);break;
            case 5:assetImage6 = AssetImage(good);break;
            case 6:assetImage7 = AssetImage(good);break;
            case 7:assetImage8 = AssetImage(good);break;
            case 8:assetImage9 = AssetImage(good);break;
            case 9:assetImage10 = AssetImage(good);break;
            case 10:assetImage11 = AssetImage(good);break;
            case 11:assetImage12 = AssetImage(good);break;
            case 12:assetImage13 = AssetImage(good);break;
            case 13:assetImage14 = AssetImage(good);break;
            case 14:assetImage15 = AssetImage(good);break;
            case 15:assetImage16 = AssetImage(good);break;
          }
        }

        if (turno==2 && (res==1)){
          aFunc(Num1);
          aFunc(Num2);
          pares++;
          Estados[Num2]=0;Estados[Num1]=0;
          par=0;impar=0;turno=0;Num1=0;Num2=0;
        }else{
          if (turno==2 && (Estados[id])==1) {
            bFunc(Num1);
            bFunc(Num2);
            par=0;impar=0;turno=0;Num1=0;Num2=0;
          }
        }
        if (pares==8) {
          _neverSatisfied();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage2(title: 'Memorama')),
          );
        }
      }
    });
  }
  void _neverSatisfied() async {
    return showDialog(
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Felicidades',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Tu has Ganado',
                  textAlign: TextAlign.center,),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK',
                textAlign: TextAlign.center,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage2(title: 'Memorama')),
                );
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(0);juego(0);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage1, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(1);juego(1);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage2, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(2);juego(2);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage3, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(3);juego(3);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage4, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                      ],),
                      Row(children: <Widget>[
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(4);juego(4);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage5, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(5);juego(5);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage6, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(6);juego(6);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage7, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(7);juego(7);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage8, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                      ],),
                      Row(children: <Widget>[
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(8);juego(8);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage9, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(9);juego(9);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage10),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(10);juego(10);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage11, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(11);juego(11);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage12, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                      ],),
                      Row(children: <Widget>[
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(12);juego(12);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage13, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(13);juego(13);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage14, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(14);juego(14);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage15, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                        Column(children: <Widget>[
                          GestureDetector(
                            onTap: () {im(15);juego(15);},
                            child: Container(
                              width: MediaQuery.of(context).size.width*ancho,
                              height: MediaQuery.of(context).size.height*alto,
                              color: Colors.cyan,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image(image: assetImage16, ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],),
                      ],),
                    ],),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.0, color: Colors.red),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text("Numero de pares \n $pares",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),),
                              ),
                            ],)
                        ],)
                    ],)
                ],)
            ],)
      ),

    );
  }
}

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {

  @override
  void initState(){

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    escenas.add(new Escenas(
        'Hola soy ron vivo en los bosques templados del Himalaya y soy un panda rojo. así es primo del panda. Como el me gusta comer bambú y además me encantan las frutas. Mmm… y mis favoritas las bellotas.',
        'assets/fondo2.jpg','Spersonaje','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Disfruto mucho salir y jugar con mis amigos, pero debo ser cuidadoso ya que Neit el cazador siempre está detrás de mí.',
        'assets/fondo2.jpg','Spersonaje','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
      'El malvado de Neit se llevo a toda mi familia uno a uno con sus trampas y yo he sido el único que ha logrado librarse de él. Pero realmente los extraño y necesito de tu ayuda para reunirme con ellos. ¿¿¿ACEPTAS???',
      'assets/fondo2.jpg','assets/neit.png','Ron','Sseleccion',
    ));
    escenas.add(new Escenas(
        'Lo primero que debemos hacer es ir por Nelly ella es una ardilla y mi mejor amiga compartimos muchas cosas en común sobre todo nuestro amor por las bellotas. '
            'Su  familia es la que vigila a Neit de seguro ella sabrá a donde ir.',
        'assets/fondo2.jpg','Spersonaje','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Hooooolaaa Nelly necesito de tu ayuda neit secuestro a mi familia y no sé a dónde ir',
        'assets/fondo3.jpg','Spersonaje','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        '¿Que? pero si Neit no se ha movido en todo el dia, ha estado sentado todo el día al lado del rio.',
        'assets/fondo3.jpg','assets/nelly.png','Nelly','Sseleccion'
    ));
    escenas.add(new Escenas(
        '¿Que? ¿En dónde? Entonces quien se llevó a mi familia, muéstrame en donde esta',
        'assets/fondo3.jpg','Spersonaje','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Bien Sígueme… Pero no recuerdo donde es….'
            'Me podrías ayudar a recordar..',
        'assets/fondo3.jpg','assets/nelly.png','Nelly','juego'
    ));
    escenas.add(new Escenas(
        '¿Que pero como ha pasado esto? ',
        'assets/fondo4.jpg','assets/nelly.png','Nelly','Sseleccion'
    ));
    escenas.add(new Escenas(
        'No lo se ¿Pero ahora que hare?',
        'assets/fondo4.jpg','assets/nelly.png','Nelly','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Pues podemos ir con tu primo o con spanky, '
            'Ayudanos a decidir',
        'assets/fondo4.jpg','assets/nelly.png','Nelly','Sseleccion'
    ));
    escenas.add(new Escenas(
        'OKAY… Vamos con sphanky te aseguro que el podrá  ayudarnos. Pero pero pero no se donde esta. Tu si lo sabes arma el memorama para averiguarlo',
        'assets/fondo4.jpg','assets/nelly.png','Nelly','juego'
    ));
    escenas.add(new Escenas(
        'El es Sphanky es un puerco spin o también lo llaman el gran Spin, por su sabiduría, también por que come mucho pero el no lo acepta.',
        'assets/fondo5.jpg','assets/sphanky.png','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Podre ser viejo pero te puedo escuchar. Pero dime a que has venido joven de color rojo que necesitas del GRAN SPIN.',
        'assets/fondo5.jpg','assets/sphanky.png','Sphanky','Sseleccion'
    ));
    escenas.add(new Escenas(
        'En el bosque se rumora que usted conoce donde vive Neit. Tambien dicen que cuando era joven usted logro escapar de el.',
        'assets/fondo5.jpg','assets/sphanky.png','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Si lo se cuando era joven el me capturo y  encerró en un jaula pero gracias a mi Spin-As me logre escapar',
        'assets/fondo5.jpg','assets/sphanky.png','Sphanky','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Si, ¿¿pero en donde vive??. Secuestro a mi familia y necesito rescatarla.',
        'assets/fondo5.jpg','assets/sphanky.png','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Tienes que ir al rio ahí encontraras un camino el cual no debes seguir. Por que llegaras  por su puerta principal. Y tiene muchas trampas puestas para los intrusos',
        'assets/fondo5.jpg','assets/sphanky.png','Sphanky','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Tienes que entrar por un agujero de conejo que cuida tu primo panda, solo animales dignos y que mida menos de 60 cm pueden entrar.',
        'assets/fondo5.jpg','assets/sphanky.png','Sphanky','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Buenoo… nos vamos tengo que rescatar a mi familia',
        'assets/fondo5.jpg','assets/sphanky.png','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Espera ten una se mis Spin-Ass. Te ayudara en el rescate, tu sabras cuando ocuparlaa.',
        'assets/fondo5.jpg','assets/sphanky.png','Sphanky','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Gracias ahora me dirigiré con mi primo.',
        'assets/fondo5.jpg','assets/spharky.png','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Nelly, ¿¿sabes como llegar??',
        'assets/fondo5.jpg','assets/nelly.png','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Claro solo nuestro amigo tiene que resolver esto.. Y llegaremos enseguida',
        'assets/fondo5.jpg','assets/nelly.png','Nelly','juego'
    ));
    escenas.add(new Escenas(
        'El es Panda mi primo, el esta en peligro de extinción, le gusta el bambu y rodar mucho Hola PRIIIIMO!!!!',
        'assets/fondo5.jpg','Spersonaje','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        '¿Que paso? ¡¡primo!! ¿Que andas haciendo por acá?',
        'assets/fondo5.jpg','assets/panda.png','Panda','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Ando en busca de Neit el cazador se llevo a mi familia y quería saber si conocías alguna entrada',
        'assets/fondo5.jpg','assets/panda.png','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Claro, esta aquí, solo ten cuidado cuando entres, podría tener trampas.',
        'assets/fondo5.jpg','assets/panda.png','Panda','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Si primo tendré cuidado',
        'assets/fondo5.jpg','assets/panda.png','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Mm con que aquí es….',
        'assets/fondo5.jpg','Spersonaje','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Familia como los saco de aquí.',
        'assets/fondo5.jpg','assets/familia.png','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Tienes que abrir la cerradura para eso tienes que picar el botón rojo.',
        'assets/fondo5.jpg','assets/familia.png','Familia','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Mmmm…',
        'assets/fondo5.jpg','assets/familia.png','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        '¿Podrías ayudarme a abrir la cerradura?',
        'assets/fondo5.jpg','Spersonaje','Ron','juego'
    ));
    escenas.add(new Escenas(
        'Gracias a ti me he podido reunir con mi familia. Sígueme para mas aventuras',
        'assets/fondo5.jpg','Spersonaje','Ron','Sseleccion'
    ));
    escenas.add(new Escenas(
        'Y si se preguntan por Nelly se quedo dormida en casa de panda.',
        'assets/fondo5.jpg','Spersonaje','Ron','Sseleccion'
    ));
    super.initState();
  }

  void im (){
    setState(() {
      if(escenas[_index].Eleccion=='Sseleccion'){
        _index++;
      }
    });
  }
  void im2 (){
    _index++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*1,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                escenas[_index].Fondo,
                fit: BoxFit.fill,
              ),
            ),
            IfImagen(),
            //Container(
            // child: FittedBox(
            // child: Container(
            //   child: ClipRRect(

            //child: Image.asset(
            //  escenas[_index].Render,
            //),
            //),
            //),
            //),
            // ),
            Column(
              children: <Widget>[
                IfEleccion(),
                //Container(
                //    height: MediaQuery.of(context).size.height*0.6,
                //  ),
                Container(
                  //width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.4,
                  //margin: const EdgeInsets.only(top: 35.0),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image(
                          image: AssetImage('assets/dialogo.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                            child: Image(
                              width: MediaQuery.of(context).size.width*0.24,
                              image: AssetImage('assets/ron.png'),
                            ),
                          ),
                          //Expanded(child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(bottom: 15.0, top: 35.0),
                                child: Text(escenas[_index].Npersonaje),
                              ),
                              GestureDetector(
                                onTap: (){
                                  im();
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.7,
                                  height: MediaQuery.of(context).size.height*0.2,
                                  //color: Colors.greenAccent,
                                  child:Stack(children: <Widget>[
                                    Positioned.fill(
                                      child: Text(escenas[_index].Dialogo
                                        //Text("Muajajaja dhjkfbhfkaaaaaaaaaajjjjjjjjj jjjjjjjjjjjjjjjjjjjjsaaaaaddddddddddddbhjjj jjjja h jkkk kasdbouisahs fahusahuosdhuosafhasfho"
                                      ),
                                    ),
                                  ]),
                                ),
                              ),

                            ],
                          ),
                          //),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IfImagen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Image image = Image.asset(escenas[_index].Render);
    if(escenas[_index].Render!='Spersonaje'){ return Container(child: image,);}
    else{return Container();}
  }
}

class IfEleccion extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Column col = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          color: Colors.green,
          textColor: Colors.white,
          padding: EdgeInsets.only(top: 25.0, left: 65.0,bottom: 25.0,right: 65.0),
          splashColor: Colors.lightGreen,
          onPressed: () {
            nosequesoy.shuffle(NumRandom);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: 'Memorama')),
            );
            _MyHomePageState2().im2();
          },
          child: Text(
            "Jugar",
            style: TextStyle(fontSize: 20.0),
          ),
        )
      ],
    );

    if(escenas[_index].Eleccion!='Sseleccion'){ return Container(height: MediaQuery.of(context).size.height*0.6,width: MediaQuery.of(context).size.width*0.7,child: col,);}
    else{return Container(height: MediaQuery.of(context).size.height*0.6);}
  }
}

class Inicio extends StatefulWidget {

  Inicio({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Inicioapp createState() => _Inicioapp();

}

class _Inicioapp extends State<FirstRoute>{

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/fondo1.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.greenAccent,
                    child: Text('Historia'),
                    onPressed: () {
                      nosequesoy.shuffle(NumRandom);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Memorama')),
                      );
                    },
                  ),
                  RaisedButton(
                    color: Colors.greenAccent,
                    child: Text('Creditos'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage2(title: 'Memorama')),
                      );
                    },
                  ),
                ],)
          ),
        ],
        )
    );
  }
}

class MyHomePage3 extends StatefulWidget {
  MyHomePage3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState3 createState() => _MyHomePageState3();
}

class _MyHomePageState3 extends State<MyHomePage3> {

  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    myController.dispose();
    super.dispose();
  }

  @override
  void dispose2() {
    // Limpia el controlador cuando el Widget se descarte
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(child: Image.asset("assets/image_02.png"))
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0, bottom: 200),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/logo.png",
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                      ),
                      Text("Animaliak",
                          style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: ScreenUtil.getInstance().setSp(46),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(90),
                  ),
                  Container(
                    width: double.infinity,
//      height: ScreenUtil.getInstance().setHeight(500),
                    padding: EdgeInsets.only(bottom: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Usuario",
                              style: TextStyle(
                                  fontFamily: "Poppins-Medium",
                                  fontSize: ScreenUtil.getInstance().setSp(26))),
                          TextField(
                            keyboardType: TextInputType.text,
                            controller: myController,
                            decoration: InputDecoration(
                                hintText: "Usuario",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(20),
                          ),
                          Text("Contrasena",
                              style: TextStyle(
                                  fontFamily: "Poppins-Medium",
                                  fontSize: ScreenUtil.getInstance().setSp(26))),
                          TextField(
                            keyboardType: TextInputType.text,
                            controller: myController2,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Contrasena",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        //boton sing
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330),
                          height: ScreenUtil.getInstance().setHeight(140),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF17ead9),
                                Color(0xFF6078ea)
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                var entro = bd.valida(myController.text, myController2.text);
                                  if(entro==2){
                                    nosequesoy.shuffle(NumRandom);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyHomePage2(title: 'Memorama')),
                                    );
                                  }
                              },
                              child: Center(
                                child: Text("Entrar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        //boton sing
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330),
                          height: ScreenUtil.getInstance().setHeight(140),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF17ead9),
                                Color(0xFF6078ea)
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                nosequesoy.shuffle(NumRandom);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyHomePage4(title: 'Memorama')),
                                );
                              },
                              child: Center(
                                child: Text("Registrar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyHomePage4 extends StatefulWidget {
  MyHomePage4({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState4 createState() => _MyHomePageState4();
}

class _MyHomePageState4 extends State<MyHomePage4> {


  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    myController.dispose();
    super.dispose();
  }

  @override
  void dispose2() {
    // Limpia el controlador cuando el Widget se descarte
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset : false,

        body:Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.asset("assets/image_01.png"),
                ),
                Expanded(
                  child: Container(),
                ),
                Expanded(child: Image.asset("assets/image_02.png"))
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0,bottom: 200.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
//      height: ScreenUtil.getInstance().setHeight(500),
                      padding: EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 15.0),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, -10.0),
                                blurRadius: 10.0),
                          ]),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Usuario",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    fontSize: ScreenUtil.getInstance().setSp(26))),
                            TextField(
                              controller: myController,
                              decoration: InputDecoration(
                                  hintText: "Usuario",
                                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20),
                            ),
                            Text("Contrasena",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    fontSize: ScreenUtil.getInstance().setSp(26))),
                            TextField(
                              controller: myController2,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Contrasena",
                                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          //boton sing
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(330),
                            height: ScreenUtil.getInstance().setHeight(140),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF17ead9),
                                  Color(0xFF6078ea)
                                ]),
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF6078ea).withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  nosequesoy.shuffle(NumRandom);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyHomePage3(title: 'Memorama')),
                                  );
                                },
                                child: Center(
                                  child: Text("Regresar",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0)
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          //boton sing
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(330),
                            height: ScreenUtil.getInstance().setHeight(140),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF17ead9),
                                  Color(0xFF6078ea)
                                ]),
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF6078ea).withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  nosequesoy.shuffle(NumRandom);
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyHomePage3(title: 'Memorama')),
                                );
                                  bd.cargarDatos(myController.text, myController2.text);
                                },
                                child: Center(
                                  child: Text("Unirse",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0)
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}