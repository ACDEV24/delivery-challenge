import 'package:delivery/app/models/category_model.dart';
import 'package:delivery/app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ListView(
      children: [
        _AppBarWidget(controller),
        _CategoriesWidget(controller),
        _PopularProductsWidget(controller)
      ],
    ),
  );
}

class _AppBarWidget extends StatelessWidget {

  final HomeController controller;
  const _AppBarWidget(this.controller);

  @override
  SafeArea build(BuildContext context) => SafeArea(
    child: Container(
      padding: const EdgeInsets.all(15.0),
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.black12,
            spreadRadius: 1
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TextFieldWidget(controller),
          _ActionsIconsWidget(controller)
        ],
      ),
    ),
  );
}

class _TextFieldWidget extends StatelessWidget {

  final HomeController controller;
  const _TextFieldWidget(this.controller);

  @override
  Row build(BuildContext context) => Row(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.50)
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 9.0,
                bottom: 9.0
              ),
              child: SvgPicture.asset(
                'assets/img/search.svg',
                width: 18.0,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.26,
              height: MediaQuery.of(context).size.height * 0.044,
              padding: EdgeInsets.only(bottom: 6.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  hintStyle: TextStyle(
                    fontSize: 12.0
                  ),
                  border: InputBorder.none
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.07,
      ),
      Text(
        'Inicio',
        style: TextStyle(
          color: controller.app.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
    ],
  );
}

class _ActionsIconsWidget extends StatelessWidget {

  final HomeController controller;
  const _ActionsIconsWidget(this.controller);

  @override
  Row build(BuildContext context) => Row(
    children: [
      SvgPicture.asset(
        'assets/img/notification.svg',
        width: 19.0,
      ),
      SizedBox(width: 15.0),
      SvgPicture.asset(
        'assets/img/offer.svg',
        width: 19.0,
      ),
    ],
  );
}

class _CategoriesWidget extends StatelessWidget {

  final HomeController controller;
  const _CategoriesWidget(this.controller);

  @override
  Widget build(BuildContext context) => Container(
    height: 210.0,
    child: Column(
      children: [
        SizedBox(height: 20.0),
        ListTile(
          leading: Text(
            'Explorar categorias',
            style: TextStyle(
              color: controller.app.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.0
            ),
          ),
          trailing: Text(
            'Ver todos',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0
            ),
          ),
          onTap: () {},
        ),
        _ListCategoriesWidget(controller)
      ],
    ),
  );
}

class _ListCategoriesWidget extends StatelessWidget {

  final HomeController controller;
  const _ListCategoriesWidget(this.controller);

  @override
  Widget build(BuildContext context) => Container(
    height: 120.0,
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: controller.categories.length,
      itemBuilder: (_, i) => _CategoriesItem(
        controller,
        controller.categories[i]
      ),
    ),
  );
}

class _CategoriesItem extends StatelessWidget {

  final HomeController controller;
  final Category category;

  const _CategoriesItem(
    this.controller,
    this.category
  );

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        height: 75.0,
        width: 80.0,
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0
        ),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: SvgPicture.asset(
          '${category.image}'
        )
      ),
      Text(
        '${category.name}',
        style: TextStyle(
          color: controller.app.secondaryColor,
          fontWeight: FontWeight.w500
        )
      ),
    ],
  );
}

class _PopularProductsWidget extends StatelessWidget {

  final HomeController controller;
  const _PopularProductsWidget(this.controller);

  @override
  Widget build(BuildContext context) => Container(
    height: 310.0,
    child: Column(
      children: [
        SizedBox(height: 20.0),
        ListTile(
          leading: Text(
            'Productos populares',
            style: TextStyle(
              color: controller.app.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.0
            ),
          ),
          onTap: () {},
        ),
        _ListProductsWidget(controller)
      ],
    ),
  );
}

class _ListProductsWidget extends StatelessWidget {

  final HomeController controller;
  const _ListProductsWidget(this.controller);

  @override
  Widget build(BuildContext context) => Container(
    height: 220.0,
    child: Observer(
      builder: (_) => ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.products.length,
        itemBuilder: (_, i) => _ProductItem(controller, controller.products[i], i)
      )
    ),
  );
}

class _ProductItem extends StatelessWidget {

  final HomeController controller;
  final Product product;
  final int index;

  const _ProductItem(
    this.controller,
    this.product,
    this.index
  );

  @override
  Container build(BuildContext context) => Container(
    width: 165.0,
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 15.0
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 10.0
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          spreadRadius: 1.0,
          offset: Offset(0.0, 0.0)
        )
      ],
      borderRadius: BorderRadius.circular(15.0)
    ),
    child: Stack(
      children: [
        _ProductItemContent(product, controller),
        Positioned(
          right: 0.0,
          top: 10.0,
          child: InkWell(
            child: Icon(
              (product.liked) ? Icons.favorite : Icons.favorite_border,
              size: 20.0,
              color: (product.liked) ? Colors.red : Colors.grey,
            ),
            onTap: () => controller.likeProduct(index),
          ),
        )
      ],
    ),
  );
}

class _ProductItemContent extends StatelessWidget {

  final Product product;
  final HomeController controller;

  const _ProductItemContent(
    this.product,
    this.controller
  );

  @override
  Positioned build(BuildContext context) => Positioned(
    child: Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15.0),
          Container(
            height: 90.0,
            padding: EdgeInsets.all(
              (product.name.toLowerCase().contains('hambur')) ? 10.0 : 7.0
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.50),
                  blurRadius: 10.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.0)
                )
              ]
            ),
            child: Image.asset('${product.image}')
          ),
          SizedBox(height: 25.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${product.name}',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 3.0),
              Text(
                '${product.subName}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11.0
                ),
              ),
              SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      color: controller.app.secondaryColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    height: 22.0,
                    width: 22.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 7.0,
                          offset: Offset(0.0, 0.0),
                          spreadRadius: 1
                        )
                      ]
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: controller.app.secondaryColor,
                        size: 14.0,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
