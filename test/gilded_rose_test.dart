import 'package:gilded_rose/item.dart';
import 'package:test/test.dart';
import 'package:gilded_rose/gilded_rose.dart';

main() {
  final result = """OMGHAI!
-------- day 0 --------
name, sellIn, quality
+5 Dexterity Vest, 10, 20
Aged Brie, 2, 0
Elixir of the Mongoose, 5, 7
Sulfuras, Hand of Ragnaros, 0, 80
Sulfuras, Hand of Ragnaros, -1, 80
Backstage passes to a TAFKAL80ETC concert, 15, 20
Backstage passes to a TAFKAL80ETC concert, 10, 49
Backstage passes to a TAFKAL80ETC concert, 5, 49

-------- day 1 --------
name, sellIn, quality
+5 Dexterity Vest, 9, 19
Aged Brie, 1, 1
Elixir of the Mongoose, 4, 6
Sulfuras, Hand of Ragnaros, 0, 80
Sulfuras, Hand of Ragnaros, -1, 80
Backstage passes to a TAFKAL80ETC concert, 14, 21
Backstage passes to a TAFKAL80ETC concert, 9, 50
Backstage passes to a TAFKAL80ETC concert, 4, 50

""";

  test('foo', () {
    final items = [
      new Item("+5 Dexterity Vest", 10, 20),
      new Item("Aged Brie", 2, 0),
      new Item("Elixir of the Mongoose", 5, 7),
      new Item("Sulfuras, Hand of Ragnaros", 0, 80),
      new Item("Sulfuras, Hand of Ragnaros", -1, 80),
      new Item("Backstage passes to a TAFKAL80ETC concert", 15, 20),
      new Item("Backstage passes to a TAFKAL80ETC concert", 10, 49),
      new Item("Backstage passes to a TAFKAL80ETC concert", 5, 49),
      // this conjured item does not work properly yet
      // new Item("Conjured Mana Cake", 3, 6)
    ];
    GildedRose app = new GildedRose(items);

    var reporetedText = "OMGHAI!\n";

    final days = 2;
    for (var i = 0; i < days; i++) {
      reporetedText += "-------- day $i --------\n";
      reporetedText += "name, sellIn, quality\n";
      for (var item in items) {
        reporetedText += "$item\n";
      }
      reporetedText += "\n";
      app.updateQuality();
    }

    expect(reporetedText, result);
  });
}
