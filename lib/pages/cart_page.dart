import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // remove item from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  // pay button tapped
  void payNow(){
    /*


fill out your payment service here


    */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading
              Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),

              // list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    // get individual Cart items
                    Coffee eachCoffee = value.userCart[index];

                    // return Coffee tile
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => removeFromCart(eachCoffee),
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
              ),

              // pay button
GestureDetector(
  onTap: payNow,
  child: Container(
    padding:const EdgeInsets.all(25),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.brown,
    borderRadius: BorderRadius.circular(12),
    ),
    child:  const Center(
      child: Text("Pay Now", style: TextStyle(color: Colors.white),
      ),
    ),
    
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}
