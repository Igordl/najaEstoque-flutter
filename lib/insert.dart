import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/home.dart';
import 'package:myapp/main.dart';



class Insert extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Inserindo Item';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Insere item'),
          backgroundColor: Colors.grey,
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.pop(context, false)),
        ),
        body:MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  TextEditingController nomeController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  List _categorias =
  ["Categorias", "Celular", "Eletrodoméstico", "Tvs", "Videogame"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCategoria;

  getCurrentCategoria(){
    return this._currentCategoria;
  }
  
  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCategoria = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String categoria in _categorias) {
      items.add(new DropdownMenuItem(
          value: categoria,
          child: new Text(categoria)
      ));
    }
    return items;
  }

  void changedDropDownItem(String selectedCategoria) {
    setState(() {
      _currentCategoria = selectedCategoria;
    });
  }

  @override
  Widget build(BuildContext context) {
   
   return SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Nome do Item",
                ),
                
                
                controller: nomeController,
                validator: (nomeItem) {
                  if (nomeItem.isEmpty) {
                    return "Insira o Nome do Item!";
                  }
                },
              ), //
              Container(
              child: new Column(
                children: <Widget>[
                  new DropdownButton(
                  value: _currentCategoria,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                  )
                  ],
                )
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Valor do Item"),
                
                controller: valorController,
                validator: (valorItem) {
                  if (valorItem.isEmpty) {
                    return "Insira o Valor do Item!";
                  } else if (double.parse(valorItem) <= 0) {
                    return "Insira um Valor Valido!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Quantidade do Item",),
                
                controller: quantidadeController,
                validator: (quantidadeItem) {
                  if (quantidadeItem.isEmpty) {
                    return "Insira o Quantidade do Item!";
                  } else if (double.parse(quantidadeItem) <= 0 || double.parse(quantidadeItem)%1.0 == 0 ) {
                    return "Insira uma Quantidade Valido!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Link para Imagem do Item",),
                
                controller: imageController,
                validator: (imageItem) {
                  if (imageItem.isEmpty) {
                    return "Insira a Imagem do Item!";
                  }
                },
              ),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                
                if (_currentCategoria == 'Categorias') {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Selecione uma categoria válida')));
                  
                } else {
                
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.

                  _cadastraItem(nomeController,valorController,quantidadeController,imageController, _currentCategoria);
                                    Scaffold.of(context)
                                        .showSnackBar(SnackBar(content: Text('Item adicionado com sucesso')));
                                        
                                        
                                   // Scaffold.of(context)
                                     //   .showSnackBar(SnackBar(content: Text('Adicionando item ao estoque')));
                                  }}
                                },
                                child: Text('Adicionar'),
                              ),),
                            ]),
                              ],
                            ),
                          ),
                        );
                      
                    }
                    _resetFields() {
                      nomeController.text = "";
                      valorController.text = "";
                      imageController.text = "";
                      quantidadeController.text = "";
                      setState(() {
                        
                        _formKey = GlobalKey<FormState>();
                      });
                    }
                  
                    _cadastraItem(TextEditingController nomeController, 
                    TextEditingController valorController,
                    TextEditingController quantidadeController, 
                    TextEditingController imageController, 
                    String currentCategoria) {
                      /*
                        POST PARA INSERÇÃO DE ITEM

                      */
                    }
}
