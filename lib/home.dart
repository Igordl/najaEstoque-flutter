import 'package:flutter/material.dart';
import 'package:myapp/insert.dart';


class Home extends StatelessWidget {
  final appTitle = 'Naja Estoque';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
		debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);
  Insert _insert = new Insert();
  String _categoria = 'todas';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
	
      appBar: AppBar(title: Text(title),
      backgroundColor: Colors.grey,
      actions: <Widget>[
			   IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(context, MaterialPageRoute( builder: (context) => _insert)),
			
           )
		   ],),
           
      
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Categorias'),
			  padding: EdgeInsets.symmetric(),
              decoration: BoxDecoration(
                color: Colors.grey
				
              ),
            ),
            ListTile(
              title: Text('Celular'),
              
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                this._categoria = 'celular';
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Eletrodoméstico'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                this._categoria = 'eletrodomestico';
                Navigator.pop(context);
              },
            ),
			ListTile(
              title: Text('Tv'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                this._categoria = 'tv';
                Navigator.pop(context);
              },
            ),
			ListTile(
              title: Text('Videogame'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                this._categoria = 'videogame';
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
       body: new Material(
         borderRadius: new BorderRadius.circular(6.0),
         elevation: 2.0,
         child: new Row(
           crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Adicionamos aqui FadeInImage que é uma variande do widget Image. Ela nos possibilita carregar image de uma URL
          new Container (
            width: 95.0,
            child: Image.network('http://startupsdobrasil.com.br/wp-content/uploads/2017/09/desenvolvimento-de-um-produto-380x249.png'),
          ),
          
          new Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              new Text('Produto'),
              new Text('200 em estoque')],
          )
        ],
         )
       ),
    );
  }
}

