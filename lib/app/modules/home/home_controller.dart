import 'package:delivery/app/app_controller.dart';
import 'package:delivery/app/models/category_model.dart';
import 'package:delivery/app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  final AppController app;
  _HomeControllerBase(this.app);

  List<Category> categories = List.from(_categoryData.map((json) => Category.fromJson(json)));

  @observable
  List<Product> products = List.from(_productsData.map((json) => Product.fromJson(json)));

  @action
  void likeProduct(int index) {
    this.products[index].liked = !this.products[index].liked;
    this.products = this.products;
  }

}

final List<Map<String, dynamic>> _categoryData = [
  {
    'image': 'assets/img/tacos.svg',
    'name': 'Tacos',
    'color': Color.fromRGBO(233, 243, 212, 1)
  },
  {
    'image': 'assets/img/frias.svg',
    'name': 'Frias',
    'color': Color.fromRGBO(198, 242, 232, 1)
  },
  {
    'image': 'assets/img/burguer.svg',
    'name': 'Burger',
    'color': Color.fromRGBO(255, 239, 205, 1)
  },
  {
    'image': 'assets/img/pizza.svg',
    'name': 'Pizza',
    'color': Color.fromRGBO(255, 216, 216, 1)
  },
  {
    'image': 'assets/img/burritos.svg',
    'name': 'Burritos',
    'color': Color.fromRGBO(231, 215, 237, 1)
  },
];

final List<Map<String, dynamic>> _productsData = [
  {
    'image': 'assets/img/pizza.png',
    'headerImage': 'assets/img/tacos.svg',
    'name': 'Pizza Clásica',
    'subName': 'Salsa clásica de la casa',
    'description':
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur',
    'price': 12.58,
  },
  {
    'image': 'assets/img/burguer.png',
    'headerImage': 'assets/img/tacos.svg',
    'name': 'Hamburguesa mix',
    'subName': 'Doble carne con queso',
    'description':
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur',
    'price': 12.58,
  },
  {
    'image': 'assets/img/pizza.png',
    'headerImage': 'assets/img/tacos.svg',
    'name': 'Pizza Clásica',
    'subName': 'Salsa clásica de la casa',
    'description':
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur',
    'price': 12.58,
  },
  {
    'image': 'assets/img/burguer.png',
    'headerImage': 'assets/img/tacos.svg',
    'name': 'Hamburguesa mix',
    'subName': 'Doble carne con queso',
    'description':
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur',
    'price': 12.58,
  }
];
