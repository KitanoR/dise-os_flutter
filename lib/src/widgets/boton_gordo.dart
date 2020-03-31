import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BotonGordo({
    this.icon = FontAwesomeIcons.carCrash, 
    this.texto = "Motor Accident", 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey, 
    @required this.onPress
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: <Widget>[
          _BotonGordoBackground(icon, color1, color2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  texto,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white
              ),
              SizedBox(width: 40,),

            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icono;
  final Color color1;
  final Color color2;

  _BotonGordoBackground(this.icono, this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
           children: <Widget>[
             Positioned(
               right: -20,
               top: -20,
               child: FaIcon(
                 icono,
                 size: 150,
                 color: Colors.white.withOpacity(0.2),
               ),
             )
           ],
        ),
      ),


      margin: EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4,6),
            blurRadius: 10
          ),
          
        ],
        gradient: LinearGradient(
          colors: <Color> [
            color1,
            color2,
          ]
        )

      ),
    );
  }
}