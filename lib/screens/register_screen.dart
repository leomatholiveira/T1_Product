import 'package:flutter/material.dart';
import 'package:untitled1/components/products_screen.dart';
import 'package:untitled1/data/prod_dao.dart';
import 'package:untitled1/data/product_inherited.dart';
import 'package:untitled1/screens/initial_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, required this.ProdContext});

  final BuildContext ProdContext;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  String selectedImage = '';
  FocusNode nameFocus = FocusNode();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool priceValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        double.parse(value.replaceAll(',', '.')) <= 0.0) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    nameFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_circle_left_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InitialScreen();
                    },
                  ),
                );
              },
            );
          },
        ),
        backgroundColor: Colors.blue.shade800,
        title: const Text(
          'Cadastrar Produto',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 4,
                  color: Colors.blue.shade800,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome do Produto';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Descrição do Produto',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (priceValidator(value)) {
                          return 'Insira o valor do Produto';
                        }
                        return null;
                      },
                      focusNode: nameFocus,
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Preço do Produto',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Imagem do Produto',
                      style:
                      TextStyle(fontSize: 18, color: Colors.blue.shade900),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Radio(
                          value: 'assets/images/tirol.png',
                          groupValue: selectedImage,
                          onChanged: (value) {
                            setState(() {
                              selectedImage = value.toString();
                            });
                          },
                        ),
                        Container(
                          height: 100,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 2,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset('assets/images/tirol.png'),
                          ),
                        ),
                        Radio(
                          value: 'assets/images/icon.png',
                          groupValue: selectedImage,
                          onChanged: (value) {
                            setState(() {
                              selectedImage = value.toString();
                            });
                          },
                        ),
                        Container(
                          height: 100,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 2,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset('assets/images/icon.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Botão Cadastrar pressionado');
                      if (_formKey.currentState?.validate() ?? false) {
                        print('Formulário válido');

                        if (selectedImage.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Selecione uma imagem do produto'),
                            ),
                          );
                        } else {
                          double price = double.parse(priceController.text.replaceAll(",", "."));

                          // ProdDao para salvar o produto
                          ProdDao().save(
                            Prod(
                              nameController.text,
                              selectedImage,
                              price,
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Criando novo Produto'),
                            ),
                          );
                          Navigator.pop(context, false);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text('Cadastrar', style: TextStyle(color: Colors.blue.shade800)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
