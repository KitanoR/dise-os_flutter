import 'package:flutter/material.dart';


class SliverPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(bottom: -10, right: 0, child: _BotonNewList())
        ],
      )
   );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 70,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        color: Color(0xFFED6762),
        onPressed: (){},
        child: Text(
          'Create new list',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            child: Container(
              alignment: Alignment.centerLeft,
              child: _Titulo(),
              color: Colors.white,
            ),
            minHeight: 170,
            maxHeight: 200
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100,)
          ]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minHeight, 
    @required this.maxHeight, 
    @required this.child
  });  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(child: child,);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => (minHeight > maxHeight) ? minHeight: maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxHeight != oldDelegate.maxHeight ||
           minHeight != oldDelegate.minHeight ||
           child != oldDelegate.child;
  }

}


class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text('New', style: TextStyle(color: Color(0xFF532128), fontSize: 50),),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100,),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: Color(0xFFF7CDD5),
              ),
            ),
            Container(
              child: Text('List', style: TextStyle(color: Color(0xFFD93A30), fontSize: 50, fontWeight: FontWeight.bold),),
            ),
            
            
          ],
        )
      ],
    );
  }
}

class _ListaTarea extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
      final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  _ListItem(this.titulo, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Text(titulo, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}