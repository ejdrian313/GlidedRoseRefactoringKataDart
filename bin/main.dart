import 'package:gilded_rose/gilded_rose.dart';
import 'package:gilded_rose/item.dart';

main(List<String> args) {
  print("OMGHAI!");

  final items = [
    new Item("+5 Dexterity Vest", 10, 20),
    new Item("Aged Brie", 2, 0),
    new Item("Elixir of the Mongoose", 5, 7),
    new Item("Sulfuras, Hand of Ragnaros", 0, 80),
    new Item("Sulfuras, Hand of Ragnaros", -1, 80),
    new Item("Backstage passes to a TAFKAL80ETC concert", 15, 20),
    new Item("Backstage passes to a TAFKAL80ETC concert", 10, 49),
    new Item("Backstage passes to a TAFKAL80ETC concert", 5, 49),
    new Item("Conjured Mana Cake", 3, 6)
  ];

  final app = new GildedRose(items);

  int days = 2;
  if (args.length > 0) {
    days = int.parse(args[0]) + 1;
  }

  for (int i = 0; i < days; i++) {
    print("-------- day $i --------");
    print("name, sellIn, quality");
    for (var item in items) {
      print(item);
    }
    print('');
    app.updateQuality();
  }
}
