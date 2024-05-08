import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';
 
void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    const title = "Informações do Cliente";
    return MaterialApp(
        title: title,
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
              title: const Text(title),
            ),
            body: GridView.count(
                crossAxisCount: 1,
                children: List.generate(opcoes.length, (index) {
                  return Center(
                    child: OpcaoCard(opcao: opcoes[index]),
                  );
                }))));
  }
}
 
 
class OpcaoCard extends StatelessWidget {

  String pessoa = "Felipe Reis"; 
  
  var randomNames = RandomNames();

   OpcaoCard({Key? key, required this.opcao}) : super(key: key);
  final Opcao opcao;

    final List dummyList = List.generate(
      21,
      (index) => {
            "id": "$index",
            "title": "",
            "endereco": "Endereço da Pessoa $index",
            "telefone": "Telefone da Pessoa $index"
    });
 
  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.displaySmall;
 
    return Card(
        color: Color.fromARGB(255, 46, 46, 46),  
        child: Center(
          
            child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: ((context, index) => Card(
            elevation: 2,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              
              leading: CircleAvatar(
              backgroundColor: Colors.green,
                child: Text(dummyList[index]["id"].toString()),
              ),
              title: Text("Nome: " + randomNames.fullName()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Endereço Rua" + randomNames.fullName()),
                  Text("Telefone:"), 
                ],
              ),
              trailing: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.edit),
                  Icon(Icons.delete),
                ],
              ),
            ),
          )),
        )
            
            ));

  }
}
 
class Opcao {
  const Opcao({required this.titulo, required this.icon});
 
  final String titulo;
  final IconData icon;
}
 
const List<Opcao> opcoes = <Opcao>[
  Opcao(titulo: 'Carro', icon: Icons.directions_car),

];