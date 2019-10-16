import 'package:flutter/material.dart';
import 'package:myapp/item.dart';
import 'package:myapp/itensApi/itensApi.dart';


class EstoqueList extends StatefulWidget{

  final state = new _NoticeListPageState();

  @override
  _NoticeListPageState createState() => state;

}

class _NoticeListPageState extends State<EstoqueList>{
  List _categorys = new List();
  List _categorysAPI = new List();
  var _category_selected = 0;

  List _news = new List();
  var repository = new ItensApi();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            _getListCategory(),
            new Expanded(
              child: _getListViewWidget(),
            )
          ],
        ),
      ),
    );

  }

  @override
  void initState() {
    setCategorys();
    loadNotices();

  }
  Widget _getListCategory(){

    ListView listCategory = new ListView.builder(
        itemCount: _categorys.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return _buildCategoryItem(index);
        }
    );

    return new Container(
      height: 55.0,
      child: listCategory,
    );

  }
  
  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
   
 }
  void setCategorys() {

    _categorysAPI.add("geral");
    _categorysAPI.add("celular");
    _categorysAPI.add("eletrodomestico");
    _categorysAPI.add("tv");
    _categorysAPI.add("videogame");

    _categorys.add("Geral");
    _categorys.add("Celular");
    _categorys.add("Eletrodomestico");
    _categorys.add("Tv");
    _categorys.add("Videogame");

  }
  

  Widget _buildCategoryItem(index){

    return new GestureDetector(
      onTap: (){
        onTabCategory(index);
      },
      child: new Center(
        child: new Container(
          margin: new EdgeInsets.only(left: 10.0),
          child: new Material(
            elevation: 2.0,
            borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
            child:  new Container(
              padding: new EdgeInsets.only(left: 12.0,top: 7.0,bottom: 7.0,right: 12.0),
              color: _category_selected == index ? Colors.grey[800]:Colors.grey[500],
              child: new Text(_categorys[index],
                style: new TextStyle(
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

  }

  onTabCategory(index){
    setState(() {
      _category_selected = index;
    });
    loadNotices();

    //Realiza chamada de serviço para atualizar as noticias de acordo com a categoria selecionada

  }

  Widget _getListViewWidget(){

    var list = new ListView.builder(
        itemCount: _news.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index){
          return _news[index];
        }
    );

    return list;
  }

  loadNotices() async{

    List result = await repository.loadItens();
    _news.clear();
    setState(() {

      result.forEach((item) {
        if(item['category'] == _categorysAPI[_category_selected] || _categorys[_category_selected] == "Geral"){
        var notice = new Item(
          item['id'],
          item['url_img'],
          item['tittle'],
          item['date'],
          item['description'],
          item['id']
          
        );
        _news.add(notice);
        }
      });

    });

  }

}
