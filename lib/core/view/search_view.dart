import 'package:flutter/material.dart';
import 'package:shop_it/core/viewmodel/search_view_model.dart';
import 'package:shop_it/product/constants/project_padding.dart';
import 'package:shop_it/product/packages/shopping_card.dart';
import 'package:shop_it/product/widgets/product_widget.dart';

class SearchWiew extends StatefulWidget {
  const SearchWiew({super.key});

  @override
  State<SearchWiew> createState() => _SearchWiewState();
}

class _SearchWiewState extends SearchViewModel {
  bool onChange(String value) {
    if (products.isNotEmpty) {
      for (var element in products) {
        if (element.title!.contains(value)) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          actions: const [ShoppingCard()],
        ),
        body: Padding(
          padding: ProjectPadding.buttonPadding,
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    onChange(value);
                  });
                },
                controller: controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.text = '';
                    },
                    icon: const Icon(Icons.cancel_outlined),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(model: products[index]);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
