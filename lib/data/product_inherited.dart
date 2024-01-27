import 'package:flutter/material.dart';
import 'package:untitled1/components/products_screen.dart';

class ProductInherited extends InheritedWidget {
  ProductInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Prod> productList = [
    Prod('REQUEIJAO CULINARIO CHEDDAR BIS 400 GR',
      'assets/images/tirol.png', 8.7,),
    Prod('NATA PT 300 GR',
        'assets/images/tirol.png', 4.42),
    Prod('LEITE UHT INTEGRAL 1 L',
        'assets/images/tirol.png', 2.78),
    Prod('IOGURTE BICAMADAS DE MORANGO PT 130 GR',
        'assets/images/icon.png', 1.18),
    Prod('LEITE EM PÓ INTEGRAL 400 G SC 10 KG',
        'assets/images/tirol.png', 6.8),
    Prod('BEBIDA LACTEA COCO GAR 830 GR',
        'assets/images/icon.png', 3.75),
    Prod('MISTURA LÁCTEA CONDENSADA 395G',
        'assets/images/tirol.png', 1.05),
    Prod('DOCE DE SORO DE LEITE CREMOR PT300GR',
        'assets/images/icon.png', 1.61),
    Prod('QUEIJO MUSSARELA SEM LACTO FAT ATM 150GR',
        'assets/images/tirol.png', 4.99),
    Prod('CREME DE LEITE UHT 15% 1,010KG CREMOR',
        'assets/images/tirol.png', 4.75),
  ];

  void newProd (String name, String image, double price){
    productList.add(Prod(name,image,price));
  }

  static ProductInherited of(BuildContext context) {
    final ProductInherited? result = context.dependOnInheritedWidgetOfExactType<ProductInherited>();
    assert(result != null, 'No ProductInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductInherited oldWidget) {
    return oldWidget.productList.length != productList.length;
  }
}
