import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Prod extends StatefulWidget {
  final String name;
  final String image;
  final double priceInicial;

  const Prod(this.name, this.image, this.priceInicial, {Key? key}) : super(key: key);

  @override
  State<Prod> createState() => _ProdState();
}

class _ProdState extends State<Prod> {
  int qtdItem = 0;
  double price = 0.0;
  double priceTotal = 0.0;

  @override
  void initState() {
    super.initState();
    price = widget.priceInicial;
  }

  void _atualizarPriceTotal() {
    setState(() {
      priceTotal = price * qtdItem;
    });
    final precoTotalFormatado =
    NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(priceTotal);
    print("Quantidade: $qtdItem, Preço Total: $precoTotalFormatado");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),

      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue.shade800,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.white,
                ),
                height: 100,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: ClipRRect(
                          child: Image.asset(
                            widget.image,
                            height: 35.0,
                            width: 127,
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 15, overflow: TextOverflow.fade),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)
                                    )
                                ),
                                onPressed: () {
                                  setState(() {
                                    qtdItem++;
                                    priceTotal = price*qtdItem;
                                  });
                                  _atualizarPriceTotal();
                                },
                                child: Icon(Icons.add,size: 24, color: Colors.blue[900],)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)
                                    )
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (qtdItem > 0) {
                                      qtdItem--;
                                      priceTotal = price * qtdItem;
                                    }
                                  });
                                  _atualizarPriceTotal();
                                },
                                child: Icon(Icons.remove,size: 24, color: Colors.blue[900],)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        child: LinearProgressIndicator(
                          color: Colors.red.shade900,
                          value: qtdItem <= 12
                              ? qtdItem / 12
                              : qtdItem <= 24
                              ? (qtdItem - 12) / (24 - 12)
                              : qtdItem <= 48
                              ? (qtdItem - 24) / (48 - 24)
                              : (qtdItem - 48) / (100 - 48),
                        ),
                        width: 170,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        child: Text(
                          //'Preço: $precoTotal',
                          'Preço: ${priceTotal.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        'Qtde: $qtdItem',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}