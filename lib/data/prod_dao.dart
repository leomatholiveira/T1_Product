import 'package:sqflite/sqlite_api.dart';
import 'package:untitled1/components/products_screen.dart';
import 'package:untitled1/data/database.dart';

// CRUD

class ProdDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_price REAL, '
      '$_image TEXT)';

  static const String _tablename = 'prodTable';
  static const String _name = 'nome';
  static const String _price = 'price';
  static const String _image = 'image';

  save(Prod Produto) async {
    print('Inciando o Save');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(Produto.name);
    Map<String, dynamic> prodMap = toMap(Produto);
    if (itemExists.isEmpty) {
      print('O produto não existe');
      return await bancoDeDados.insert(_tablename, prodMap);
    } else {
      print('A produto já existe');
      return await bancoDeDados.update(
        _tablename,
        prodMap,
        where: '$_name = ?',
        whereArgs: [Produto.name],
      );
    }
  }

  Map<String, dynamic> toMap(Prod Produto) {
    print('convertento prdouto em Map');
    final Map<String, dynamic> mapaDeProdutos = {}; //map
    mapaDeProdutos[_name] = Produto.name;
    mapaDeProdutos[_price] = Produto.priceInicial;
    mapaDeProdutos[_image] = Produto.image;
    print('Mapa de Produtos: $mapaDeProdutos');
    return mapaDeProdutos;
  }

  Future<List<Prod>> findAll() async {
    print('Acessando o findAll:');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
    await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados ... Encontrado : $result');
    return toList(result);
  }

  List<Prod> toList(List<Map<String, dynamic>> mapaDeProdutos) {
    print('Estamos convertendo to List:');
    final List<Prod> produtos = [];
    for (Map<String, dynamic> linha in mapaDeProdutos) {
      final Prod Produto = Prod(linha[_name], linha[_image], linha[_price]);
      produtos.add(Produto);
    }
    print('Lista de Produtos $produtos');
    return produtos;
  }

  Future<List<Prod>> find(String nomeDoProduto) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDoProduto]);
    print('Produto Encontrado: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDoProduto) async {
    print('Deletando um Produto: $nomeDoProduto');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDoProduto],
    );
  }
}
