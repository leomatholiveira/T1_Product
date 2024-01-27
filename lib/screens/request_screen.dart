
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

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
              ),
              onPressed: () => Navigator.pop(context, false),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon.png',
              height: 35.0,
            ),
            const Text(
              'Pedido',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.file_download_done,
              color: Colors.white,
            ),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}



