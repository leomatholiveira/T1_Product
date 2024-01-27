import 'package:flutter/material.dart';
import 'package:untitled1/components/products_screen.dart';
import 'package:untitled1/data/prod_dao.dart';
import 'package:untitled1/data/product_inherited.dart';
import 'package:untitled1/screens/register_screen.dart';
import 'package:untitled1/screens/request_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () => Navigator.pop(context, false),
              );
            },
          ),
          //actions:
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon.png',
                height: 35.0,
              ),
              const Text(
                'Produtos',
                style: TextStyle(color: Colors.white, fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const RequestScreen();
                  }),
                );
              },
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Prod>>(
            future: ProdDao().findAll(),
            builder: (context, snapshot) {
              List<Prod>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: [CircularProgressIndicator(), Text('Carregando')],
                    ),);
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: [CircularProgressIndicator(), Text('Carregando')],
                    ),);
                  break;
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: [CircularProgressIndicator(), Text('Carregando')],
                    ),);
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            final Prod produto = items[index];
                            return produto;
                          });
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            'Não há nenhum Produto',
                            style: TextStyle(fontSize: 32),
                          )
                        ],
                      ),
                    );
                  }
                  return Text(' Erro ao carregar Produtos ');
                  break;
              }
              return Text(' Erro desconhecido ');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => RegisterScreen(ProdContext: context),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: Colors.blue.shade800,
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
