import 'package:flutter/material.dart';
import 'package:myapp/detalhe.dart';

class Item extends StatelessWidget{
  var _id;
  var _img;
  var _title;
  var _date;
  var _description;
  var _qntItem ;

  Item(this._id, this._img,this._title,this._date,this._description, this._qntItem);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    //Foi adicionado dentro de Container para adicionar margem no item
    return new Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0,bottom: 10.0,top: 0.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: new InkWell(
            onTap: showDetail,
            splashColor: Colors.blue,
            child: _getListTile(),
          ),
      ),
    );
  }
  showDetail() {
    Navigator
    .of(_context)
    .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new DetalheItem(_id,_img, _title, _date, _description);
    }));
  }
  Widget _getListTile(){

    // Foi adicionado dentro de Container para adicionar altura fixa.
    return new Material(
      color: _getColor(int.parse(_qntItem)),
      borderRadius: new BorderRadius.circular(6.0),
      elevation: 2.0,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: <Widget>[
          
          new FadeInImage.assetNetwork(placeholder: '', image: _img,fit: BoxFit.cover,width: 85.0,height: 85.0),
          _getColumText(_title,_date,_description, _qntItem),
      ],

    ),
    );

  }

  Widget _getColumText(tittle,date, description, _qntItem){

    return new Expanded(
        child: new Container(
          margin: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              _getTitleWidget(_title),
              _getDateWidget(_date),
              _getDescriptionWidget(_description),
              _getQntEstoqueWidget(_qntItem)],
          ),
          
        )
        
    );
  }

  _getColor(int qnt){
    if(qnt <= 10 && qnt > 0){   return Colors.yellow[200];}
    if(qnt == 0){   return Colors.red[200];}
    return Colors.white;
  }

  Widget _getTitleWidget(String curencyName){
    return new Text(
      curencyName,
      maxLines: 1,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _getDescriptionWidget(String description){
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Text(description,maxLines: 2,),
    );
  }

  Widget _getDateWidget(String date){
    return new Text(date,
      style: new TextStyle(color: Colors.grey,fontSize: 10.0),);
  }

   Widget _getQntEstoqueWidget(String qntItem){
    return new Text("Quantidade em estoque: " + qntItem);
  }


}