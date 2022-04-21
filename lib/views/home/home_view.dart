import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/providers/token.dart';
import 'package:urun_katalog/view_model/product_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<Token>(context, listen: false).tokeis;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        // future: productsViewModel.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        print(token);
                      },
                      child: Container(
                        width: 110,
                        color: Colors.red,
                        // child: Image.network(productsViewModel.products![index].productModel!.),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
