import 'dart:collection';

import 'package:flutter/material.dart';


class DetalheItem extends StatelessWidget{
  var _id;
  var _img;
  var _title;
  var _date;
  var _description;
  var _qntItem = 0;

  DetalheItem(this._id, this._img,this._title,this._date,this._description);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text(this._title),
          backgroundColor: Colors.grey,
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.pop(context, false)),
        ),
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Material(
          elevation: 4.0,
          borderRadius: new BorderRadius.circular(6.0),
          child: new ListView(
            children: <Widget>[
            _getImageNetwork(_img),
            _getBody(_title,_date,_description),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              
              children: <Widget>[
              
            IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => print('decrementa')
           ),
            Text('$_id'),
            IconButton(
            icon: Icon(Icons.add),
            onPressed: () => print('incrementa'),
			
           ),
           Text(' '),
           RaisedButton(
             color: Colors.green,
             child: Text('Atualizar'),
             onPressed: (){
              print('atualiza item');
             /*
             PUT DO ITEM
             */
             },
           ),
           RaisedButton(
             color: Colors.red,
             child: Text('Remove'),
             onPressed: (){
               print('remove item');
               return Confirmacao();
             },
           )
              ],)
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImageNetwork(url){

    return new Container(
          height: 200.0,
          child: new Image.network(
            url,
            fit: BoxFit.cover)
        );

  }

  Widget _getBody(tittle,date,description){

    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getTittle(tittle),
          _getDate(_date),
          _getDescription(description),
        ],
      ),
    );
  }

  _getTittle(tittle) {
    return new Text(tittle,
    style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0),
    );
  }

  _getDate(date) {

    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Text(date,
            style: new TextStyle(
                fontSize: 10.0,
                color: Colors.grey
            ),
          )
    );
  }

  _getDescription(description) {
    return new Container(
      margin: new  EdgeInsets.only(top: 20.0),
      child: new Text(description),
    );
  }
}

class Confirmacao extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Material(
          elevation: 10.0,
          borderRadius: new BorderRadius.circular(6.0),
          child: new ListView(
            children: <Widget>[
            Text('Certeza que deseja remover o Item?'),
            RaisedButton(
             color: Colors.blue,
             child: Text('Cancela'),
             onPressed: (){
              print('cancelar item');
              Navigator.pop(context,false);
              
             },
           ),
           RaisedButton(
             color: Colors.red,
             child: Text('Remove'),
             onPressed: (){
               print('remove item');

               Navigator.pop(context,false);
             },
           )
            
          ])));

  }

  
    
}