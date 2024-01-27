
import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(color: Colors.blueGrey, width: 150, height: 150),
              Container(color: Colors.grey, width: 100, height: 100)
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(color: Colors.blueGrey, width: 150, height: 150),
              Container(color: Colors.grey, width: 100, height: 100)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(color: Colors.green, width: 100, height: 100),
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.cyan, width: 100, height: 100),
            ],
          ),
          Container(
            color: Colors.amber,
            height: 30,
            width: 30000,
            child: Text('Pedido',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print('NOVO TESTE');
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
