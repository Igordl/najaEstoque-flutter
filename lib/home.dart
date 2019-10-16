import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/insert.dart';
import 'package:myapp/estoqueLista.dart';


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
          
      
       body: EstoqueList()
    );
    
  }
}

