import 'package:flutter/material.dart';
import 'package:myapp/insert.dart';
import 'package:myapp/lista.dart';


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
       body: NoticeList()
    );
  }
}

