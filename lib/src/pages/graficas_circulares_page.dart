import 'package:disenios/src/theme/theme.dart';
import 'package:disenios/src/widgets/headers.dart';
import 'package:disenios/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage>  {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        },
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: HeaderCurva(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomRadiaProgress(porcentaje: porcentaje, color: Colors.red,),
                    CustomRadiaProgress(porcentaje: porcentaje, color: Colors.amber)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomRadiaProgress(porcentaje: porcentaje, color: Colors.blue,),
                    CustomRadiaProgress(porcentaje: porcentaje, color: Colors.orange)
                  ],
                )
              ],
            ),
            Center(
              child: Text(
                '$porcentaje %',
                style: TextStyle(fontSize: 40, color: Colors.grey),
              ),
            )
          ],
        ),
      )
    );
  }
}

class CustomRadiaProgress extends StatelessWidget {
  final double porcentaje;
  final Color color;
  const CustomRadiaProgress({
    Key key,
    @required this.porcentaje, 
    @required this.color,
    
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 150,
      height: 150,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: appTheme.textTheme.body1.color,
        grosorSecundario: 4,
        grosorPrimario: 10,
      ),
    );
  }
}