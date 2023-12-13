import 'package:flutter/material.dart';
import 'package:test_second/model/base/products_model.dart';
import 'package:test_second/service/categories_service.dart';

PageController controller = PageController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SecondPage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> color;
  late bool isFavorite;
  late Animation<double?> size;
  // late Animation<double> sequence ;

  @override
  void initState() {
    super.initState();
    isFavorite = false;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    color = ColorTween(begin: Colors.grey, end: Colors.red).animate(controller);
    controller.addStatusListener((status) {
      print(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        builder: (context, _) {
          return ListTile(
            trailing: IconButton(
              // iconSize: sequence.value,
              onPressed: () {
                if (!isFavorite) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
                isFavorite = !isFavorite;
              },
              icon: Icon(
                Icons.favorite,
                color: color.value,
              ),
            ),
          );
        },
        animation: controller,
      ),
    );
  }
}



class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: Text('HEllo'),
          ),
          FutureBuilder(
            future: CategoriesServiceImp().getAllProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                dynamic temp = snapshot.data;

                List<ProductsModel> products = List.generate(
                    temp.length, (index) => ProductsModel.fromMap(temp[index]));
                // List<ProductsModel> data = temp as List<ProductsModel>;

                if (temp.isEmpty) {
                  return Center(
                    child: Text('Empty'),
                  );
                } else {
                  return PageView.builder(
                    itemCount: products.length,
                    controller: controller,
                    itemBuilder: (context, index) => Scaffold(
                      backgroundColor: Colors.amber,
                      body: Container(
                        child: Text(products[index] as String),
                      ),
                    ),
                  );
                }
              } else {
                print(snapshot.error);
                return LinearProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
