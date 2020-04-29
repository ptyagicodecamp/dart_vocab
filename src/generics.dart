//Using Generics in Dart

import 'dart:collection';

void main() {
  mainCustomParams();
}

//D
//Example #1: Demonstrating use of single letter and descriptive words for generics
class Product {
  final int id;
  final double price;
  final String title;
  final Inventory _inventory;
  Product(this.id, this.price, this.title, this._inventory);

  @override
  String toString() {
    return "Price of ${this.title} is ${this.price}. "
        "Inventory has ${_inventory.amount} items in it.";
  }
}

class Inventory {
  final int amount;

  Inventory(this.amount);
}

//Custom type variables- Single letter
class Store<P, I> {
  final HashMap<P, I> catalog = HashMap<P, I>();

  List<P> get products => catalog.keys.toList();
  void updateInventory(P product, I inventory) {
    catalog[product] = inventory;
  }

  void printProducts() {
    catalog.keys.forEach((product) => print("Product: $product"));
  }
}

//Custom type variables- Descriptive
class MyStore<MyProduct, MyInventory> {
  final HashMap<MyProduct, MyInventory> catalog =
      HashMap<MyProduct, MyInventory>();

  List<MyProduct> get products => catalog.keys;

  void updateInventory(MyProduct product, MyInventory inventory) {
    catalog[product] = inventory;
  }

  void printProducts() {
    catalog.keys.forEach((product) => print("Product: $product"));
  }
}

void mainCustomParams() {
  Product milk = Product(1, 5.99, "Milk", Inventory(2));
  Product bread = Product(2, 4.50, "Bread", Inventory(3));

  Store<Product, Inventory> store1 = Store<Product, Inventory>();
  store1.updateInventory(milk, Inventory(20));
  store1.updateInventory(bread, Inventory(15));
  store1.printProducts();

  MyStore<Product, Inventory> store2 = MyStore<Product, Inventory>();
  store2.updateInventory(milk, Inventory(10));
  store2.updateInventory(bread, Inventory(12));
  store2.printProducts();
}
//-------

//Example #2: Generics methods

//Function's return type (T).
//Function's argument (List<T>).
//Function's local variable (T last).
T lastProduct<T>(List<T> products) {
  T last = products.last;
  print("Retrieving last product: ");
  return last;
}

mainGenericMethods() {
  Store<Product, Inventory> store = Store<Product, Inventory>();
  Product milk = Product(1, 5.99, "Milk", Inventory(20));
  Product bread = Product(2, 4.50, "Bread", Inventory(15));
  store.updateInventory(milk, Inventory(20));
  store.updateInventory(bread, Inventory(15));

  Product product = lastProduct(store.products);
  print(product.title);
}

//-------

//Example #3: Using Generics for classes

//Restricting the type of values that can be supplied to the class
class FreshProduce<T extends Product> {
  FreshProduce(int i, double d, String s);

  String toString() {
    return "Instance of Type: ${T}";
  }
}

mainGenericClass() {
  FreshProduce<Product> spinach = FreshProduce<Product>(3, 3.99, "Spinach");
  print(spinach.toString());

  //This code will give compile time error complaining that String is not of type Product
//  FreshProduce<String> spinach2 = FreshProduce<String>(3, 3.99, "Spinach");
//  print(spinach.toString());
}
